from mz_model import *
from sympy import Matrix
import time
import pymysql


def sign(x):
    if x > 0:
        res = 1
    if x < 0:
        res = -1
    if x == 0:
        res = 0
    return res


def cal_solar(day):
    if (day < 80):
        for i in range (0, 5):
            for j in range (0, 1440):
                Itd[j][i] = It[j][i] - SF[i] * (1/3) * ((80 - day) / 89)
                if Itd[j][i] < 0:
                    Itd[j][i] *= 0.6
    if ((day >= 80) and (day < 173)):
        for i in range (0, 5):
            for j in range (0, 1440):
                Itd[j][i] = It[j][i] + SF[i] * (1/3) * ((day - 80) / 93)
                if Itd[j][i] < 0:
                    Itd[j][i] *= 0.4
    if ((day >= 173) and (day < 256)):
        for i in range(0, 5):
            for j in range(0, 1440):
                Itd[j][i] = It[j][i] + SF[i] * (1 / 3) * ((266 - day) / 93)
                if Itd[j][i] < 0:
                    Itd[j][i] *= 0.2
    if ((day >= 266) and (day < 356)):
        for i in range(0, 5):
            for j in range(0, 1440):
                Itd[j][i] = It[j][i] - SF[i] * (1 / 3) * ((day - 266) / 90)
                if Itd[j][i] < 0:
                    Itd[j][i] *= 0.4
    if (day >= 356):
        for i in range (0, 5):
            for j in range (0, 1440):
                Itd[j][i] = It[j][i] - SF[i] * (1/3) * ((356 + 89 - day) / 89)
                if Itd[j][i] < 0:
                    Itd[j][i] *= 0.6


def cal_density(T):
    rou = 1.293 * (273.15 / (T + 273.15))
    return rou


def cal_valve_Sv(valve_position):
    s = 13100 * math.exp(-0.1801 * valve_position) + 6680 * math.exp(-0.04819 * valve_position)
    return s

def cal_pump_valve(valve_position):
    if valve_position == 0:
        s = 1000000
    else:
        s = 1000
    return s


def max_colume_irrelevant_group(A):           # Return colume numbers of the max colume irrelevant group
    mat = Matrix(A)
    mat_new = mat.rref()
    A_rref = np.zeros((nodes, branches))
    for i in range(0, nodes):
        for j in range(0, branches):
            A_rref[i][j] = mat_new[0][i * branches + j]
    rows = len(A)
    #columes = len(A[0])
    flag = np.ones(rows) * -1
    for i in range(0, rows):
        for j in range(0, branches):
            if A_rref[i][j] == 1.0:
                flag[i] = j
                break
    return flag


def show_origin(target, new_columes):
    length = len(new_columes)
    result = np.zeros(length)
    for i in range(0, length):
        result[int(new_columes[i])] = round(target[i][0], 1)
    return result


#  mz_simulator
def clear_db(db):
    cursor = db.cursor()
    sql = "SELECT database()"
    cursor.execute(sql)
    dbname = cursor.fetchall()[0][0]
    sql = '''SELECT 
                    table_name 
                FROM
                    information_schema.TABLES 
                WHERE 
                    table_schema = '%s'
        ''' % (dbname)
    cursor.execute(sql)
    data = cursor.fetchall()
    for l in range(len(data)):
        sql = "TRUNCATE TABLE %s" % (data[l][0])
        cursor.execute(sql)
    #db.commit()


def W_pipenet(db, G, P, time):
    cursor = db.cursor()
    sql = "INSERT INTO pipe_net(time, node_pressure, branch_flow) VALUES (%d, '%s', '%s')" % (time, P, G)
    cursor.execute(sql)
    #db.commit()


def W_room(db, room, fcu, list_num, time):
    cursor = db.cursor()
    table_name = 'room' + str(list_num)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000220', 'room_temp', room.temp)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000221', 'room_RH', room.RH)
    cursor.execute(sql)
    # sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
    #       (table_name, time, '0x00000240', 'roomtemp_setpoint', room.temp_set)
    # cursor.execute(sql)
    # sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
    #       (table_name, time, '0x00000241', 'roomRH_setpoint', room.RH_set)
    # cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x0000024A', 'room_Q', room.Q_load)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000410', 'FCU_onoff_feedback', fcu.onoff)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000412', 'FCU_fan_feedback', fcu.fan_position)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000418', 'FCU_workingmode_feedback', fcu.mode)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000420', 'supply_temp', fcu.tw_supply)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000421', 'return_temp', fcu.tw_return)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000422', 'supply_pressure', fcu.tw_supplypressure)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000423', 'return_pressure', fcu.tw_returnpressure)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000424', 'waterflow', fcu.waterflow)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000426', 'valve_feedback', fcu.valve_position)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000810', 'occupant_num', room.occupant_num)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x00000818', 'occupant_transform', room.occupant_trans)
    cursor.execute(sql)
    #db.commit()


