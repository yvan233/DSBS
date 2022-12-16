# 读取数据库并绘制温度曲线
import csv
import os
import pymysql
from matplotlib import pyplot as plt
from matplotlib.animation import FuncAnimation
import matplotlib.animation as animation
import matplotlib.dates as mdates
import datetime as dt
from dateutil.parser import parse

def db_read(cursor, table, name, num):               # num 为倒序读取数据条目数，0表示读取全部
    if num == 0:
        sql = "SELECT %s, %s, %s, %s FROM %s WHERE name='%s'" % ('time', 'id', 'name', 'value', table, name)
        cursor.execute(sql)
        data = cursor.fetchall()
    else:
        sql = "SELECT %s, %s, %s, %s FROM %s WHERE name='%s' order by time DESC limit %d" % ('time', 'id', 'name', 'value', table, name, num)
        cursor.execute(sql)
        data = cursor.fetchall()
    return list(data)

def db_read_after_beforetime(cursor, table, name, beforetime) :
    sql = "SELECT %s, %s, %s, %s FROM %s WHERE name='%s' and time > '%s' " % ('time', 'id', 'name', 'value', table, name, beforetime)
    cursor.execute(sql)
    data = cursor.fetchall()
    return list(data)

class Room:
    def __init__(self, host, user, passwd, db, type,ax,title):
        self.db = pymysql.connect(host=host, user=user, passwd=passwd, db=db)
        self.cursor = self.db.cursor()
        self.type = type
        self.ax = ax
        self.title = title
        self.getinitdata()
        self.beforetime = self.room_temp1[-1][0] # 记录当前时间节点
        self.convdata()
        
    # 获取表内所有数据
    def getinitdata(self):  
        self.room_temp1= db_read(self.cursor, 'sensor_room_his', 'room_temp1', 0)
        self.room_RH1= db_read(self.cursor, 'sensor_room_his', 'room_RH1', 0)
        if self.type == 1:
            self.room_temp2= db_read(self.cursor, 'sensor_room_his', 'room_temp2', 0)
            self.room_RH2= db_read(self.cursor, 'sensor_room_his', 'room_RH2', 0)
        self.db.commit()

    # 转换数据成可以绘图的
    def convdata(self):
        self.dtime = [parse(record[0]) for record in self.room_temp1]
        self.temp1 = [float(record[3]) for record in self.room_temp1]
        self.rh1 = [float(record[3]) for record in self.room_RH1]

        if self.type == 1:
            self.temp2 = [float(record[3]) for record in self.room_temp2]
            self.rh2 = [float(record[3]) for record in self.room_RH2]

    # 获取新增数据，防止对数据库造成过大的数据压力
    def updatedata(self):
        room_temp1_new = db_read_after_beforetime(self.cursor, 'sensor_room_his', 'room_temp1', self.beforetime)
        room_RH1_new = db_read_after_beforetime(self.cursor, 'sensor_room_his', 'room_RH1', self.beforetime)
        if(room_temp1_new):
            self.room_temp1= self.room_temp1 + room_temp1_new
        if(room_RH1_new):
            self.room_RH1 = self.room_RH1+ room_RH1_new

        if self.type == 1:
            room_temp2_new = db_read_after_beforetime(self.cursor, 'sensor_room_his', 'room_temp2', self.beforetime)
            room_RH2_new = db_read_after_beforetime(self.cursor, 'sensor_room_his', 'room_RH2', self.beforetime)
            if(room_temp2_new):
                self.room_temp2= self.room_temp2 + room_temp2_new
            if(room_RH2_new):
                self.room_RH2 = self.room_RH2+ room_RH2_new
        self.beforetime = self.room_temp1[-1][0]  #更新当前时间 
        self.db.commit()

    # 清空子图
    def clear(self):
        self.ax.clear()
        self.ax2.clear()
        self.ax2.setvisible(False)
        
    # 绘制子图
    def display(self):
        L = 10 * 60 # 显示最近的10个小时数据
        self.ax.plot(self.dtime[-L:], self.temp1[-L:],'tomato',label = 't1')
        self.ax2 = self.ax.twinx()  #共享X轴
        self.ax2.plot(self.dtime[-L:], self.rh1[-L:],'royalblue',label = 'h1')
        if self.type == 1:
            self.ax.plot(self.dtime[-L:], self.temp2[-L:],'darkorange',label = 't2')
            self.ax2.plot(self.dtime[-L:], self.rh2[-L:],'green',label = 'h2')
        self.ax.legend(loc='upper left',frameon=True,fontsize = "x-small")
        self.ax2.legend(loc='upper right',frameon=True,fontsize = "x-small")
        self.ax.xaxis.set_major_formatter(mdates.DateFormatter('%H'))  # x轴只显示小时
        self.ax.set_xlabel("Time/h")
        self.ax.set_ylabel("Temp/°C")  #,rotation='horizontal')
        self.ax2.set_ylabel("Humi/%")  #,rotation='horizontal')
        self.ax.set_title(self.title,fontsize=12,fontproperties="SimHei")

# 动画函数
def animate(i, roomlist):
    for room in roomlist:
        room.updatedata()
        room.convdata()
        room.clear()
        room.display()
    print ("当前更新时间", roomlist[0].dtime[-1])

def readnode():
    path = os.getcwd() + "\\debug\\binding_temp.csv"
    # 读取节点信息
    with open(path,'r')as f:
        data = csv.reader(f)
        idiplist = []
        for i in data:
            idiplist.append(i)
    return idiplist

fig = plt.figure()  #创建图像fig
axlist = []
roomlist = []
typelist = [1,1,1,2,2,2,2,0,0,0,0,0]  #房间类型列表  1：2个传感器  2：1个传感器  0：其他类型
idiplist = readnode()
i = 0  #房间编号
n = 0  #实际在线编号
for ele in idiplist[1:]:
    if ele[1] != "false": 
        ax = fig.add_subplot(3, 3, n+1) #增加1x1子图
        room = Room(type = typelist[i],ax = ax, title = ele[0], host=ele[1], user="root", passwd="cfins", db="data")
        room.display()
        roomlist.append(room)
        n = n+1
    i = i+1
#调用animation方法，对象：画布fig,动画函数：animate，函数调用数值fargs：(xs, ys)，数据更新频率interval/ms
ani = animation.FuncAnimation(fig, animate, fargs=(roomlist,), interval=120000)
plt.tight_layout() 
plt.show()
