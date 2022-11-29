import csv
import codecs
import json
import subprocess
import time
import os
os.chdir('/home/pi/honeycomb')
import system
if __name__ == '__main__':
    time.sleep(2)
    path = "/home/pi/honeycomb/Dapp/Base/binding.csv"
    with open(path,'r')as f:
        data = csv.reader(f)
        idiplist = []
        for i in data:
            idiplist.append(i)

    p = subprocess.Popen("hostname -I", shell=True, stdout=subprocess.PIPE)
    nodeIP = p.stdout.read()
    nodeIP = str(nodeIP,encoding = 'UTF-8').strip(' \n')
    selfID = 0
    GuiInfo = ["localhost",50000]
    for ele in idiplist:
        if ele[2] == "server":
            GuiInfo = [ele[1],50000]
        elif ele[1] == nodeIP:
            selfID = ele[0]
            break
    if selfID:
        IP = []
        PORT = []
        ID = []
        nbrID = []
        datalist = []
        nbrDirection = []
        path = "/home/pi/honeycomb/Dapp/Base/topology.json"
        text = codecs.open(path, 'r', 'utf-8').read()
        js = json.loads(text)
        for ele in js:
            if "ID" in ele:
                ID.append(ele["ID"])
                tmpIP = ""
                for ele2 in idiplist:
                    if ele2[0] == ele["ID"]:
                        tmpIP = ele2[1]
                        break
                IP.append(tmpIP)
                PORT.append([10000, 10001, 10002, 10003, 10004, 10005, 10006])
                nbrID.append(ele["nbrID"])
                nbrDirection.append(ele["nbrDirection"])
                datalist.append(ele["datalist"])
                
        order = ID.index(selfID)
        selfNbrID = nbrID[order]
        selfNbrDirection = nbrDirection[order]
        selfIP = IP[order]
        selfPORT = PORT[order]
        selfDatalist = datalist[order]
        selfRouteTable = []
        selfNbrDirectionOtherSide = {}
        n = len(IP)
        for i in range(len(selfNbrID)):
            selfRouteTable.append([])
            direction = selfNbrDirection[i]
            selfRouteTable[i].append(selfIP)
            selfRouteTable[i].append(selfPORT[direction])
            for j in range(n):
                if ID[j] == selfNbrID[i]:
                    selfRouteTable[i].append(IP[j])
                    for k in range(len(nbrID[j])):
                        if nbrID[j][k] == selfID:
                            selfRouteTable[i].append(PORT[j][nbrDirection[j][k]])
                            selfNbrDirectionOtherSide[ID[j]] = nbrDirection[j][k]
                            break
                    selfRouteTable[i].append(ID[j])
                    break
                
        selfRouteTableprint = [str(ele) for ele in selfRouteTable]
        print("RouteTable: "+ json.dumps(selfRouteTableprint, indent=2))
        server = system.Server(selfID, GuiInfo, selfNbrID, selfNbrDirection, selfNbrDirectionOtherSide, selfRouteTable, selfIP, selfPORT, selfDatalist)
        server.run()
        time.sleep(5)  # wait for other nodes to start
        server.runSystemTask()
    else:
        print("该节点IP未被录入！")



