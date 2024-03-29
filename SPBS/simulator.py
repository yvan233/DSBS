from basic_function import *
import time as T
import pymysql
from room_control import cal_fcu_fan, write_room_control
from pump_control import con_pump, write_controlpump

HOST="localhost"
USER="root"
PASSWORD="cfins"
DB="mingze_simulator"

# Initialization
# Time
init_time = 5289  # August 9th 9:00am
step_hour = init_time
# Initialize matrices
for i in range(0, branches):
    G_init[i][0] = pipe_area_init[i] * 0.9 * 3600
    abs_G_init[i][i] = abs(G_init[i][0])
    S_init[i][i] = pipe_local_s_init[i]
# Matrices adjustment
flag = max_colume_irrelevant_group(A_init)
new_columes = np.zeros(branches)
for i in range(0, branches):
    if i < nodes:
        new_columes[i] = flag[i]
    else:
        for j in range(0, branches):
            for k in range(0, i):
                stat = 0
                if new_columes[k] == j:
                    stat = 1
                    break
            if stat == 0:
                new_columes[i] = j
                break
            else:
                continue
# Rearrange calculation matrices
for m in range(0, nodes):
    for n in range(0, branches):
        new = int(new_columes[n])
        if n < nodes:
            At[m][n] = A_init[m][new]
        else:
            Al[m][(n-nodes)] = A_init[m][new]
        A[m][n] = A_init[m][new]
for i in range(0, branches):
    new = int(new_columes[i])
    pipe_d[i] = pipe_d_init[new]
    pipe_area[i] = pipe_area_init[new]
    pipe_length[i] = pipe_length_init[new]
    pipe_local_s[i] = pipe_local_s_init[new]
    pipe_z[i][0] = pipe_z_init[new][0]
    S[i][i] = S_init[new][new]
    G[i][0] = G_init[new][0]
    abs_G[i][i] = abs(G[i][0])
for j in range(0, diff):
    Gl[j][0] = G[j + nodes][0]
for k in range(0, branches):
    if A[1][k] == 1:
        pump1_branch = k
    # if A[2][k] == 1:
    #     pump2_branch = k
Al_T = np.transpose(Al)
mat = Matrix(At)
mat_new = mat.rref()
At_inv = np.linalg.inv(At)
At_invT = np.transpose(At_inv)
b = np.dot(Al_T, At_invT)
Bf = np.zeros((diff, branches))
for i in range(0, diff):
    for j in range(0, branches):
        if j < nodes:
            Bf[i][j] = -1 * b[i][j]
        else:
            if j - nodes == i:
                Bf[i][j] = 1


# Simulation start
# DB initialization
db = pymysql.connect(host=HOST, user=USER, passwd=PASSWORD, db=DB, charset='gbk')
cursor = db.cursor()
clear_db(db)
init_control(db)

# Initialize database
G_rec = G_init     #  m3/h
G_str = ''
P_str = ''
for g in range(0, branches):
    if g < (branches - 1):
        G_str += str(round(G_rec[g][0], 4)) + '|' + ' '
    else:
        G_str += str(round(G_rec[g][0], 4))
for n in range(0, nodes):
    if n < (nodes - 1):
        P_str += str(round(P[n][0], 1)) + '|' + ' '
    else:
        P_str += str(round(P[n][0], 1))
W_pipenet(db, G_str, P_str, 0)
# room record
for r in range(0, 7):
    W_room(db, room_list[r], fcu_list[r], dry_bulb_his[step_hour], r+1, 0)
# pump record
W_pump(db, pump_list[0], 1, 0)
# heatpump record
W_heatpump(db, heatpump, 0)
# outdoor record
W_outdoor(db, step_hour, dry_bulb_his, damp_his, 0)
db.commit()


