# Launch the system and do nothing
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

moniter.wait()