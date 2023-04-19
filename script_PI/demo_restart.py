# Restart the task after a reboot of the PI.
import argparse
import sys
sys.path.insert(1,".")
from DASP.control import ControlMixin

parser = argparse.ArgumentParser()
parser.add_argument("--node", type=str, default='room_1')
args = parser.parse_args()
startNode = args.node

controlMixin = ControlMixin("PI") 

if startNode != "pump":
    DappName = "RoomControl"
    print("start task: "+DappName)
    controlMixin.startTask(DappName,startNode)
else:
    DappName = "PumpControl"
    print("start task: "+DappName)
    controlMixin.startTask(DappName,startNode)
