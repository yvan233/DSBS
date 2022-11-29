import sys
sys.path.insert(1,".")
from DASP.module import Moniter

# 启动监控脚本
moniter = Moniter()
moniter.run()

moniter.wait()