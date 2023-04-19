# Simulate node failure and reconnect after node restart
import time 
import sys
sys.path.insert(1,".") 
from DASP.module import Node,Moniter
from DASP.control import ControlMixin

nodeNum = 9 
startNode = "room_1" 
nodelist = [] 
controlMixin = ControlMixin("Pc")

moniter = Moniter()
moniter.run()

for i in range(nodeNum):
    node = Node(i)
    nodelist.append(node)

# room_2 node temporarily disconnects and reconnects
time.sleep(10)
# kill room_2
node_num = 1
nodelist[node_num].kill()
# wait for the system to detect that room_2 has disconnected
time.sleep(160)

# restart room_2 node process
node = Node(node_num)
nodelist[node_num] = node

# room_2 node temporarily disconnects and reconnects
time.sleep(120)
nodelist[node_num].kill()
time.sleep(260)

# restart room_2 node process
node = Node(node_num)
nodelist[node_num] = node

moniter.wait()