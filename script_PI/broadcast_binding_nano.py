# 向局域网内的nano传输binding文件

import paramiko
import os
import csv
import traceback
localpath = os.getcwd() + "/DASP/task_info/system/binding.csv"
with open(localpath,'r')as f:
    data = csv.reader(f)
    binding = []
    for i in data:
        binding.append(i)
for ele in binding[1:]:
    if ele[2] == "nano":
        try:
            hostname = ele[1]   #linux主机IP地址
            port = 22   #端口
            username = 'skl'   #用户名
            password = 'skl'    #密码
            t=paramiko.Transport((hostname,port))
            t.connect(username=username,password=password)
            sftp = paramiko.SFTPClient.from_transport(t)
            remotepath = '/home/skl/Desktop/FCHD-Fully-Convolutional-Head-Detecto/binding.csv'
            sftp.put(localpath, remotepath) #将windows的文件上传到linux中，put上传
            sftp.close()
            print( ele[0] + '上传成功！')  
        except Exception as e:
            print(traceback.format_exc())
            print( ele[0] + '上传失败！')  

