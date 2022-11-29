import json
import socket
import struct
import os
import codecs
import csv
class ControlMixin():
    '''DASP控制函数混合

    mode = "Pc":Pc上仿真运行
    mode = "PI":树莓派上实际运行
    '''
    headformat = "!2I"
    headerSize = 8
    Databaseinfo = {
        'host': "127.0.0.1",
        'port': 3306,
        'user': 'root',
        'password': 'DSPadmin',
    }
    
    def __init__(self, mode):
        
        path = os.getcwd() + "/Dapp/Base/topology.json"
        path = path.replace('\\', '/')  
        text = codecs.open(path, 'r', 'utf-8').read()
        js = json.loads(text)
        self.localIP = socket.gethostbyname(socket.gethostname())
        self.TaskPortDict = {}
        self.IPDict = {}
        for ele in js:
            if "ID" in ele:
                self.TaskPortDict[ele["ID"]] = ele["Port"][0]
                self.IPDict[ele["ID"]] = self.localIP
        if mode == "PI":
            path = os.getcwd() + "/Dapp/Base/binding.csv"
            # 读取节点信息
            with open(path,'r')as f:
                data = csv.reader(f)
                for ele in data:
                    self.TaskPortDict[ele[0]] = 10000
                    self.IPDict[ele[0]] = ele[1]
                    

    def sendall_length(self, socket, jsondata, methods = 1):
        '''为发送的json数据添加methods和length报头
            POST：methods = 1: 
        '''
        body = json.dumps(jsondata)
        header = [methods, body.__len__()]
        headPack = struct.pack(self.headformat , *header)
        socket.sendall(headPack+body.encode())

    def startTask(self, DappName, nodeID):
        '''
        以nodeID为发起节点运行指定名称的DAPP
        '''
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((self.IPDict[nodeID], self.TaskPortDict[nodeID]))
        data = {
            "key": "newtask",
            "DappName": DappName
        }
        self.sendall_length(s, data)
        s.close()

    def startTaskList(self, DappNamelist, nodeID):
        '''
        以nodeID为发起节点运行指定名称的DAPP列表
        '''
        if DappNamelist:
            for ele in DappNamelist:
                self.startTask(ele, nodeID)

    def pauseTask(self, DappName, nodeID):
        '''
        以nodeID为根节点暂停运行指定名称的DAPP
        '''
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((self.IPDict[nodeID], self.TaskPortDict[nodeID]))
        data = {
            "key": "pausetask",
            "DappName": DappName
        }
        self.sendall_length(s, data)
        s.close()

    def resumeTask(self, DappName, nodeID):
        '''
        以nodeID为根节点恢复运行指定名称的DAPP
        '''
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((self.IPDict[nodeID], self.TaskPortDict[nodeID]))
        data = {
            "key": "resumetask",
            "DappName": DappName
        }
        self.sendall_length(s, data)
        s.close()

    def stopTask(self, DappName, nodeID):
        '''
        以nodeID为根节点停止运行指定名称的DAPP
        '''
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((self.IPDict[nodeID], self.TaskPortDict[nodeID]))
        data = {
            "key": "shutdowntask",
            "DappName": DappName
        }
        self.sendall_length(s, data)
        s.close()

if __name__ == '__main__':
    ControlMixin = ControlMixin(mode = "PI")
    print(ControlMixin.IPDict)