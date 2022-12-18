import time
from datetime import datetime,timedelta
import os
from DASP.module import Task
def updatetime(offset):
    tmp1 = timedelta(milliseconds = 100)
    tmp2 = timedelta(milliseconds = -100)
    if offset >= tmp1 or offset <= tmp2:
        TIMEFORMAT = "%Y-%m-%d %H:%M:%S.%f"
        time = datetime.now()
        new_time = time+offset
        set_time = new_time.strftime(TIMEFORMAT)
        os.system("sudo timedatectl set-time '{}'".format(set_time))    
    
def taskFunction(self:Task, id, nbrDirection, datalist):
    TIMEFORMAT = "%Y-%m-%d %H:%M:%S.%f"
    if self.parentDirection == -1:
        os.system("sudo timedatectl set-ntp true")
        while True:
            if not self.descendantData.empty():
                data, path, recvtime = self.descendantData.get_nowait()
                recvtime = recvtime.strftime(TIMEFORMAT)
                self.sendDatatoGUI("Node{} sends a time synchronization request on {}".format(path[0],data))
                time3 = datetime.now().strftime(TIMEFORMAT)
                self.sendDataToDescendant([data, recvtime, time3], path)
            else:
                time.sleep(0.01)

    else:
        # 关闭ntp
        os.system("sudo timedatectl set-ntp false")
        while True:
            time1 = datetime.now().strftime(TIMEFORMAT)
            self.sendDataToRoot(time1)
            data, recvtime = self.rootData.get()
            recvtime = recvtime.strftime(TIMEFORMAT)
            data.append(recvtime)
            T = [datetime.strptime(ele,TIMEFORMAT) for ele in data]
            offset = (T[1]-T[0]+T[2]-T[3])/2
            if offset < timedelta(seconds = 0):
                self.sendDatatoGUI("The time deviation from the time server is -{}".format(-offset))
            else:
                self.sendDatatoGUI("The time deviation from the time server is {}".format(offset))
            time.sleep(60*60) 
