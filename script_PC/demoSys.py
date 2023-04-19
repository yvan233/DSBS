# Gradual start node in reverse order
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
    node = Node(nodeNum-1-i)
    nodelist.append(node)
    time.sleep(1)

time.sleep(2)
DappName = "ALST"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)

moniter.wait()