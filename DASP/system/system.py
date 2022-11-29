import socket
import sys
import threading
import time
sys.path.insert(1,".")  # 把上一级目录加入搜索路径
from DASP.module import DaspCommon, TaskServer, CommServer

class Server(object):
    def __init__(self, ID, GuiInfo, nbrID, nbrDirection, nbrDirectionOtherSide, RouteTable,IP,Port,datalist):
        DaspCommon.nodeID = ID
        DaspCommon.GuiInfo = GuiInfo
        DaspCommon.IP = socket.gethostbyname(IP)
        DaspCommon.Port = Port
        DaspCommon.nbrID = nbrID
        DaspCommon.nbrDirection = nbrDirection
        DaspCommon.nbrDirectionOtherSide = nbrDirectionOtherSide
        DaspCommon.RouteTable = RouteTable

    def run(self):
        #创建接口服务器
        self.commServerThread = []
        for _,port in enumerate(DaspCommon.Port[1:]):
            commserver = CommServer(DaspCommon.IP, port)
            t = threading.Thread(target=commserver.run,args=())
            t.setDaemon(True)
            self.commServerThread.append(t)

        taskserver = TaskServer(DaspCommon.IP,DaspCommon.Port[0])
        self.taskServerThread = threading.Thread(target=taskserver.run,args=())
        self.taskServerThread.setDaemon(True)
        self.systemTaskThread = threading.Thread(target=taskserver.systemtask,args=())
        self.systemTaskThread.setDaemon(True)

        for _,thread in enumerate(self.commServerThread):
            thread.start()
        self.taskServerThread.start()

    def runSystemTask(self):
        self.systemTaskThread.start()
        while True:
            time.sleep(1)

        

