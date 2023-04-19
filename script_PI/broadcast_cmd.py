# Excute command on raspberry pi in LAN
import paramiko
import os
import csv
import argparse

if __name__ == '__main__':


    parser = argparse.ArgumentParser()
    parser.add_argument("--cmd", type=str, default='sudo reboot')
    args = parser.parse_args()

    localpath = os.getcwd() + "/Dapp/Base/binding.csv"
    with open(localpath,'r')as f:
        data = csv.reader(f)
        binding = []
        for i in data:
            binding.append(i)

    for ele in binding[1:]:
        if ele[2] == "pi":
            if ele[1] != "offline":
                try:
                    hostname = ele[1]   #linux ip
                    port = 22   
                    username = 'pi'  
                    password = 'raspberry'   
                    t=paramiko.Transport((hostname,port))
                    t.connect(username=username,password=password)
                    ssh = paramiko.SSHClient()
                    ssh._transport = t
                    # open a session and execute command
                    cmd = args.cmd
                    stdin, stdout, stderr = ssh.exec_command(cmd,timeout=2)
                    print(stdout.read().decode('utf-8'))
                    t.close()
                    print( ele[0] + ' executes successfully!')  
                except Exception as e:
                    print( ele[0] + ' fails to execute!')  

