# coding=utf-8
import time
import pymysql

HOST="localhost"
USER="root"
PASSWORD="cfins"
DB="pump"
INTERVAL = 6

db = pymysql.connect(host=HOST, user=USER, passwd=PASSWORD, db=DB, charset='gbk')
cursor = db.cursor()
# set time
sql = "SELECT %s, %s, %s, %s FROM pump_states order by time DESC limit 1" % ('time', 'id', 'name', 'value')
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


# Auto_start
def auto_start(db, speed_k):
    cursor = db.cursor()
    valve_data = db_read(cursor, 'pump_valve_his', 'pump_valve_feedback', 0)
    if len(valve_data) > 1:
        if float(valve_data[-1][3]) == 1 and float(valve_data[-2][3]) == 1:
            onoff_s = 1
            speed_s = speed_k + 5
        else:
            valve_s = 1
            speed_s = 0
    else:
        valve_s = 1
        speed_s = 0

    if speed_s >= 15 and valve_s == 1:
        speed_s = 15
        finish_flag = 1
    else:
        finish_flag = 0
    return finish_flag, onoff_s, speed_s, valve_s


# Auto_stop
def auto_stop(db, speed_k, hp_flag):
    # wait for heatpump stop
    if hp_flag == 0:
        if speed_k >= 10:
            speed_s = speed_k - 10
            valve_s = 1
        else:
            speed_s = 0
            onoff_s = 0

        if onoff_s == 0:
            valve_s = 0

    return onoff_s, speed_s, valve_s

    cursor = db.cursor()
    valve_data = db_read(cursor, 'pump_valve_his', 'pump_valve_feedback', 0)
    if len(valve_data) > 1:
        if float(valve_data[-1][3]) == 1 and float(valve_data[-2][3]) == 1:
            onoff_s = 1
            speed_s = speed_k + 5
        else:
            valve_s = 1
            speed_s = 0
    else:
        valve_s = 1
        speed_s = 0

    if speed_s >= 15 and valve_s == 1:
        speed_s = 15
        finish_flag = 1
    else:
        finish_flag = 0
    return finish_flag, onoff_s, speed_s, valve_s


def read_pump():
    sql = "SELECT %s, %s, %s, %s FROM pump_states order by time DESC limit 8" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    data1 = cursor.fetchall()
    if data1:
        for i in range (len(data1)):
            if data1[i][2] == 'pump_returntemp':
                tr = float(data1[i][3])
            elif data1[i][2] == 'pump_supplytemp':
                ts = int(data1[i][3])
            elif data1[i][2] == 'pump_frequency_feedback':
                speed = int(data1[i][3])
    else:
        tr = 12
        ts = 7
        speed = 40

    return tr, ts, speed


# 控制水泵频率 (Hz)
def con_pump(T_s,T_r,speed_k):
    speed_s = 40
    speed_lower = 30
    speed_upper = 50
    T_standard = 5
    a1 = 1.0
    a2 = 2.0
    a3 = 3.0

    s3 = 4.0
    s2 = 2.0
    s1 = 1.0
    s0 = 0.0
    s = 0.0
    if T_s - T_r >= T_standard+a3:
        s = s3
    elif T_standard+a2 < T_s - T_r <= T_standard+a3:
        s = s2
    elif T_standard+a1 < T_s - T_r <= T_standard+a2:
        s = s1
    elif T_standard-a1 < T_s - T_r <= T_standard+a1:
        s = s0
    elif T_standard-a2 < T_s - T_r <= T_standard-a1:
        s = -s1
    elif T_standard-a3 < T_s - T_r <= T_standard-a2:
        s = -s2
    elif T_s - T_r <= T_standard-a3:
        s = -s3

    speed_s = speed_k + s
     # 输出限幅
    if speed_s < speed_lower:
        speed_s = 30
    if speed_s > speed_upper:
        speed_s = 50
    return speed_s


# 写水泵控制表
def write_controlpump(time, onoff_s, speed_s, valve_s):
    cursor = db.cursor()
    sql = "INSERT INTO pump_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x24000208', 'pump_onoff_setpoint', 1)
    cursor.execute(sql)
    sql = "INSERT INTO pump_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x24000216', 'pump_frequency_setpoint', speed_s)
    cursor.execute(sql)
    sql = "INSERT INTO pump_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x24000243', 'pump_valve_setpoint', 1)
    cursor.execute(sql)
    db.commit()


if __name__=='__main__':
    T_delta = INTERVAL            # waiting time
    T_inter_con = 15
    start_time_con = time.time()
    delta_set = 5.0

    #deltaT = cal_deltaT()
    # start_time_Q = time.time()

    #deltaSpeed_last = 0
    start_time_con = time.time()
    #print (speed_s, deltaSpeed_last)

    # set time
    sql = "SELECT %s, %s, %s, %s FROM pump_states order by time DESC limit 1" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    data = cursor.fetchall()
    step_min = int(data[0][0])
    step_rec = step_min

    while step_min <= 600:
        start_time = time.time()
        print('pump control time: %d min' % step_min)

        if (step_min - step_rec) % T_inter_con == 0:
            #G_k, speed_k = read_pump()
            tr, ts, speed = read_pump()
            #speed_s, deltaSpeed_last = con_pump(G_s,G_k,speed_k,deltaSpeed_last)
            speed_s=con_pump(ts, tr, speed)
            write_controlpump(step_min, 1, speed_s, 1)
            start_time_con = time.time()
            db.commit()
        step_min += 1

        if T_delta + start_time - time.time() > 0:
            time.sleep(T_delta + start_time - time.time())

    db.close()