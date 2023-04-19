import os
import csv
import pymysql
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

    def getinitdata(self):  
        self.occupant_num= db_read(self.cursor, 'room_states', 'occupant_num', 0)
        self.FCU_onoff= db_read(self.cursor, 'room_states', 'FCU_onoff_feedback', 0)

    def convdata(self):
        self.dtime = [int(record[0]) for record in self.FCU_onoff]
        self.dtime = [str(9 + i//60) + ":" + str(i%60) for i in self.dtime]
        self.dtime = [parse(i) for i in self.dtime]

        self.occupancy = [float(record[3]) for record in self.occupant_num]
        self.FCU_onoff = [float(record[3]) for record in self.FCU_onoff]

    def display(self):
        if self.name == "room_1":

            self.ax.step(self.dtime, self.occupancy,'red', label = 'Occupancy')

            self.ax2 = self.ax.twinx()
            self.ax2.step(self.dtime, self.FCU_onoff,'royalblue',label = 'Fan On-off')

            self.ax.legend(loc='upper left',frameon=True,fontsize = "medium")
            self.ax2.legend(loc='upper right',frameon=True,fontsize = "medium")

            self.ax2.set_yticks([0,1])
            self.ax2.set_yticklabels(['Off','On'])    
            self.ax.xaxis.set_major_formatter(mdates.DateFormatter('%H:%M')) 
            self.ax.set_xlabel("Time")
            self.ax.set_ylabel("Occupant Number") 
            self.ax2.set_ylabel("On-off State")
            self.ax.set_title(self.title)
        else:
            self.occupancy = [0 if i == 0 else 1 for i in self.occupancy]
            self.ax.step(self.dtime, self.occupancy,'red', label = 'Occupancy')

            self.ax2 = self.ax.twinx()
            self.ax2.step(self.dtime, self.FCU_onoff,'royalblue',label = 'Fan On-off')

            self.ax.legend(loc='upper left',frameon=True,fontsize = "medium")
            self.ax2.legend(loc='upper right',frameon=True,fontsize = "medium")

            self.ax.set_yticks([0,1])
            self.ax.set_yticklabels(['0','1'])  
            self.ax2.set_yticks([0,1])
            self.ax2.set_yticklabels(['Off','On'])    
            self.ax.xaxis.set_major_formatter(mdates.DateFormatter('%H:%M')) 
            self.ax.set_xlabel("Time")
            self.ax.set_ylabel("Occupancy") 
            self.ax2.set_ylabel("On-off State")
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
