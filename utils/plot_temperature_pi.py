# 读取数据库并绘制温度曲线
import os
import csv
import pymysql
import numpy as np
from matplotlib import pyplot as plt
import matplotlib.dates as mdates
from dateutil.parser import parse

HOST="localhost"
USER="root"
PASSWORD="cfins"
DB="room"



def db_read(cursor, table, name, num): 
    if num == 0:
        sql = "SELECT %s, %s, %s, %s FROM %s WHERE name='%s'" % ('time', 'id', 'name', 'value', table, name)
        cursor.execute(sql)
        data = cursor.fetchall()
    else:
        sql = "SELECT %s, %s, %s, %s FROM %s WHERE name='%s' order by time DESC limit %d" % ('time', 'id', 'name', 'value', table, name, num)
        cursor.execute(sql)
        data = cursor.fetchall()
    return list(data)

class Room:
    def __init__(self, name, ax, host = HOST, user = USER, passwd = PASSWORD, db = DB):
        self.name = name
        self.db = pymysql.connect(host=host, user=user, passwd=passwd, db=db)
        self.cursor = self.db.cursor()
        self.ax = ax
        self.title = name.replace('_', '')
        self.getinitdata()
        self.convdata()

    # 获取表内所有数据
    def getinitdata(self):  
        self.room_temp= db_read(self.cursor, 'room_states', 'room_temp', 0)
        self.outdoor_temp= db_read(self.cursor, 'room_states', 'outdoor_temp', 0)
        self.FCU_fan_feedback= db_read(self.cursor, 'room_states', 'FCU_fan_feedback', 0)
        self.FCU_onoff_feedback= db_read(self.cursor, 'room_states', 'FCU_onoff_feedback', 0)

    # 转换数据成可以绘图的
    def convdata(self):
        self.dtime = [str(9 + i//60) + ":" + str(i%60) for i in range(0,601)]
        self.dtime = [parse(i) for i in self.dtime]
    
        self.temp = np.zeros(601)
        for rec in self.room_temp:
            self.temp[rec[0]] = rec[3]
        self.outdoortemp = np.zeros(601)
        for rec in self.outdoor_temp:
            self.outdoortemp[rec[0]] = rec[3]
        self.FCU_fan = np.zeros(601)
        for rec in self.FCU_fan_feedback:
            self.FCU_fan[rec[0]] = rec[3]
        self.FCU_onoff = np.zeros(601)
        for rec in self.FCU_onoff_feedback:
            self.FCU_onoff[rec[0]] = rec[3]
        self.FCU = self.FCU_fan * self.FCU_onoff
        
    # 绘制子图
    def display(self):
        self.ax.plot(self.dtime, self.temp,'red', label = 'Indoor temperature')
        self.ax.plot(self.dtime, self.outdoortemp,'orange', label = 'Outdoor temperature')
        self.ax.axhline(24, linestyle='--', color='green',label = 'Indoor temperature setpoint',linewidth = 1.2)

        self.ax2 = self.ax.twinx()
        self.ax2.step(self.dtime, self.FCU,'royalblue',label = 'Fanspeed',linewidth = 1.2)

        self.ax.legend(loc='upper left',frameon=True,fontsize = 9)
        self.ax2.legend(loc='upper right',frameon=True,fontsize = 9)
        
        self.ax.set_ylim(20,31)
        self.ax2.set_ylim(-0.02,4.5)
        self.ax2.set_yticks([0,1,2,3])
        self.ax2.set_yticklabels(['Off','L','M','H'])    
        # for label in self.ax2.get_yticklabels():
        #     label.set_rotation(90)
        self.ax.xaxis.set_major_formatter(mdates.DateFormatter('%H:%M')) 
        self.ax.set_xlabel("Time")
        self.ax.set_ylabel("Temperature(°C)")  #,rotation='horizontal')
        self.ax2.set_ylabel("Fanspeed Level")
        self.ax.set_title(self.title)

if __name__ == "__main__":
    localpath = os.getcwd() + "/Dapp/Base/binding.csv"
    fig = plt.figure(figsize=(16, 9))
    axlist = []
    roomlist = []
    with open(localpath,'r')as f:
        data = csv.reader(f)
        binding = []
        for i in data:
            binding.append(i)

    i = 0
    for ele in binding[1:]:
        if ele[2] == "pi":
            if ele[1] != "offline" and i < 6:
                ax = fig.add_subplot(3, 2, i+1)
                room = Room(name = ele[0],ax = ax, host = ele[1])
                room.display()
                roomlist.append(room)
                i += 1
    plt.tight_layout() 
    plt.rcParams['savefig.dpi'] = 300
    plt.show()
