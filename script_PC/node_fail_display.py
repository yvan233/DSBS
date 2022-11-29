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
    node = Node(i)
    nodelist.append(node)

time.sleep(2)
DappName = "FindTopology"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)


node_num = 8
# Heatpump断开并被删除连接后重连
time.sleep(10)
nodelist[node_num].kill()
time.sleep(120)

# 重新启动节点进程
node = Node(node_num)
nodelist[node_num] = node
controlMixin.stopTask(DappName,"pump")

time.sleep(2)
controlMixin.startTask(DappName,startNode)
moniter.wait()