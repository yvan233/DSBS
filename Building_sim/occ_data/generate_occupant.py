import csv
import datetime

root = 'D:/Python Projects/Building Model Py/occupant_data/'
origin_file_name = root + 'zone20_origin.csv'
origin_file = open(origin_file_name)
reader = csv.reader(origin_file)
data = list(reader)
ori_len = len(data)
time_data = []
occ_data = []
for t in range(ori_len):
    if data[t][1][1] == ':':
        data[t][1] = '0' + data[t][1]
    time_data.append(data[t][1])
    occ_data.append(data[t][2])

file_name = root + 'zone20_day1.csv'
file = open(file_name, 'w', newline='')
w_file = csv.writer(file)

time = datetime.datetime(2019, 8, 6, 0, 0, 0)
occ_num = '0'
for rows in range(86401):
    if rows == 0:
        w_file.writerow(['Second', 'Time', 'Occupant_num'])
    else:
        stime = time.strftime('%H:%M:%S')
        for t in range(ori_len):
            if stime == time_data[t]:
                occ_num = occ_data[t]
        w_file.writerow([str(rows - 1), stime, occ_num])
        time += datetime.timedelta(seconds = 1)

origin_file.close()
file.close()