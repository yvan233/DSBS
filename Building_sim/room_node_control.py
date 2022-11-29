# coding=utf-8
import time
import pymysql
import numpy as np
import math

HOST="localhost"
USER="root"
PASSWORD="cfins"
DB="room"
init_temperature = 30.0
INTERVAL = 6

db = pymysql.connect(host=HOST, user=USER, passwd=PASSWORD, db=DB, charset='utf8')
cursor = db.cursor()
# set time
sql = "SELECT %s, %s, %s, %s FROM room_states order by time DESC limit 1" % ('time', 'id', 'name', 'value')
cursor.execute(sql)
data1 = cursor.fetchall()
step_min = int(data1[0][0])
step_rec = step_min


def db_insert(cursor, table, time, id ,name, value):
    if type(value) == float:
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % (table, time, id, name, value)
        cursor.execute(sql)
    else:
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', '%s')" % (table, time, id, name, value)
        cursor.execute(sql)


def db_update(cursor, table, time, name, value):
    if type(value) == float:
        sql = "UPDATE %s SET time=%d, value=%.1f WHERE name='%s'" % (table, time, value, name)
        cursor.execute(sql)
    else:
        sql = "UPDATE %s SET time=%d, value=%.1f WHERE name='%s'" % (table, time, value, name)
        cursor.execute(sql)


def db_read(cursor, table, name, num):               # num 为倒序读取数据条目数，0表示读取全部
    if num == 0:
        sql = "SELECT %s, %s, %s, %s FROM %s WHERE name='%s'" % ('time', 'id', 'name', 'value', table, name)
        cursor.execute(sql)
        data = cursor.fetchall()
    else:
        sql = "SELECT %s, %s, %s, %s FROM %s WHERE name='%s' order by time DESC limit %d" % ('time', 'id', 'name', 'value', table, name, num)
        cursor.execute(sql)
        data = cursor.fetchall()
    return data


def cal_fcu_fan(tem_s, tem_k, position_k, onoff_k, occ_list):
    H = 3
    M = 2
    L = 1
    Off = 0
    a1 = 0.5
    a2 = 1
    a3 = 1.5
    a4 = 2
    position_s = L
    onoff_s = 1

    if position_k == 0:
        position_k = 1

    occ_sum = np.sum(occ_list)
    if occ_sum == 0:
        onoff_s = Off
    else:
        if tem_k - tem_s > a4:
            position_s = H
        elif a3 <= tem_k - tem_s < a4 and (position_k == M):
            position_s = M
        elif a3 < tem_k - tem_s <= a4 and (position_k == H):
            position_s = H
        elif a3 < tem_k - tem_s <= a4 and (position_k == L):
            position_s = M
        elif a2 < tem_k - tem_s <= a3:
            position_s = M
        elif a1 <= tem_k - tem_s < a2 and (position_k == L):
            position_s = L
        elif a1 < tem_k - tem_s <= a2 and (position_k == M):
            position_s = M
        elif a1 < tem_k - tem_s <= a2 and (position_k == H):
            position_s = M
        elif -a2 < tem_k - tem_s <= a1:
            position_s = L
        # elif -a4 <tem_s - tem_k <= -a2 and (position_k == L):
        #     position_s = L
        elif -a3 < tem_k - tem_s <= -a2 and (position_k == L or position_k == M or position_k == H):
            position_s = L
        elif -a4 < tem_k - tem_s <= -a3 and (position_k == L):
            onoff_s = Off
        elif -a4 < tem_k - tem_s <= -a2 and (onoff_k == Off):
            onoff_s = Off
        elif tem_k - tem_s <= -a4:
            onoff_s = Off

    return onoff_s, position_s


# 读本地参数
def R_room_node(db):
    cursor = db.cursor()
    sql = "SELECT %s, %s, %s, %s FROM room_states order by time DESC limit 14" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    data1 = cursor.fetchall()
    if data1:
        for i in range (len(data1)):
            if data1[i][2] == 'room_temp':
                tem_k = float(data1[i][3])
            elif data1[i][2] == 'FCU_onoff_feedback':
                onoff_k = int(data1[i][3])
            elif data1[i][2] == 'FCU_fan_feedback':
                position_k = int(data1[i][3])
    else:
        tem_k = init_temperature
    sql = "SELECT %s, %s, %s, %s FROM room_control order by time DESC limit 6" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    data2 = cursor.fetchall()
    if data2:
        for i in range (len(data2)):
            if data2[i][2] == 'roomtemp_setpoint':
                tem_s = float(data2[i][3])
    else:
        tem_s = 24.0
        position_k = 1
    return tem_s, tem_k, position_k, onoff_k


