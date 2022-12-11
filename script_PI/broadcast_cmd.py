# 对局域网内的树莓派批量执行cmd命令

import paramiko
import os
import csv
import argparse

if __name__ == '__main__':


    parser = argparse.ArgumentParser()
    parser.add_argument("--cmd", type=str, default='sudo reboot')
    args = parser.parse_args()

    localpath = os.getcwd() + "/Dapp/Base/binding.csv"
    # 读取节点信息
    with open(localpath,'r')as f:
        data = csv.reader(f)
        binding = []
        for i in data:
            binding.append(i)

    for ele in binding[1:]:
        if ele[2] == "pi":
            if ele[1] != "offline":
                try:
                    hostname = ele[1]   #linux主机IP地址
                    port = 22   #端口
                    username = 'pi'   #用户名
                    password = 'raspberry'    #密码
                    t=paramiko.Transport((hostname,port))
                    t.connect(username=username,password=password)
                    ssh = paramiko.SSHClient()
                    ssh._transport = t
                    # 打开一个Channel并执行命令
                    cmd = args.cmd
                    stdin, stdout, stderr = ssh.exec_command(cmd,timeout=2)
                    # 打印执行结果
                    print(stdout.read().decode('utf-8'))
                    # 关闭SSHClient
                    t.close()
                    print( ele[0] + ' executes successfully!')  
                except Exception as e:
                    print( ele[0] + ' fails to execute!')  

