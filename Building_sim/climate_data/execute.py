import csv
import os


'''def makedirs():
    for k in range(133018,133115,3):
        folder = 'D:\\vav-simulator1\\reference\\' + str(k)
        os.mkdir(folder)

makedirs()'''

'''def FAI():

    for k in range (133018,133115,3):
        fai = []
        nrows = 0
        ncols = 0
        id = str(k)
        with open("D:\\vav-simulator1\\reference\\RESULT_ROOM_GROUP_FAI.csv","r") as f:
            csv_read = csv.reader(f)
            for line in csv_read:
                if(line[0] == id):
                    if(line[1] == '0'):
                        ncols = ncols + 1
                    fai.append(line[3])

            assert len(fai) > 0 and int(len(fai)) % ncols == 0
            nrows = int(len(fai)/ncols)
            fai = np.reshape(fai,(nrows,ncols))
            #print(fai)

        csvPath = 'D:\\vav-simulator1\\reference\\' + id + '\\' + 'fai.csv'

        with open(csvPath,"w", newline='') as t:
            csv_write = csv.writer(t)
            for i in range(nrows):
                csv_write.writerow(fai[i])

FAI()

def LAMDA():

    for k in range (133018,133115,3):
        lamda = []
        id = str(k)
        with open("D:\\vav-simulator1\\reference\\RESULT_ROOM_GROUP_LAMDA.csv","r") as f:
            csv_read = csv.reader(f)
            for line in csv_read:
                if(line[0] == id):
                    lamda.append(line[2])


        csvPath = 'D:\\vav-simulator1\\reference\\' + id + '\\' + 'lambda.csv'

        with open(csvPath,"w", newline='') as t:
            csv_write = csv.writer(t)
            csv_write.writerow(lamda)

LAMDA()

def sealT():

    for k in range (133018,133115,3):
        sealT = []
        id = str(k)
        with open("D:\\vav-simulator1\\reference\\RESULT_ROOM_GROUP.csv","r") as f:
            csv_read = csv.reader(f)
            for line in csv_read:
                if(line[0] == id):
                    sealT.append(line[2])

        csvPath = 'D:\\vav-simulator1\\reference\\' + id + '\\' + 'sealT.csv'

        with open(csvPath,"w", newline='') as t:
            csv_write = csv.writer(t)
            csv_write.writerow(sealT)

sealT()'''

def climateData():
    dry_BulbT = []
    damp = []
    with open("D:\\vav-simulator1\\climate_data\\CLIMATE_DATA.csv", "r") as f:
        csv_read = csv.reader(f)
        for line in csv_read:
            dry_BulbT.append(line[2])
            damp.append(line[3])

    csvPath = 'D:\\vav-simulator1\\climate_data\\' + '\\' + 'Dry_BulbT.csv'

    with open(csvPath, "w", newline='') as t:
        csv_write = csv.writer(t)
        csv_write.writerow(dry_BulbT)

    csvPath = 'D:\\vav-simulator1\\climate_data\\' + '\\' + 'Damp.csv'

    with open(csvPath, "w", newline='') as t:
        csv_write = csv.writer(t)
        csv_write.writerow(damp)

climateData()
