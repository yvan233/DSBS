# Run the RoomControl_NoOcc and PumpControl tasks
import sys
sys.path.insert(1,".") 
from DASP.control import ControlMixin

startNode = "room_1"
controlMixin = ControlMixin("PI")

DappName = "RoomControl_NoOcc"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)

DappName = "PumpControl"
print("start task: "+DappName)
controlMixin.startTask(DappName,"pump")
