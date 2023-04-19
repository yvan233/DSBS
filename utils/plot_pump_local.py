import pymysql
from matplotlib import pyplot as plt
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
        self.pump_supplytemp= db_read(self.cursor, 'pump1', 'pump_supplytemp', 0)
        self.pump_returntemp= db_read(self.cursor, 'pump1', 'pump_returntemp', 0)
        self.pump_frequency= db_read(self.cursor, 'pump1', 'pump_frequency_feedback', 0)

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
    fig = plt.figure(figsize=(10, 6))
    ax = fig.add_subplot(1, 1, 1)
    Pump = Pump(name = "pump",ax = ax)
    Pump.display()

    plt.tight_layout() 
    plt.rcParams['savefig.dpi'] = 300
    plt.show()
