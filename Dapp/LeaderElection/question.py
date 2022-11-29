import copy
import time 

def taskFunction(self,id,nbrDirection,datalist):
    # init 
    # 生成树节点标识
    min_id = id
    for m in range(10):  # 迭代节点数量的轮次数
        _, nbrData = self.transmitData(nbrDirection, [min_id]*len(nbrDirection))       
        for ele in nbrData:
            if ele < min_id:
                min_id = ele
        self.sendDatatoGUI("min "+min_id)
    if min_id == id:
        self.sendDatatoGUI("This is leader")
    return 0