# Run
for step_min in range (1, 601):      # min
    print('time = %d min' % step_min)
    start_t = T.time()
    T_delta = 6
    if step_min % 60 == 0:
        step_hour += 1
    # Time set
    minute = ((init_time % 24) * 60 + step_min) % (24 * 60)     # The minute of the day
    day = (init_time / 24 + int(step_min / 1440)) % 365 + 1
    if step_min == 1:
        day_rec = day
    if (step_min == 1) or (day != day_rec):
        cal_solar(day)
        day_rec = day
    return_sum = 0
    # Initialize control
    if step_min == 0:
        init_control(db)
    # Read control signal
    for r in range(0, 7):
        R_room_control(db, r, fcu_list[r])
        fcu_list[r].fan_position = fcu_list[r].fan_set
        if abs(fcu_list[r].valve_set - fcu_list[r].valve_position) > valve_stepmax:
            fcu_list[r].valve_position += sign(fcu_list[r].valve_set - fcu_list[r].valve_position) * valve_stepmax
        else:
            fcu_list[r].valve_position = fcu_list[r].valve_set
    R_pump_control(db, pump_list[0])
    pump_list[0].valve_position = pump_list[0].valve_set
    pump_list[0].onoff = pump_list[0].onoff_set
    if abs(pump_list[0].n_set - pump_list[0].n) > pump_stepmax:
        pump_list[0].n += sign(pump_list[0].n_set - pump_list[0].n) * pump_stepmax
    else:
        pump_list[0].n = pump_list[0].n_set
    R_heatpump_control(db, heatpump)
    # Cal resistance
    s_valve = np.zeros((branches, branches))
    for j in range(0, branches):
        if A[1][j] == 1 and A[20][j] == -1:
            s_valve[j][j] = cal_pump_valve(pump_list[0].valve_position)
    for i in range(3, 11):
        for j in range(0, branches):
            if A[i][j] == 1 and A[i+9][j] == -1:
                s_valve[j][j] = cal_valve_Sv(fcu_list[fcu_order[i-3]].valve_position)
                fcu_list[fcu_order[i-3]].waterflow = G[j][0]
    s_total = S + s_valve
    # Cal pipe_net
    for iter in range(0, max_iter):
        pump1.G = G[pump1_branch][0]
        #pump2.G = G[pump2_branch][0]
        pump1.cal_pump()
        #pump2.cal_pump()
        DH[pump1_branch][0] = pump1.H
        #DH[pump2_branch][0] = pump2.H
        SGG = np.dot(np.dot(s_total, abs_G), G)
        delta_H = SGG + 9800 * pipe_z - DH
        for i in range(0, nodes):
            delta_Ht[i][0] = delta_H[i][0]
        P = np.dot(At_invT, delta_Ht)
        F = np.dot(Bf, delta_H)
        if F.max() <= 1 and F.min() >= -1:
            G = np.dot(Bf.T, Gl)
            break
        else:
            dDH_dG[pump1_branch][pump1_branch] = pump1.dH_dG
            #dDH_dG[pump2_branch][pump2_branch] = pump2.dH_dG
            dF_dGl = np.dot(np.dot(Bf, (2 * np.dot(s_total, abs_G) - dDH_dG)), Bf.T)
            u = np.linalg.eigvals(dF_dGl)
            dGl = np.dot(np.linalg.inv(dF_dGl), F)
            if iter <= 10:
                step_ratio = 0.5
            if iter > 10 and iter <= 50:
                step_ratio = 0.1
            else:
                step_ratio = 0.05
            for i in range(0, diff):
                Gl[i][0] -= dGl[i][0] * step_ratio
            G = np.dot(Bf.T, Gl)

    # Cal room & pump
    G_rec = show_origin(G, new_columes)  # m3/h
    P -= (P[11][0] - 10000) * np.ones((nodes, 1))
    for r in range(0, 7):
        rou = cal_density(sup_temp)
        if step_min % 5 == 0:
            if step_min >= 5:
                occ_list = np.zeros(5)
                sql = "SELECT %s, %s, %s, %s FROM room"%('time', 'id', 'name', 'value')+str(r+1)+" WHERE name='occupant_num' order by time DESC limit 5"
                cursor.execute(sql)
                occ_data = cursor.fetchall()
                for i in range(0, 5):
                    occ_list[5 - 1 - i] = float(occ_data[i][3])
            fan_onoff_s, fan_control_s = cal_fcu_fan(24, room_list[r].temp, fcu_list[r].fan_position, fcu_list[r].onoff, occ_list)       # Room control
            fcu_list[r].onoff_set = fan_onoff_s
            fcu_list[r].fan_set = fan_control_s
            fcu_list[r].fan_position = fcu_list[r].fan_set
        fcu_list[r].cal_fan_G()
        fcu_list[r].cal_power()
        fcu_list[r].cal_supplyair(room_list[r].temp)
        R_room_occ(step_min, room_list[r])
        room_list[r].cal_room(dry_bulb_his[step_hour], step_min, rou, fcu_list[r].G_fan)
        fcu_list[r].cal_returntemp(room_list[r].Qa / 60)
        return_sum += 0.95 * fcu_list[r].waterflow * fcu_list[r].tw_return
        fcu_list[r].tw_supplypressure = P[r+3][0]
        fcu_list[r].tw_returnpressure = P[r+12][0]
    pump1.p_return = P[1][0]
    if step_min % 15 == 0:
        pump1.n_set = con_pump(pump1.supply_temp,pump1.return_temp,pump1.n)
    pump1.cal_pump()
    pump1.G = G_rec[26]
    pump1.return_temp = return_sum / pump1.G

    # Record pipe_net
    G_str = ''
    P_str = ''
    for g in range(0, branches):
        if g < (branches - 1):
            G_str += str(round(G_rec[g], 4)) + '|' + ' '
        else:
            G_str += str(round(G_rec[g], 4))
    for n in range(0, nodes):
        if n < (nodes - 1):
            P_str += str(round(P[n][0], 1)) + '|' + ' '
        else:
            P_str += str(round(P[n][0], 1))
    W_pipenet(db, G_str, P_str, step_min)
    # room record
    for r in range(0, 7):
        W_room(db, room_list[r], fcu_list[r], dry_bulb_his[step_hour], r+1, step_min)
        write_room_control(db, step_min, r, fcu_list[r].onoff_set, fcu_list[r].fan_set, fcu_list[r].mode, fcu_list[r].valve_set)
    db.commit()
    # pump record
    # for p in range(0, 2):
    #     W_pump(db, pump_list[p], p+1, step_min)
    W_pump(db, pump_list[0], 1, step_min)
    write_controlpump(db, step_min, pump_list[0].n_set)
    # heatpump record
    W_heatpump(db, heatpump, step_min)
    # outdoor record
    W_outdoor(db, step_hour, dry_bulb_his, damp_his, step_min)
    db.commit()

    # if T_delta + start_t - T.time() > 0:
    #     T.sleep(T_delta + start_t - T.time())

# DB close
db.close()