import time 
import sys
sys.path.insert(1,".") 
from DASP.control import ControlMixin

startNode = "room_1"
controlMixin = ControlMixin("PI")

DappName = "TimeSynch"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)
