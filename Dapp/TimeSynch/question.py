# 时间同步APP
import time
from datetime import datetime,timedelta
import os
def updatetime(offset):
    # 当时间偏差超过50ms,进行修正
    tmp1 = timedelta(milliseconds = 100)
    tmp2 = timedelta(milliseconds = -100)
    if offset >= tmp1 or offset <= tmp2:
        TIMEFORMAT = "%Y-%m-%d %H:%M:%S.%f"
        time = datetime.now()
        new_time = time+offset
        set_time = new_time.strftime(TIMEFORMAT)
        os.system("sudo timedatectl set-time '{}'".format(set_time))    
    
def taskFunction(self, id, nbrDirection, datalist):
    TIMEFORMAT = "%Y-%m-%d %H:%M:%S.%f"
    # 子节点向根节点发送数据框架
    if id == "communication_node":
        # 开启ntp
        os.system("sudo timedatectl set-ntp true")
        while True:
            if not self.descendantData.empty():
                # 非阻塞性地获取数据
                # data: 后代节点数据
                # path: 后代节点发送过来的路径，发送的节点在首位
                # recvtime: 接受到消息的时刻
                data, path, recvtime = self.descendantData.get_nowait()
                recvtime = recvtime.strftime(TIMEFORMAT)
                self.sendDatatoGUI("{}节点发送时间同步请求，发送时间为:{}".format(path[0],data))
                time3 = datetime.now().strftime(TIMEFORMAT)
                # 发送给后代节点时根据path传输，若path为空则进行广播
                self.sendDataToDescendant([data, recvtime, time3], path)
            else:
                time.sleep(0.01)

    else:
        # 关闭ntp
        os.system("sudo timedatectl set-ntp false")
        while True:
            time1 = datetime.now().strftime(TIMEFORMAT)
            self.sendDataToRoot(time1)
            # 阻塞性地获取数据
            # data: 根节点数据
            # recvtime: 接受到消息的时刻
            data, recvtime = self.rootData.get()
            recvtime = recvtime.strftime(TIMEFORMAT)
            data.append(recvtime)
            # self.sendDatatoGUI(str(data))
            T = [datetime.strptime(ele,TIMEFORMAT) for ele in data]
            # delay = (T[1]-T[0]+T[3]-T[2])
            offset = (T[1]-T[0]+T[2]-T[3])/2
            if offset < timedelta(seconds = 0):
                self.sendDatatoGUI("与时间服务器的时间偏差为-{}".format(-offset))
            else:
                self.sendDatatoGUI("与时间服务器的时间偏差为{}".format(offset))
            # updatetime(offset)
            time.sleep(60*60)  #1小时同步一次
