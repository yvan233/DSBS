# Test the node starts one by one, step by step into the network
import time 
import sys
sys.path.insert(1,".")
from DASP.module import Node,Moniter
from DASP.control import ControlMixin


nodelist = []
controlMixin = ControlMixin("Pc")

moniter = Moniter()
moniter.run()

node = Node(0)
nodelist.append(node)
print("start system")

time.sleep(15)
print("start room_2")
node = Node(1)
nodelist.append(node)

time.sleep(15)
print("start room_3")
node = Node(2)
nodelist.append(node)

moniter.wait()