def W_pump(db, pump, list_num, time):
    cursor = db.cursor()
    table_name = 'pump' + str(list_num)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000200', 'pump_onoff_feedback', pump.onoff)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000210', 'pump_supplypressure', pump.p_supply)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000211', 'pump_returnpressure', pump.p_return)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000214', 'pump_flow', pump.G)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000215', 'pump_frequency_feedback', pump.n)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000240', 'pump_supplytemp', pump.supply_temp)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000241', 'pump_returntemp', pump.return_temp)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000242', 'pump_valve_feedback', pump.valve_position)
    cursor.execute(sql)
    #db.commit()


def W_heatpump(db, heatpump, time):
    cursor = db.cursor()
    sql = "INSERT INTO heatpump(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000200', 'heatpump_onoff_feedback', heatpump.onoff)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000202', 'heatpump_supplytemp_feedback', heatpump.supplytemp)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000204', 'heatpump_workingmode_feedback', heatpump.mode)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000206', 'heatpump_alarm', heatpump.flow_alarm)
    cursor.execute(sql)
    #db.commit()


def W_outdoor(db, hour, dry_bulb_t, damp, time):
    cursor = db.cursor()
    sql = "INSERT INTO sensor_outdoor(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x32000201', 'outdoor_temp', dry_bulb_t[hour])
    cursor.execute(sql)
    sql = "INSERT INTO sensor_outdoor(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x32000202', 'outdoor_damp', damp[hour])
    cursor.execute(sql)
    #db.commit()


def init_control(db):
    cursor = db.cursor()
    for r in range(1, 9):
        table = 'room' + str(r) + '_control'
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (table, 0, '0x00000240', 'roomtemp_setpoint', 24.0)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (table, 0, '0x00000241', 'roomRH_setpoint', 70.0)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (table, 0, '0x00000411', 'FCU_onoff_setpoint', 1)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (table, 0, '0x00000413', 'FCU_fan_setpoint', 1)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (table, 0, '0x00000419', 'FCU_workingmode_setpoint', 1)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (table, 0, '0x00000425', 'valve_setpoint', 100)
        cursor.execute(sql)
    #db.commit()

    for p in range(1,3):
        table = 'pump' + str(p) + '_control'
        if p == 1:
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, 0, '0x24000208', 'pump_onoff_setpoint', 1)
            cursor.execute(sql)
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, 0, '0x24000216', 'pump_frequency_setpoint', 50)
            cursor.execute(sql)
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, 0, '0x24000243', 'pump_valve_setpoint', 1)
            cursor.execute(sql)
        else:
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, 0, '0x24000208', 'pump_onoff_setpoint', 0)
            cursor.execute(sql)
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, 0, '0x24000216', 'pump_frequency_setpoint', 0)
            cursor.execute(sql)
            sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                  (table, 0, '0x24000243', 'pump_valve_setpoint', 0)
            cursor.execute(sql)
    #db.commit()

    sql = "INSERT INTO heatpump_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (0, '0x35000201', 'heatpump_onoff_setpoint', 1)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (0, '0x35000203', 'heatpump_supplytemp_setpoint', 7.00)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (0, '0x35000205', 'heatpump_workingmode_setpoint', 2)
    cursor.execute(sql)
    #db.commit()

def init_control_dis(db, type = "room"):
    if type == "room":
        cursor = db.cursor()
        table = 'room_control'
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table, 0, '0x00000240', 'roomtemp_setpoint', 24.0)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                (table, 0, '0x00000241', 'roomRH_setpoint', 70.0)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                (table, 0, '0x00000411', 'FCU_onoff_setpoint', 1)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                (table, 0, '0x00000413', 'FCU_fan_setpoint', 1)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                (table, 0, '0x00000419', 'FCU_workingmode_setpoint', 1)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
                (table, 0, '0x00000425', 'valve_setpoint', 100)
        cursor.execute(sql)
    elif type == "pump":
        table = 'pump_control'
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (table, 0, '0x24000208', 'pump_onoff_setpoint', 1)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (table, 0, '0x24000216', 'pump_frequency_setpoint', 50)
        cursor.execute(sql)
        sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (table, 0, '0x24000243', 'pump_valve_setpoint', 1)
        cursor.execute(sql)

    else:
        sql = "INSERT INTO heatpump_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (0, '0x35000201', 'heatpump_onoff_setpoint', 1)
        cursor.execute(sql)
        sql = "INSERT INTO heatpump_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (0, '0x35000203', 'heatpump_supplytemp_setpoint', 7.00)
        cursor.execute(sql)
        sql = "INSERT INTO heatpump_control(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
              (0, '0x35000205', 'heatpump_workingmode_setpoint', 2)
        cursor.execute(sql)
    db.commit()

