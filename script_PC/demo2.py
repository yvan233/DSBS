# Launch the system and run the distributed algorithms in parallel
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
DappName = "BFStree"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)

time.sleep(1)
DappName = "ALST"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)

moniter.wait()