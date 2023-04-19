# Stop the control task
import sys
sys.path.insert(1,".") 
from DASP.control import ControlMixin

startNode = "room_1" 
controlMixin = ControlMixin("PI")

DappName = "RoomControl"
print("stop task: "+DappName)
controlMixin.stopTask(DappName,startNode)

DappName = "PumpControl"
print("stop task: "+DappName)
controlMixin.stopTask(DappName,"pump")