def R_room_control(db, r, fcu):
    # read current data
    table_name = 'room' + str(r+1) + '_control'
    cursor = db.cursor()
    while(1):
        sql = "SELECT %s, %s, %s, %s FROM %s order by time DESC limit 4" % ('time', 'id', 'name', 'value', table_name)
        cursor.execute(sql)
        data = cursor.fetchall()
        if int(data[0][0]) != int(data[3][0]):
            time.sleep(0.1)
            continue
        else:
            # assignment
            fcu.valve_set = float(data[0][3])
            fcu.mode_set = int(data[1][3])
            fcu.fan_set = int(data[2][3])
            fcu.onoff_set = int(data[3][3])
            break


def R_pump_control(db, pump):
    # read current data
    table_name = pump.name + '_control'
    cursor = db.cursor()
    while(1):
        sql = "SELECT %s, %s, %s, %s FROM %s order by time DESC limit 3" % ('time', 'id', 'name', 'value', table_name)
        cursor.execute(sql)
        data = cursor.fetchall()
        if int(data[0][0]) != int(data[2][0]):
            time.sleep(0.1)
            continue
        else:
            # assignment
            pump.valve_set = int(data[0][3])
            pump.n_set = int(data[1][3])
            pump.onoff_set = int(data[2][3])
            break


def R_heatpump_control(db, heatpump):
    # read current data
    table_name = heatpump.name + '_control'
    cursor = db.cursor()
    while (1):
        sql = "SELECT %s, %s, %s, %s FROM %s order by time DESC limit 3" % ('time', 'id', 'name', 'value', table_name)
        cursor.execute(sql)
        data = cursor.fetchall()
        if int(data[0][0]) != int(data[2][0]):
            time.sleep(0.1)
            continue
        else:
            # assignment
            heatpump.mode = int(data[0][3])
            heatpump.supply_tempset = int(data[1][3])
            heatpump.onoff = int(data[2][3])
            break


# mz_nodes
def W_room_node(db, room, fcu, time):
    cursor = db.cursor()
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000220', 'room_temp', room.temp)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000221', 'room_RH', room.RH)
    cursor.execute(sql)
    # sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
    #       (table_name, time, '0x00000240', 'roomtemp_setpoint', room.temp_set)
    # cursor.execute(sql)
    # sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
    #       (table_name, time, '0x00000241', 'roomRH_setpoint', room.RH_set)
    # cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x0000024A', 'room_Q', room.Q_load)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000410', 'FCU_onoff_feedback', fcu.onoff)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000412', 'FCU_fan_feedback', fcu.fan_position)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000418', 'FCU_workingmode_feedback', fcu.mode)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000420', 'supply_temp', fcu.tw_supply)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000421', 'return_temp', fcu.tw_return)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000422', 'supply_pressure', fcu.tw_supplypressure)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000423', 'return_pressure', fcu.tw_returnpressure)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000424', 'waterflow', fcu.waterflow)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000426', 'valve_feedback', fcu.valve_position)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000810', 'occupant_num', room.occupant_num)
    cursor.execute(sql)
    sql = "INSERT INTO room_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x00000818', 'occupant_transform', room.occupant_trans)
    cursor.execute(sql)
    db.commit()


def W_pump_node(db, pump, time):
    table_name = 'pump_states'
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000200', 'pump_onoff_feedback', pump.onoff)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000210', 'pump_supplypressure', pump.p_supply)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000211', 'pump_returnpressure', pump.p_return)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000214', 'pump_flow', pump.G)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000215', 'pump_frequency_feedback', pump.n)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000240', 'pump_supplytemp', pump.supply_temp)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000241', 'pump_returntemp', pump.return_temp)
    cursor.execute(sql)
    sql = "INSERT INTO %s(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (table_name, time, '0x24000242', 'pump_valve_feedback', pump.valve_position)
    cursor.execute(sql)
    db.commit()


