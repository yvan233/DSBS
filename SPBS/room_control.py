# coding=utf-8
import time
import pymysql
import numpy as np

# db = pymysql.connect(host="localhost", user="root", passwd="123456", db="mingze_simulator", charset='gbk')  # Local IP:183.173.139.213
# cursor = db.cursor()
# 读取当前和T间隔人数
# def read_occupant(list_length):    # 从数据库里读取最后list_length长度人数纪录
#     sql = "SELECT %s, %s, %s, %s FROM sensor_occupant_his" % ('time', 'id', 'name', 'value')
#     cursor.execute(sql)
#     data = cursor.fetchall()
#     occ_list = np.zeros(list_length)
#     occ_trans_list = np.zeros(list_length)
#     if len(data) >= list_length:
#         for i in range(0, list_length):
#             occ_list[i] = int(data[i*2 - list_length][3])
#             occ_trans_list[i] = int(data[i*2 - list_length + 1][3])
#     return occ_list



# 读取温度设定值和测量值
def read_room(num):
    while(1):
        sql = "SELECT %s, %s, %s, %s FROM %s order by time DESC limit 14" % ('time', 'id', 'name', 'value', 'room'+str(num+1))
        cursor.execute(sql)
        data = cursor.fetchall()
        if int(data[0][0]) != int(data[15][0]):
            time.sleep(0.1)
            continue
        else:
            tem_s = float(data[13][3])
            tem_k = float(data[15][3])
            position_k = float(data[10][3])
            break
    return tem_s, tem_k, position_k


def cal_fcu_fan(tem_s, tem_k, position_k, onoff_k, occ_list):
    H = 3
    M = 2
    L = 1
    Off = 0
    a1 = 0.5
    a2 = 1
    a3 = 1.5
    a4 = 2
    position_s = 0
    onoff_s = 1

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


# 写控制表
def write_room_control(db, time, r, onoff, fan_set, mode, valve_set, t_set = 24, rh_set = 70):
    cursor = db.cursor()
    table = 'room' + str(r+1) + '_control'
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table, time, '0x00000411', 'FCU_onoff_setpoint', onoff)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table, time, '0x00000413', 'FCU_fan_setpoint', fan_set)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table, time, '0x00000419', 'FCU_workingmode_setpoint', mode)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table, time, '0x00000425', 'valve_setpoint', valve_set)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table, time, '0x00000240', 'roomtemp_setpoint', t_set)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table, time, '0x00000241', 'roomRH_setpoint', rh_set)
    cursor.execute(sql)



# 读本地参数
def R_room_node(db):
    cursor = db.cursor()
    sql = "SELECT %s, %s, %s, %s FROM sensor_room" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    tem_s = float(cursor.fetchall()[0][3])
    sql = "SELECT %s, %s, %s, %s FROM fcu_panel" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    tem_k = float(cursor.fetchall()[0][3])
    position_k = float(cursor.fetchall()[4][3])
    return tem_s, tem_k, position_k

# 写本地node
def W_room_node_control(db, time, onoff, fan_set, mode, valve_set):
    cursor = db.cursor()
    sql = "INSERT INTO fcu_control_his(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000411', 'FCU_onoff_setpoint', onoff)
    cursor.execute(sql)
    sql = "INSERT INTO fcu_control_his(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000413', 'FCU_fan_setpoint', fan_set)
    cursor.execute(sql)
    sql = "INSERT INTO fcu_control_his(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000419', 'FCU_workingmode_setpoint', mode)
    cursor.execute(sql)
    sql = "INSERT INTO fcu_valve_control_his(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000425', 'valve_setpoint', valve_set)
    cursor.execute(sql)



if __name__=='__main__':
    T_con = 5                       # 控制间隔, min
    T_delta = 6
    occ_list_length = 5              # 人数历史数据列表长度
    con_start_time = time.time()
    occ_start_time = time.time()
    H = 3
    M = 2
    L = 1
    Off = 0
    position_s = M * np.ones(8)
    position_k = M * np.ones(8)

    # set time
    sql = "SELECT %s, %s, %s, %s FROM room1 order by time DESC limit 1" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    data = cursor.fetchall()
    step_min = int(data[0][0])
    step_rec = step_min

    while(1):
        print('room control time: %d min' % step_min)
        con_start_time = time.time()
        for r in range(0, 8):
            if (step_min - step_rec) % T_con == 0:
                tem_s, tem_k, position_k[r] = read_room(r)
                position_s[r] = cal_fcu_fan(tem_s, tem_k, position_k[r])
            write_room_control(db, step_min, r, 1, position_s[r], 2, 100)
        db.commit()
        step_min += 1

        if T_delta + con_start_time - time.time() > 0:
            time.sleep(T_delta + con_start_time - time.time())

    db.close()