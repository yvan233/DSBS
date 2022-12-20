import argparse
import sys
sys.path.insert(1,".")
from DASP.control import ControlMixin

# 读取args的Node参数，用-n输入
parser = argparse.ArgumentParser()
parser.add_argument("--Node", type=str, default='room_1')
args = parser.parse_args()
startNode = args.Node

controlMixin = ControlMixin("PI") 

if startNode != "pump":
    DappName = "RoomControl"
    print("start task: "+DappName)
    controlMixin.startTask(DappName,startNode)
else:
    DappName = "PumpControl"
    print("start task: "+DappName)
    controlMixin.startTask(DappName,startNode)
