import math
import numpy as np
import csv

month_list = np.array([0,744,1416,2160,2880,3624,4344,5088,5832,6552,7296,8016])  # The first hour of month
dry_bulb_his = np.zeros(8760)
damp_his = np.zeros(8760)

PI = 3.14
g = 9.8
Rc = 287.042
max_iter = 100
indoor_air_velocity = 0.15
sup_temp = 12.0

#Heat and damp
c = 1.005   #  kJ/(kg*K)
qp = 0.07   #  Personal heat, kW
dp = 150    #  Personal damp, g/h
qd = 0.08   #  Device heat per person, kW

# Envelope
wall_area = np.array([[0, 0, 21, 0], [0, 0, 21, 0], [0, 0, 21, 0], [21, 0, 0, 0], \
                      [21, 0, 0, 0], [21, 0, 0, 0], [21, 0, 0, 0], [21, 21, 0, 0]])
# Solar (with OTTV algorithm)
WWR = 0.25  #  Window-Wall-Ratio
SF = np.array([51.1, 88.8, 123.3, 119.1, 174.6])   # Solar Factor [N, W, S, E, Horizon]
Sc = 0.62  #  Curtain factor
Uw = 0.85  #  Wall heat factor
Uf = 2.0  #  Window heat factor
Ur = 0.5  #  Roof heat factor
alpha = 0.8  #  Wall factor
Rsow = 0.044  #  Wall heat resistance
Rsor = 0.055  #  Roof heat resistance
It = np.zeros((1440, 5))
Itd = np.zeros((1440, 5))
for i in range (0, 5):
    for j in range (0, 1440):
        It[j][i] = SF[i] * math.cos((j-720) * PI / 720)

# Climate
dry_bulb_file = open('./climate_data/' + 'Dry_BulbT.csv')
reader = csv.reader(dry_bulb_file)
data = list(reader)
for i in range (0, 8760):
    dry_bulb_his[i] = float(data[0][i])
dry_bulb_file.close()
damp_file = open('./climate_data/' + 'Damp.csv')
reader = csv.reader(damp_file)
data = list(reader)
for i in range (0, 8760):
    damp_his[i] = float(data[0][i])
damp_file.close()
#  Air duct system
fan_n = 40.0    #  Hz
#  Adj matrix
adj_file = open('./adj.csv')
reader = csv.reader(adj_file)
data = list(reader)
nodes = len(data)
branches = len(data[0])
diff = branches - nodes
A_init = np.zeros((nodes, branches))
for i in range(0, nodes):
    for j in range(0, branches):
        if (data[i][j] == '1') or (data[i][j] == '-1'):
            A_init[i][j] = int(data[i][j])
adj_file.close()
#  Resistance list
res_file = open('./pipe.csv')
reader = csv.reader(res_file)
data = list(reader)
pipe_d_init = np.zeros(branches)
pipe_area_init = np.zeros(branches)
pipe_length_init = np.zeros(branches)
pipe_local_s_init = np.zeros(branches)
pipe_z_init = np.zeros((branches,1))
for i in range (0, branches):
    pipe_d_init[i] = float(data[0][i])
    pipe_area_init[i] = float(data[1][i])
    pipe_length_init[i] = float(data[2][i])
    pipe_local_s_init[i] = float(data[3][i])
    pipe_z_init[i][0] = float(data[4][i])
res_file.close()

# Calculation matrices
# Init
G_init = np.ones((branches, 1))             #  Volume flow of nodes  m3/s
Q_init = np.zeros((nodes, 1))               #  Air integration of nodes (only occurs in zones)  m3/s
abs_G_init = np.eye(branches)               #  Absolute value
delta_H_init = np.zeros((branches, 1))      #  Pressure loss of branches
S_init = np.eye(branches)                   #  Resistance of branches
DH_init = np.zeros((branches, 1))           #  Fan head   Pa

# Rearranged
pipe_d = np.zeros(branches)
pipe_area = np.zeros(branches)
pipe_length = np.zeros(branches)
pipe_local_s = np.zeros(branches)
pipe_z = np.zeros((branches,1))
A = np.zeros((nodes, branches))
G = np.zeros((branches, 1))
G_min = np.zeros((branches, 1))             #  Sum G in the min
Q = np.zeros((nodes, 1))
abs_G = np.zeros((branches, branches))
P = np.zeros((nodes, 1))                    #  Static pressure of nodes  Pa
delta_H = np.zeros((branches, 1))
delta_Ht = np.zeros((nodes, 1))
S = np.zeros((branches, branches))
DH = np.zeros((branches, 1))
F = np.zeros((diff, 1))
SGG = np.zeros((branches, 1))
Gl = np.zeros((diff, 1))
dGl = np.zeros((diff, 1))
dDH_dG = np.zeros((branches, branches))
G_rec = np.zeros(branches)
dF_dGl = np.zeros((diff, diff))
dS_dG = np.zeros((branches, branches))
ddeltaPv_dG = np.zeros((branches, branches))
Cq = np.zeros(branches)

At = np.zeros((nodes, nodes))
Al = np.zeros((nodes, diff))

return_airtemp1 = 0.       #  Air temp of N1-18
return_airtemp2 = 0.       #  Air temp of N2-18
mix_airtemp1 = 0.          #  Air temp of N1-19
mix_airtemp2 = 0.          #  Air temp of N2-19
F1_airflow = 0.
F2_airflow = 0.
zone_result = np.ones(5)
duct_result = np.zeros(branches)

valve_stepmax = 15.0
pump_stepmax = 5.0