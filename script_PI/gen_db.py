import pymysql
import os
import csv
class MysqlInit:
    def __init__(self, host = "localhost", port = 3306, user = "root", password = "cfins"):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.connection = pymysql.connect(host=self.host,
                                          port=self.port,
                                          user=self.user,
                                          password=self.password,
                                          charset='utf8mb4'
                                          )
        self.cursor = self.connection.cursor()
        self.use_database("room")
        self.create_table("room")
        self.use_database("pump")
        self.create_table("pump")
        self.use_database("heatpump")
        self.create_table("heatpump")

    def use_database(self,database):
        """使用database数据库
        """
        sql = "CREATE DATABASE IF NOT EXISTS {}".format(database)
        self.cursor.execute(sql)
        sql = "USE {}".format(database)
        self.cursor.execute(sql)

    def create_table(self,type="room"):
        sql0 = f"DROP TABLE IF EXISTS {type}_states;"
        sql1 = f"create table {type}_states(time int, id varchar(100), name varchar(100), value float, PRIMARY KEY (`time`,`id`)) character set = utf8; "
        sql2 = f"DROP TABLE IF EXISTS {type}_control;"
        sql3 = f"create table {type}_control(time int, id varchar(100), name varchar(100), value float, PRIMARY KEY (`time`,`id`)) character set = utf8; "
        self.cursor.execute(sql0)
        self.cursor.execute(sql1)
        self.cursor.execute(sql2)
        self.cursor.execute(sql3)
        self.connection.commit()

    def __exit__(self):
        self.connection.commit()
        self.cursor.close()
        self.connection.close()


if __name__ == "__main__":
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
                    db = MysqlInit(host = ele[1])
                    print( ele[0] + ' executes successfully!')  
                except Exception as e:
                    print( ele[0] + ' fails to execute!')  

    