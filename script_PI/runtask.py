# 启动系统后运行分布式算法
# 另外需要运行./script_PC/moniter.py

import time 
import sys
sys.path.insert(1,".") # 把上一级目录加入搜索路径
from DASP.control import ControlMixin

rootnode = "room_1" # 根节点ID
Controlmixin = ControlMixin("PI") # 控制函数集合

DAPPname = "CreateBFStree"
print("开始任务：" + DAPPname)
Controlmixin.StartTask(DAPPname,rootnode)