def W_heatpump_node(db, heatpump, hour, dry_bulb_t, damp, time):
    cursor = db.cursor()
    sql = "INSERT INTO heatpump_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000200', 'heatpump_onoff_feedback', heatpump.onoff)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000202', 'heatpump_supplytemp_feedback', heatpump.supplytemp)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000204', 'heatpump_workingmode_feedback', heatpump.mode)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000900', 'heatpump_flow_alarm', heatpump.flow_alarm)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000901', 'heatpump_temp_alarm', heatpump.temp_alarm)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x35000902', 'heatpump_pressure_alarm', heatpump.pressure_alarm)
    cursor.execute(sql)
    sql = "INSERT INTO heatpump_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x32000201', 'outdoor_temp', dry_bulb_t[hour])
    cursor.execute(sql)
    sql = "INSERT INTO heatpump_states(time, id ,name, value) VALUES (%d, '%s', '%s', %.1f)" % \
          (time, '0x32000202', 'outdoor_damp', damp[hour])
    cursor.execute(sql)


def R_room_node_control(db, fcu):
    cursor = db.cursor()
    for t in range(0, 80):
        sql = "SELECT %s, %s, %s, %s FROM room_control order by time DESC limit 6" % ('time', 'id', 'name', 'value')
        cursor.execute(sql)
        data1 = cursor.fetchall()
        if data1:
            if int(data1[0][0]) != int(data1[2][0]):
                time.sleep(0.1)
            else:
                for i in range (0, 3):
                    # assignment
                    if data1[i][2] == 'FCU_onoff_setpoint':
                        fcu.onoff_set = int(data1[i][3])
                    if data1[i][2] == 'FCU_fan_setpoint':
                        fcu.fan_set = int(data1[i][3])
                    if data1[i][2] == 'FCU_workingmode_setpoint':
                        fcu.mode_set = int(data1[i][3])
                    if data1[i][2] == 'valve_setpoint':
                        fcu.valve_set = float(data1[0][3])
                # fcu.onoff_set = int(data1[0][3])
                # fcu.fan_set = int(data1[1][3])
                # fcu.mode_set = int(data1[2][3])
                break
        else:
            fcu.mode_set = 1
            fcu.onoff_set = 1
            fcu.fan_set = 1
            fcu.valve_set = 100.0
            break


def R_pump_node_control(db, pump):
    cursor = db.cursor()
    for t in range(0, 80):
        sql = "SELECT %s, %s, %s, %s FROM pump_control order by time DESC limit 3" % ('time', 'id', 'name', 'value')
        cursor.execute(sql)
        data1 = cursor.fetchall()
        if data1:
            if int(data1[0][0]) != int(data1[1][0]):
                time.sleep(0.1)
            else:
                # assignment
                for i in range(0, 2):
                    if data1[i][2] == 'pump_onoff_setpoint':
                        pump.onoff_set = int(data1[i][3])
                    if data1[i][2] == 'pump_frequency_setpoint':
                        pump.n_set = int(data1[i][3])
                    if data1[i][2] == 'pump_valve_setpoint':
                        pump.valve_set = int(data1[i][3])
                break
        else:
            pump.n_set = 30
            pump.onoff_set = 1
            pump.pump.valve_set = 1
            break


def R_heatpump_node_control(db, heatpump):
    # cursor = db.cursor()
    # for t in range(0, 80):
    #     sql = "SELECT %s, %s, %s, %s FROM heatpump_panel_control" % ('time', 'id', 'name', 'value')
    #     cursor.execute(sql)
    #     data = cursor.fetchall()
    #     if data:
    #         if int(data[0][0]) != int(data[1][0]):
    #             time.sleep(0.1)
    #         else:
    #             # assignment
    #             heatpump.supply_tempset = int(data[0][3])
    #             heatpump.onoff_set = int(data[1][3])
    #             heatpump.mode = int(data[2][3])
    #             break
    #     else:
    #         heatpump.supply_tempset = 60.0
    #         heatpump.onoff_set = 1
    #         heatpump.mode = 2
    #         break
    heatpump.supply_tempset = 60.0
    heatpump.onoff_set = 1
    heatpump.mode = 2




if __name__ == '__main__':
    db = pymysql.connect(host="localhost", user="root", passwd="123456", db="mingze_simulator", charset='gbk')
    cursor = db.cursor()
    sql = "SELECT database()"
    cursor.execute(sql)
    dbname = cursor.fetchall()[0][0]
    sql = '''SELECT 
                table_name 
            FROM
                information_schema.TABLES 
            WHERE 
                table_schema = '%s'
    ''' % (dbname)
    cursor.execute(sql)
    data = cursor.fetchall()
    print(data)
    db.close()
