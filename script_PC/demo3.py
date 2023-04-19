# Test pause and resume function
# You can modify the form of timesleep in ./DASP/task_info/testpause/question to compare the difference
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
DappName = "testpause"
print("start task")
controlMixin.startTask(DappName,startNode)

time.sleep(5)
print("send pause signal")
controlMixin.pauseTask(DappName,startNode)

time.sleep(5)
print("send resume signal")
controlMixin.resumeTask(DappName,startNode)

time.sleep(5)
print("send stop signal")
controlMixin.stopTask(DappName,startNode)

moniter.wait()