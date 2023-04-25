import ctypes
import datetime
import inspect
import json
import platform
import select
import socket
import struct
import threading
import time

class Const():
    RECONNECT_FAIL_LIMIT = 3
    RECONNECT_TIME_INTERVAL = 30
    SYSTEM_TASK_TIME = 120

class TcpSocket():
    headformat = "!2I"
    headerSize = 8
    def __init__(self, ID, ip, port, owner):
        self.ID = ID
        self.ip = ip
        self.port = port
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.set_keep_alive()
        self.sock.settimeout(5)
        self.sock.connect((self.ip, self.port))
        self.owner = owner

        # heartbeat
        self.fail_count = 0
        self.fail_limit = Const.RECONNECT_FAIL_LIMIT
        self.time_interval = Const.RECONNECT_TIME_INTERVAL
        self.state = "passing"

    def close(self):
        self.sock.close()

    def sendall(self, jsondata, methods = 1):
        '''
        为发送的json数据添加methods和length报头
            POST: methods = 1
            REFUSE: methods = 9
        '''
        body = json.dumps(jsondata)
        header = [methods, body.__len__()]
        headPack = struct.pack(TcpSocket.headformat , *header)
        try:
            self.sock.sendall(headPack+body.encode())
        except:
            self.do_fail()
        else:
            self.do_pass()

    def sendall_recv(self, jsondata, methods = 1):
        '''
        为发送的json数据添加methods和length报头，并等待接收方的回复
            POST: methods = 1
            REFUSE: methods = 9
        '''
        self.sock.setblocking(False)  # 将socket设置为非阻塞模式
        body = json.dumps(jsondata)
        header = [methods, body.__len__()]
        headPack = struct.pack(TcpSocket.headformat , *header)
        try:
            self.sock.sendall(headPack+body.encode())
        except:
            self.do_fail()
        else:
            ready_to_read, _, _ = select.select([self.sock], [], [], 3)
            if ready_to_read:
                try:
                    data = self.sock.recv(1024)
                    self.do_pass()
                except:
                    self.do_fail()
                else:
                    if not data: # 连接断开
                        self.do_fail()
            else: # 超时
                self.do_fail()

    @staticmethod
    def recv(conn):
        '''
        循环接收数据，直到收完报头中length长度的数据
        '''
        dataBuffer = bytes()
        while True:
            data = conn.recv(1024)
            # if data == b"":
            #     break
            if data:
                dataBuffer += data
                while True:
                    if len(dataBuffer) < TcpSocket.headerSize:
                        break
                    # 读取包头
                    headPack = struct.unpack(TcpSocket.headformat, dataBuffer[:TcpSocket.headerSize])
                    bodySize = headPack[1]
                    if len(dataBuffer) < TcpSocket.headerSize+bodySize :
                        break
                    body = dataBuffer[TcpSocket.headerSize:TcpSocket.headerSize+bodySize]
                    body = body.decode()
                    body = json.loads(body)
                    return headPack,body

    def set_keep_alive(self):
        """
        设置套接字保活机制
        30s后没反应开始探测连接，30s探测一次，一共探测10次，失败则断开
        """
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
        if platform.system() == "Windows":
            self.sock.ioctl(socket.SIO_KEEPALIVE_VALS,(1,30*1000,30*1000))

        if platform.system() == "Linux":
            self.sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPIDLE, 30)
            self.sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPINTVL, 30)
            self.sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPCNT, 10)

    def do_pass(self):
        if self.state == "failing":
            self.owner.sendRunDatatoGUI(f"Reconnected successfully with neighbor node {self.ID}.") 
        self.state = "passing"
        self.fail_count = 0

    def do_fail(self):
        if self.fail_count == 0:
            self.first_fail_time = datetime.datetime.now()
            self.state = "failing"
            self.thread = threading.Thread(target=self.reconnect)
            self.thread.start()
            self.owner.sendRunDatatoGUI(f"Connection to neighbor node {self.ID} failed, trying to reconnect.") 
        self.fail_count += 1
        if self.fail_count >= self.fail_limit and datetime.datetime.now()-self.first_fail_time >= datetime.timedelta(seconds=self.fail_limit*self.time_interval):
            self.state = "failed"
            # 关闭节点连接
            self.owner.deleteTaskNbrID(self.ID)

    def reconnect(self):
        while self.state == "failing":
            time.sleep(self.time_interval)
            try:
                self.sock.close()
            except:
                pass
            try:
                self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.set_keep_alive()
                self.sock.settimeout(5)
                self.sock.connect((self.ip, self.port))
            except:
                self.do_fail()
            else:
                self.do_pass()


class DaspCommon():
    '''
    Dasp公共变量及函数


    属性:
        nodeID: 节点ID
        IP: 节点IP
        Port: 节点端口列表
        nbrID: 邻居ID
        nbrDirection: 邻居方向
        nbrDirectionOtherSide: 节点在邻居的方向
        nbrSocket: 邻居通信套接字
        RouteTable: 邻居IP及端口列表
        GuiInfo: UI界面IP及端口
        headformat: 自定义消息头格式，methods+length，2个无符号整形变量
        headerSize: 自定义消息头长度，8个字节
        systemFlag: 系统标志，用于判断系统是否初始化完成
        (包括读取拓扑文件的信息，以及所有类共有的信息)
    '''
    # 类变量，直接通过DaspCommon.维护
    nodeID = ""
    IP = ""
    Port = []
    nbrID = []
    nbrDirection = []
    nbrDirectionOtherSide = []
    nbrSocket = {}
    RouteTable = []
    GuiInfo = ["localhost",50000]    
    headformat = "!2I"
    headerSize = 8
    systemFlag = False
    def __init__(self):
        pass

    def sendtoGUIbase(self, info, key, DappName):
        """
        通过UDP的形式将信息发送至GUI
        """
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            addr = (DaspCommon.GuiInfo[0], DaspCommon.GuiInfo[1])
            data = {
                "key": key,
                "id": DaspCommon.nodeID,
                "DappName":DappName,
                "time": datetime.datetime.now().strftime("%m-%d %H:%M:%S"),
                "info": info
            }
            sock.sendto(json.dumps(data).encode('utf-8'), addr)
            sock.close()
        except Exception as e:
            print ("Failed to send" + info)

    def deleteNbrID(self, id):  
        """
        删除本节点和指定id邻居节点的所有连接(DaspCommon类变量)
        """
        
        if id in DaspCommon.nbrID:
            index = DaspCommon.nbrID.index(id)      
            del DaspCommon.nbrID[index]
            del DaspCommon.nbrDirection[index]
        for ele in DaspCommon.RouteTable:
            if ele:
                if ele[4] == id:
                    DaspCommon.RouteTable.remove(ele)
        if id in DaspCommon.nbrSocket:
            del DaspCommon.nbrSocket[id]

    def _async_raise(self, tid, exctype):
        '''
        主动抛出异常
        '''
        tid = ctypes.c_long(tid)
        if not inspect.isclass(exctype):
            exctype = type(exctype)
        res = ctypes.pythonapi.PyThreadState_SetAsyncExc(tid, ctypes.py_object(exctype))
        if res == 0:
            raise ValueError("invalid thread id")
        elif res != 1:
            # """if it returns a number greater than one, you're in trouble,
            # and you should call it again with exc=NULL to revert the effect"""
            ctypes.pythonapi.PyThreadState_SetAsyncExc(tid, None)
            raise SystemError("PyThreadState_SetAsyncExc failed")

    def stop_thread(self, thread):
        '''
        强制停止某个线程
        '''
        self._async_raise(thread.ident, SystemExit)
