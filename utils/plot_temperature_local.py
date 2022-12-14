# 读取数据库并绘制温度曲线
import time
import pymysql
from matplotlib import pyplot as plt
from matplotlib.animation import FuncAnimation
import matplotlib.animation as animation
import matplotlib.dates as mdates
from dateutil.parser import parse

HOST="localhost"
USER="root"
PASSWORD="cfins"
DB="mingze_simulator"

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
        self.title = name
        self.getinitdata()
        self.convdata()

    # 获取表内所有数据
    def getinitdata(self):  
        self.room_temp= db_read(self.cursor, self.name, 'room_temp', 0)

    # 转换数据成可以绘图的
    def convdata(self):
        self.dtime = [int(record[0]) for record in self.room_temp]
        self.temp = [float(record[3]) for record in self.room_temp]

    # 获取新增数据，防止对数据库造成过大的数据压力
    def updatedata(self):
        self.room_temp= db_read(self.cursor, self.name, 'room_temp', 0)

    # 清空子图
    def clear(self):
        self.ax.clear()
        
    # 绘制子图
    def display(self):
        self.ax.plot(self.dtime, self.temp,label = 'temp')
        self.ax.legend(loc='upper left',frameon=True,fontsize = "x-small")
        # self.ax.xaxis.set_major_formatter(mdates.DateFormatter('%H'))  # x轴只显示小时
        self.ax.set_xlabel("Time")
        self.ax.set_ylabel("Temp/°C")  #,rotation='horizontal')
        self.ax.set_title(self.title)

if __name__ == "__main__":
    fig = plt.figure(figsize=(16, 9))
    axlist = []
    roomlist = []

    nodelist = ["room1","room2","room3","room4","room5","room6"]

    for i,node in enumerate(nodelist):
        ax = fig.add_subplot(3, 2, i+1)
        room = Room(name = node,ax = ax)
        room.display()
        roomlist.append(room)
    plt.tight_layout() 
    plt.show()
