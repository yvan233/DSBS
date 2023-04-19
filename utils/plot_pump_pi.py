import os
import csv
import pymysql
from matplotlib import pyplot as plt
from matplotlib.animation import FuncAnimation
import matplotlib.animation as animation
import matplotlib.dates as mdates
from dateutil.parser import parse

HOST="localhost"
USER="root"
PASSWORD="cfins"
DB="pump"

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

class Pump:
    def __init__(self, name, ax, host = HOST, user = USER, passwd = PASSWORD, db = DB):
        self.name = name
        self.db = pymysql.connect(host=host, user=user, passwd=passwd, db=db)
        self.cursor = self.db.cursor()
        self.ax = ax
        self.title = name.replace('_', '')
        self.getinitdata()
        self.convdata()

    def getinitdata(self):  
        self.pump_supplytemp= db_read(self.cursor, 'pump_states', 'pump_supplytemp', 0)
        self.pump_returntemp= db_read(self.cursor, 'pump_states', 'pump_returntemp', 0)
        self.pump_frequency= db_read(self.cursor, 'pump_states', 'pump_frequency_feedback', 0)

    def convdata(self):
        self.dtime = [int(record[0]) for record in self.pump_supplytemp]
        self.dtime = [str(9 + i//60) + ":" + str(i%60) for i in self.dtime]
        self.dtime = [parse(i) for i in self.dtime]

        self.pump_supplytemp = [float(record[3]) for record in self.pump_supplytemp]
        self.pump_returntemp = [float(record[3]) for record in self.pump_returntemp]
        self.pump_frequency = [float(record[3]) for record in self.pump_frequency]
        
    def display(self):
        self.ax.plot(self.dtime, self.pump_supplytemp,'red', label = 'Supply Temperature')
        self.ax.plot(self.dtime, self.pump_returntemp,'royalblue', label = 'Return Temperature')

        self.ax2 = self.ax.twinx()
        self.ax2.plot(self.dtime, self.pump_frequency,'green',label = 'Frequency')

        self.ax.legend(loc='upper left',frameon=True,fontsize = "medium")
        self.ax2.legend(loc='upper right',frameon=True,fontsize = "medium")

 
        self.ax.xaxis.set_major_formatter(mdates.DateFormatter('%H:%M')) 
        self.ax.set_xlabel("Time")
        self.ax.set_ylabel("Temperature(°C)") 
        self.ax2.set_ylabel("Frequency(Hz)")
        self.ax.set_title(self.title)

if __name__ == "__main__":
    localpath = os.getcwd() + "/Dapp/Base/binding.csv"
    # 读取节点信息
    fig = plt.figure(figsize=(10, 6))
    with open(localpath,'r')as f:
        data = csv.reader(f)
        binding = []
        for i in data:
            binding.append(i)

    i = 0
    for ele in binding[1:]:
        if ele[2] == "pi":
            if ele[0] != "offline" and ele[0] == "pump":
                ax = fig.add_subplot(1, 1, 1)
                Pump = Pump(name = ele[0],ax = ax, host = ele[1])
                Pump.display()
                i += 1
    plt.tight_layout() 
    plt.rcParams['savefig.dpi'] = 300
    plt.show()
