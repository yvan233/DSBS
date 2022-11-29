import copy
import time 

def taskFunction(self,id,nbrDirection,datalist):
    i = 0
    while True:
        # time.sleep(4)    # shutdown任务时会阻塞等待
        self.timesleep(4)  # shutdown任务时不会阻塞等待
        i += 1
        self.sendDatatoGUI("step:{}".format(i))
    return 0  