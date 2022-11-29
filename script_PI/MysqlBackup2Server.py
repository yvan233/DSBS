# 备份数据库文件
import paramiko
import os
import csv
from stat import S_ISDIR as isdir

def down_from_remote(sftp_obj, remote_dir_name, local_dir_name):
    """远程下载文件"""
    remote_file = sftp_obj.stat(remote_dir_name)
    if isdir(remote_file.st_mode):
        # 文件夹，不能直接下载，需要继续循环
        check_local_dir(local_dir_name)
        print('开始下载数据目录：' + remote_dir_name)
        for remote_file_name in sftp.listdir(remote_dir_name):
            local_file_name = os.path.join(local_dir, remote_file_name)
            #转换 : -> _
            local_file_name = local_file_name.replace(':','_')
            #转换/及\\
            sub_remote = os.path.join(remote_dir_name, remote_file_name)
            sub_remote = sub_remote.replace('\\', '/')
            sub_local = os.path.join(local_dir_name, remote_file_name)
            sub_local = sub_local.replace('\\', '/')
            sub_local = sub_local.replace(':', '_')
            
            #如果本地没有远程数据文件夹
            if not os.path.exists(local_file_name):
                down_from_remote(sftp_obj, sub_remote, sub_local)
    else:
        # 文件，直接下载
        print('开始下载数据文件：' + remote_dir_name)
        # 如果本地没有远程数据文件
        local_file_name = os.path.join(local_dir, remote_dir_name)

        if not os.path.exists(local_file_name):
            sftp.get(remote_dir_name, local_dir_name)

def check_local_dir(local_dir_name):
    """本地文件夹是否存在，不存在则创建"""
    if not os.path.exists(local_dir_name):
        os.makedirs(local_dir_name)

if __name__ == "__main__":
    localpath = os.getcwd() + "/DASP/task_info/system/binding.csv"
    # 读取节点信息
    with open(localpath,'r')as f:
        data = csv.reader(f)
        idiplist = []
        for i in data:
            idiplist.append(i)
    for ele in idiplist[1:]:
        if ele[1] != "false":
            try:
                # 服务器连接信息
                host_name = ele[1]
                user_name = 'pi'
                password = 'raspberry'
                port = 22
                # 远程文件路径（需要绝对路径）
                remote_dir = '/home/pi/xingtian/device1.0-master/DB_Backup'
                # 本地文件存放路径（绝对路径或者相对路径都可以）
                local_dir = 'DB_Backup/' + ele[0]
                # 连接远程服务器
                t = paramiko.Transport((host_name, port))
                t.connect(username=user_name, password=password)
                sftp = paramiko.SFTPClient.from_transport(t)

                print( ele[0] + '开始备份！')  
                # 远程文件开始下载
                down_from_remote(sftp, remote_dir, local_dir)
                # 关闭连接
                t.close()
                print( ele[0] + '备份成功！')  
            except Exception as e:
                print( ele[0] + '备份失败！') 