def R_occ_his(db, step_min, length=5):      #  read history data
    occ_list = np.zeros(length)
    # f_list = np.zeros(length)
    # tws_list = np.zeros(length)
    # twr_list = np.zeros(length)

    if step_min >= length:
        cursor = db.cursor()
        sql = "SELECT %s, %s, %s, %s FROM room_states WHERE name='occupant_num' order by time DESC limit %d" % \
              ('time', 'id', 'name', 'value', length)
        cursor.execute(sql)
        occ_data = cursor.fetchall()
        # sql = "SELECT %s, %s, %s, %s FROM sensor_fcu_waterflow_his order by time DESC limit %d" % \
        #       ('time', 'id', 'name', 'value', length)
        # cursor.execute(sql)
        # f_data = cursor.fetchall()
        # sql = "SELECT %s, %s, %s, %s FROM sensor_fcu_watertemp_his WHERE name='supply_temp' order by time DESC limit %d" % \
        #       ('time', 'id', 'name', 'value', length)
        # cursor.execute(sql)
        # tws_data = cursor.fetchall()
        # sql = "SELECT %s, %s, %s, %s FROM sensor_fcu_watertemp_his WHERE name='return_temp' order by time DESC limit %d" % \
        #       ('time', 'id', 'name', 'value', length)
        # cursor.execute(sql)
        # twr_data = cursor.fetchall()

        for i in range(0, len(occ_data)):
            occ_list[len(occ_data) - 1 - i] = float(occ_data[i][3])
            # f_list[length - 1 - i] = float(f_data[i][3])
            # tws_list[length - 1 - i] = float(tws_data[i][3])
            # twr_list[length - 1 - i] = float(twr_data[i][3])
    return occ_list


# 写本地node
def W_room_node_control(db, time, onoff_set, fan_set, mode_set=1, valve_set=100, rt_set=24, rh_set=55):
    cursor = db.cursor()
    sql = "INSERT INTO room_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000240', 'roomtemp_setpoint', rt_set)
    cursor.execute(sql)
    sql = "INSERT INTO room_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000241', 'roomRH_setpoint', rh_set)
    cursor.execute(sql)
    sql = "INSERT INTO room_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000411', 'FCU_onoff_setpoint', onoff_set)
    cursor.execute(sql)
    sql = "INSERT INTO room_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000413', 'FCU_fan_setpoint', fan_set)
    cursor.execute(sql)
    sql = "INSERT INTO room_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000419', 'FCU_workingmode_setpoint', mode_set)
    cursor.execute(sql)
    sql = "INSERT INTO room_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000425', 'valve_setpoint', valve_set)
    cursor.execute(sql)
    db.commit()


if __name__=='__main__':
    T_con = 5                       # control interval
    T_delta = INTERVAL                     # iteration time
    occ_list_length = 5
    con_start_time = time.time()
    occ_start_time = time.time()
    H = 3
    M = 2
    L = 1
    Off = 0
    position_s = L
    position_k = L
    onoff_s = 1

    while step_min <= 600:
        print('room control time: %d min' % step_min)
        con_start_time = time.time()
        tem_s, tem_k, position_k, onoff_k = R_room_node(db)
        
        if step_min % 5 == 0:
            occ_list = R_occ_his(db, step_min)
            onoff_s, position_s = cal_fcu_fan(tem_s, tem_k, position_k, onoff_k, occ_list)
            # temp_list, f_list, tws_list, twr_list = R_room_his(db, 10, step_min)     # length should be an even number
            # pQ = pre_Q(temp_list, f_list, tws_list, twr_list, position_s, tem_s)
        W_room_node_control(db, step_min, onoff_s, position_s)
        db.commit()
        step_min += 1

        if T_delta + con_start_time - time.time() > 0:
            time.sleep(T_delta + con_start_time - time.time())
    db.close()