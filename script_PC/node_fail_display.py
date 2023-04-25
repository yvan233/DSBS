# Simulate node failure and reconnecting to the system after the node restarts to display the current topology
# Start the FindTopology task to display the current topology
# You need to start the ./utils/plot_topology.py script to display the topology
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

time.sleep(2)
DappName = "FindTopology"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)


node_num = 8
# Heatpump disconnects and reconnects after the connection is deleted
time.sleep(10)
nodelist[node_num].kill()
time.sleep(240)

# restart node process
node = Node(node_num)
nodelist[node_num] = node

# restart the task
time.sleep(2)
controlMixin.startTask(DappName,"heatpump")
moniter.wait()