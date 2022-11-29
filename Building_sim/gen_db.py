import time
import pymysql
import numpy as np
import paramiko

NODE = '192.168.3.3'
NODE_USER = 'pi'
NODE_PASSWORD = 'raspberry'
NODE_MYSQL_USER = 'root'
NODE_MYSQL_PASSWORD = 'cfins'


def gen_database(node=NODE, type='room', user=NODE, pd=NODE_PASSWORD, my_user=NODE_MYSQL_USER, my_pd=NODE_MYSQL_PASSWORD):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(node, 22, user, pd, timeout=15)
    if type == 'room':
        stdin, stdout, stderr = ssh.exec_command(
            "mysql -u "+my_user+" -p; "+my_pd+"; create database room; use room; " +
            "alter database room character set gbk; " +
            "create table room_states(time int primary key, id varchar(100), name varchar(100), value float); " +
            "create table room_control(time int primary key, id varchar(100), name varchar(100), value float); " +
            "alter table room_states character set gbk; " +
            "alter table room_control character set gbk;")
    elif type == 'pump':
        stdin, stdout, stderr = ssh.exec_command(
            "mysql -u " + my_user + " -p; " + my_pd + "; create database pump; use pump; " +
            "alter database pump character set gbk; " +
            "create table pump_states(time int primary key, id varchar(100), name varchar(100), value float); " +
            "create table pump_control(time int primary key, id varchar(100), name varchar(100), value float); " +
            "alter table pump_states character set gbk; " +
            "alter table pump_control character set gbk;")


if __name__ == "__main__":
    db = pymysql.connect(host="192.168.3.3", user="root", passwd="cfins", db="room", charset='gbk')
    cursor = db.cursor()

    sql = "show tables"
    cursor.execute(sql)
    data1 = cursor.fetchall()
    print(data1)