# import需求模块
import random
from DASP.module import Task
# 用户自定义函数区
"""
用户编码区域
"""
# 定义算法主函数taskFunction(self,id,nbrDirection,datalist)
# 四个形参分别为节点类，节点ID，节点邻居对应的方向以及初始化时键入的数据
def taskFunction(self:Task, id, nbrDirection, datalist):
    temp = round(random.uniform(0,30))
    self.sendDatatoGUI(f"初始温度为：{temp}")
    maxtemp = temp
    for m in range(10):
        tdata = [maxtemp]*len(nbrDirection)
        data = self.transmitData(nbrDirection,tdata)
        nbrDirection = data[0]
        nbrData = data[1]
        for i in range(len(nbrData)):
            if nbrData[i] > maxtemp:
                maxtemp = nbrData[i]
        self.sendDatatoGUI(f"第{m+1}步完成,当前最大温度:{maxtemp}")
    value = maxtemp
    # value为返回值，可为JSON能解析的任意格式
    return value


