# Run the FindTopology task to display the current topology
import time 
import sys
sys.path.insert(1,".") 
from DASP.control import ControlMixin

startNode = "room_1" 
controlMixin = ControlMixin("PI") 

DappName = "ALST"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)

time.sleep(5)
DappName = "FindTopology"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)
