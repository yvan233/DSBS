# 模拟节点故障，并在节点重启后重连进系统
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

# room_2短暂断开并重连
time.sleep(10)
# kill room_2
node_num = 1
nodelist[node_num].kill()
# 等待系统检测到room_2断开
time.sleep(160)

# 重新启动room_2节点进程
node = Node(node_num)
nodelist[node_num] = node


# room_2断开并被删除连接后重连
time.sleep(120)
nodelist[node_num].kill()
time.sleep(260)

# 重新启动room_2节点进程
node = Node(node_num)
nodelist[node_num] = node

moniter.wait()