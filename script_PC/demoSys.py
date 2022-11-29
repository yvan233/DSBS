# 启动系统并运行分布式算法
import time 
import sys
sys.path.insert(1,".") # 把上一级目录加入搜索路径
from DASP.module import Node,Moniter
from DASP.control import ControlMixin

nodeNum = 9  # 节点数量
startNode = "room_1" # 起始节点ID
nodelist = [] # 节点进程列表
controlMixin = ControlMixin("Pc") # 控制函数集合

# 启动监控脚本
moniter = Moniter()
moniter.run()

# 启动节点进程
for i in range(nodeNum):
    node = Node(nodeNum-1-i)
    nodelist.append(node)
    time.sleep(1)

time.sleep(2)
DappName = "ALST"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)

moniter.wait()