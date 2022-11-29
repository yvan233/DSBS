import pymysql
import csv
import os

db1 = pymysql.connect(host="localhost", user="root", passwd="123456", db="mz_node1", charset='gbk')
db2 = pymysql.connect(host="localhost", user="root", passwd="123456", db="mz_node2", charset='gbk')
db3 = pymysql.connect(host="localhost", user="root", passwd="123456", db="mz_node3", charset='gbk')
db4 = pymysql.connect(host="localhost", user="root", passwd="123456", db="mz_node4", charset='gbk')
db5 = pymysql.connect(host="localhost", user="root", passwd="123456", db="mz_node5", charset='gbk')
db6 = pymysql.connect(host="localhost", user="root", passwd="123456", db="mz_node6", charset='gbk')
db7 = pymysql.connect(host="localhost", user="root", passwd="123456", db="mz_node7", charset='gbk')
db8 = pymysql.connect(host="localhost", user="root", passwd="123456", db="mz_node8", charset='gbk')
db9 = pymysql.connect(host="localhost", user="root", passwd="123456", db="mz_node9", charset='gbk')
room_list = [db1, db2, db3, db4, db5, db6, db7, db8]

root_path = "D:/Python Projects/MingZe/test_data/"

def gen_roomtemp(db_list, data_length):
    length = len(db_list)
    data = []
    data_temp = []
    file_path = root_path + 'room_temp.csv'
    dir = os.listdir(root_path)
    if 'room_temp.csv' in dir:
        os.remove(file_path)
    file = open(file_path, 'w', newline='')
    w_file = csv.writer(file)
    w_file.writerow(['time', 'id', 'name', 'node1', 'node2', 'node3', 'node4', 'node5', 'node6', 'node7', 'node8'])

    for r in range(0, length):
        cursor = room_list[r].cursor()
        sql = "SELECT %s, %s, %s, %s FROM sensor_room_his WHERE name = 'room_temp'" % ('time', 'id', 'name', 'value')
        cursor.execute(sql)
        temp = cursor.fetchall()
        data_temp.append(temp)


    for d in range(0, data_length):
        data.clear()
        for r in range(0, length):
            if r == 0:
                for i in range(0, 4):
                    data.append(data_temp[r][d][i])
            else:
                data.append(data_temp[r][d][3])
        w_file.writerow(data)
    file.close()


def gen_fcu(db_list, data_length):
    length = len(db_list)
    data = []
    data_temp = []
    file_path = root_path + 'fcu.csv'
    dir = os.listdir(root_path)
    if 'fcu.csv' in dir:
        os.remove(file_path)
    file = open(file_path, 'w', newline='')
    w_file = csv.writer(file)
    w_file.writerow(['time', 'id', 'name', 'node1', 'node2', 'node3', 'node4', 'node5', 'node6', 'node7', 'node8'])

    for r in range(0, length):
        cursor = room_list[r].cursor()
        sql = "SELECT %s, %s, %s, %s FROM fcu_panel_his WHERE name = 'FCU_fan_feedback'" % ('time', 'id', 'name', 'value')
        cursor.execute(sql)
        temp = cursor.fetchall()
        data_temp.append(temp)


    for d in range(0, data_length):
        data.clear()
        for r in range(0, length):
            if r == 0:
                for i in range(0, 4):
                    data.append(data_temp[r][d][i])
            else:
                data.append(data_temp[r][d][3])
        w_file.writerow(data)
    file.close()


def gen_pumpvfd(db, data_length):
    data = []
    file_path = root_path + 'pump_vfd.csv'
    dir = os.listdir(root_path)
    if 'pump_vfd.csv' in dir:
        os.remove(file_path)
    file = open(file_path, 'w', newline='')
    w_file = csv.writer(file)
    w_file.writerow(['time', 'id', 'name', 'frequency'])

    cursor = db.cursor()
    sql = "SELECT %s, %s, %s, %s FROM pump_vfd_his WHERE name = 'pump_frequency_feedback'" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    pump_f = cursor.fetchall()

    for d in range(0, data_length):
        data.clear()
        for i in range(0, 4):
            data.append(pump_f[d][i])
        w_file.writerow(data)
    file.close()

if __name__ == '__main__':
    time_length = 1440
    gen_roomtemp(room_list, time_length)
    gen_fcu(room_list, time_length)
    gen_pumpvfd(db9, time_length)
    for i in range(0, 8):
        room_list[i].close()
    db9.close()