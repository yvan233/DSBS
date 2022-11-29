# coding=utf-8
import time
import pymysql

c = 1.005
rou_w = 1000
# db = pymysql.connect(host="localhost", user="root", passwd="123456", db="mingze_simulator", charset='gbk')  # Local IP:183.173.139.213
# cursor = db.cursor()
class PID():
    def __init__(self,kp,ki,kd):
        self.KP = kp
        self.KI = ki
        self.KD = kd
        #self.sum_err = 0
        self.now_err = 0
        self.last_err = 0
        self.last_last_err = 0
        self.now_val = 0
        self.change_val = 0
        self.up = 50.0
        self.low = 10.0

    def run_pid(self,error):
        if abs(error) < 0.5:
            error = 0
        self.last_last_err = self.last_err
        self.last_err = self.now_err
        self.now_err = error
        #self.sum_err += self.now_err
        self.change_val = self.KP * (self.now_err - self.last_err) + self.KI * self.now_err \
                          + self.KD * (self.now_err - 2*self.last_err + self.last_last_err)
        if abs(self.change_val) >= 2:
            self.now_val += int(self.change_val)
        if self.now_val < self.low:
            self.now_val = self.low
        if self.now_val > self.up:
            self.now_val = self.up
        return self.now_val
pump1_PID = PID(5, 10, 0)

# 计算末端总负荷需求 (kJ/min)
def cal_Q():
    Qtotal = 0.0
    for i in range(8):
        table_name = 'room'+ str(i+1)
        sql = "SELECT %s, %s, %s, %s FROM %s order by time DESC limit 12" % ('time', 'id', 'name', 'value', table_name)
        cursor.execute(sql)
        data = cursor.fetchall()
        Q1 = float(data[11][3])
        Qtotal = Q1 + Qtotal
    return Qtotal

# 计算水泵供回水温差 (单位)
def cal_deltaT():
    sql = "SELECT %s, %s, %s, %s FROM pump1 order by time DESC limit 3" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    data = cursor.fetchall()
    tem_supply = float(data[2][3])
    tem_return = float(data[1][3])
    deltaT = tem_supply - tem_return
    return deltaT


# 读取水泵流量 和 频率(单位)
def read_pump():
    sql = "SELECT %s, %s, %s, %s FROM pump1 order by time DESC limit 8" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    data = cursor.fetchall()
    G_k = float(data[4][3])
    speed = float(data[3][3])
    return G_k,speed

def judge(G_s,G_k):
    a1 = 1.0
    a2 = 2.0
    a3 = 3.0

    s2 = 2.0
    s1 = 1.0
    s0 = 0.0

    deltaSpeed = 0.0
    delta = G_s -G_k
    if delta > a3 :
        deltaSpeed = s2
    elif  a2 < delta <= a3:
        deltaSpeed = s2
    if a1 <delta <= a2:
        deltaSpeed = s1
    elif  -a1 < delta <= a1:
        deltaSpeed = s0
    elif  -a2 < delta <= -a1:
        deltaSpeed = -s1
    elif  -a3 < delta <= -a2:
        deltaSpeed = -s2
    elif  delta <= -a3:
        deltaSpeed = -s2
    return deltaSpeed

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
def write_controlpump(db, time, speed_s):
    cursor = db.cursor()
    for p in range(1, 3):
        table = 'pump' + str(p) + '_control'
        if p == 1:
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, time, '0x24000208', 'pump_onoff_setpoint', 1)
            cursor.execute(sql)
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, time, '0x24000216', 'pump_frequency_setpoint', speed_s)
            cursor.execute(sql)
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, time, '0x24000243', 'pump_valve_setpoint', 1)
            cursor.execute(sql)
        else:
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, time, '0x24000208', 'pump_onoff_setpoint', 0)
            cursor.execute(sql)
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, time, '0x24000216', 'pump_frequency_setpoint', 0)
            cursor.execute(sql)
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, time, '0x24000243', 'pump_valve_setpoint', 0)
            cursor.execute(sql)


if __name__=='__main__':
    T_delta = 6
    T_inter_Q = 30
    T_inter_con = 5
    start_time_Q = time.time()
    start_time_con = time.time()

    speed_s = 25.0
    G_s = 0

    #Qtotal = cal_Q()
    deltaT = cal_deltaT()
    #G_s = Qtotal / (4.2 * 1000 * deltaT) * 60     # m3/h
    start_time_Q = time.time()

    deltaSpeed_last = 0
    start_time_con = time.time()
    #print (speed_s, deltaSpeed_last)

    # set time
    sql = "SELECT %s, %s, %s, %s FROM room1 order by time DESC limit 1" % ('time', 'id', 'name', 'value')
    cursor.execute(sql)
    data = cursor.fetchall()
    step_min = int(data[0][0])
    step_rec = step_min

    while (1):
        start_time = time.time()
        print('pump control time: %d min' % step_min)
        # if (step_min - step_rec) % T_inter_Q == 0:
        #     Qtotal = cal_Q()
        #     deltaT = cal_deltaT()
        #     G_s = Qtotal / deltaT
        #     start_time_Q = time.time()
        #     db.commit()
        if (step_min - step_rec) % T_inter_con == 0:
            G_k, speed_k = read_pump()
            deltaT = cal_deltaT()
            pump1_PID.now_val = speed_k
            speed_s = pump1_PID.run_pid(deltaT - 6)
            start_time_con = time.time()
            db.commit()
        write_controlpump(step_min, speed_s)
        step_min += 1

        if T_delta + start_time - time.time() > 0:
            time.sleep(T_delta + start_time - time.time())

    db.close()