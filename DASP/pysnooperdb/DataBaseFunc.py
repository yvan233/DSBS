import pymysql
Default_Config= {
    'host': "127.0.0.1",
    'port': 3306,
    'user': 'root',
    'password': 'DSPadmin',
    }

class DaspMysqlCommon:
    """
    Dasp Mysql公共函数
    """
    def __init__(self, config = Default_Config, db = 'Daspdb'):
        self.host = config['host']
        self.port = config['port']
        self.user = config['user']
        self.password = config['password']
        self.database = db
        self.connection = pymysql.connect(host=self.host,
                                          port=self.port,
                                          user=self.user,
                                          password=self.password,
                                          charset='utf8mb4'
                                          )
        self.cursor = self.connection.cursor()
        self.use_database()

    def is_connected(self):
        """判断数据库连接是否存在，如果断开则重连
        """
        try:
            self.connection.ping()
        except Exception:
            self.connection = pymysql.connect(host=self.host,
                                            port=self.port,
                                            user=self.user,
                                            password=self.password,
                                            charset='utf8mb4'
                                            )
            self.cursor = self.connection.cursor()
            self.use_database()


    def use_database(self):
        """使用database数据库
        """
        sql = "CREATE DATABASE IF NOT EXISTS {}".format(self.database)
        self.cursor.execute(sql)
        sql = "USE {}".format(self.database)
        self.cursor.execute(sql)

    def show_columns(self, tablename):
        """获取列字段
        """
        sql_columns = "SHOW COLUMNS FROM `{}`".format(tablename)
        self.cursor.execute(sql_columns)
        answer = self.cursor.fetchall()
        columns = [column[0] for column in answer]
        return columns

    def __exit__(self):
        self.connection.commit()
        self.cursor.close()
        self.connection.close()

class DaspMysqlServer(DaspMysqlCommon):
    """
    Dasp Mysql服务器端，包含创建、插入等操作
    """
    def __init__(self, config = Default_Config, db = 'Daspdb', tablename = 'default', observelist = []):
        super(DaspMysqlServer,self).__init__(config, db)
        self.tablename = tablename
        self.observelist = observelist

    def create_debug_table(self):
        """创建调试数据表
        """
        var_list = [m + ' VARCHAR(255),' for m in self.observelist]
        var_list = ''.join(var_list)
        self.is_connected()
        sql_drop = "DROP TABLE IF EXISTS `{}`" .format(self.tablename)
        self.cursor.execute(sql_drop)
        sql_create = """CREATE TABLE `{}` (
                id INT NOT NULL AUTO_INCREMENT,
                time VARCHAR(255),
                codeline VARCHAR(255),
                code VARCHAR(255),
                {}
                PRIMARY KEY ( id )  )character set = utf8""".format(self.tablename, var_list)
        self.cursor.execute(sql_create)
        self.connection.commit()

    def insert_debug_table(self, time, codeline, code, name, value):
        """插入调试数据
        """
        time = str(time)
        codeline = str(codeline)
        code = str(code).replace("'","")
        name = str(name)
        value = str(value).replace("'","")

        if name in self.observelist:
            self.is_connected()
            # 开始插入，复制上一行，只把name值改为value
            sql_select = "SELECT * FROM `{}` ORDER BY id DESC LIMIT 1" .format(self.tablename)
            self.cursor.execute(sql_select)
            value_line = self.cursor.fetchone()
            if not value_line: #若为空表
                value_line = [pymysql.NULL] * len(self.observelist)
            else:
                value_line = list(value_line)[4:]

            index = self.observelist.index(name)
            value_line[index] = value

            var_list = ["`{}`".format(m) for m in self.observelist]
            var_list = ",".join(var_list)

            value_list = ["'{}'".format(m) for m in value_line]
            value_list = ",".join(value_list)
            value_list = value_list.replace("None", pymysql.NULL)

            sql_insert = "INSERT INTO `{}` (`time`, `codeline`, `code`, {}) VALUES ('{}', '{}', '{}', {})"\
                .format(self.tablename, var_list, time, codeline, code, value_list)
            self.cursor.execute(sql_insert)
            self.connection.commit()

class DaspMysqlClient(DaspMysqlCommon):
    """
    Dasp Mysql客户端，包含查询、删除等操作
    """
    def __init__(self, config = Default_Config, db = 'Daspdb'):
        super(DaspMysqlClient,self).__init__(config, db)

    def show_tables(self):
        """显示所有数据表
        """
        self.is_connected()
        self.cursor.execute("SHOW TABLES")
        answer = self.cursor.fetchall()
        columns = [column[0] for column in answer]
        columns.insert(0,"Tables_in_{}".format(self.database))
        self.connection.commit()
        return columns

    def delete_table(self, tablename):
        """删除数据表
        """
        self.is_connected()
        sql_drop = "DROP TABLE IF EXISTS `{}`" .format(tablename)
        self.cursor.execute(sql_drop)  
        self.connection.commit()

    def show_table(self, tablename):
        """显示数据表的数据
        """
        self.is_connected()
        # 获取列名
        columns = self.show_columns(tablename)

        sql_select = "SELECT * FROM `{}`".format(tablename)
        self.cursor.execute(sql_select)   
        rows = self.cursor.fetchall()
        rows = [list(ele) for ele in rows]
        result = [columns,rows]
        self.connection.commit()
        return result

    def create_runtable(self, taskname):
        """创建运行数据表
        """
        self.is_connected()
        sql = """CREATE TABLE IF NOT EXISTS  RUNINFO_{} (
                recordid INT NOT NULL AUTO_INCREMENT,
                运行信息 VARCHAR(20000),
                PRIMARY KEY ( recordid )  )character set = utf8""".format(taskname)
        self.cursor.execute(sql)
        self.connection.commit()


    def insert_runtable(self, taskname, info):
        """插入运行数据表
        """
        # info中的'会导致插入错误
        info = info.replace("'","")
        self.is_connected()
        sql = "INSERT INTO RUNINFO_{} (运行信息) VALUES ('{}')".format(taskname, info)
        self.cursor.execute(sql)
        self.connection.commit()

if __name__ == '__main__':

    # observelist = ["x", "m", "adjdata"]

    # db = DaspMysqlServer(Default_Config,'Daspdb','test123',observelist)
    # db.create_debug_table()
    # db.insert_debug_table('1','1','1','x','1')
    # db.create_debug_table('test' , observelist)
    # print(db.show_tables())
    # table = db.show_table('default_node_1')
    # print(table)  
    db2 = DaspMysqlClient(Default_Config,'Daspdb')
    # print (db2.show_table('test123'))
    db2.create_runtable('test')
    db2.insert_runtable('test','abc')