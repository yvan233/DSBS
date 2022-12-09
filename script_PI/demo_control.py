# 启动系统并运行分布式算法
import time 
import sys
sys.path.insert(1,".") # 把上一级目录加入搜索路径
from DASP.control import ControlMixin

startNode = "room_1" # 起始节点ID
controlMixin = ControlMixin("PI") # 控制函数集合

DappName = "RoomControl"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)

DappName = "PumpControl"
print("start task: "+DappName)
controlMixin.startTask(DappName,"pump")
