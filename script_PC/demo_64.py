# Launch 64 nodes and start task "ALST" on node "1"
import sys
sys.path.insert(1,".") 
from DASP.module import Node,Moniter
from DASP.control import ControlMixin

nodeNum = 64  
startNode = "1" 
nodelist = [] 
controlMixin = ControlMixin("Pc") 

moniter = Moniter()
moniter.run()

for i in range(nodeNum):
    node = Node(i)
    nodelist.append(node)

DappName = "ALST"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)

moniter.wait()