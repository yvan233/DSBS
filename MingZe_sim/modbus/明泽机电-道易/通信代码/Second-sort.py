# -*- coding: utf-8 -*-

#pip3 install modbus_tk pyserial
#需要设置USB端口正确，不正确不行

import serial
import time
import modbus_tk
import modbus_tk.defines as cst
from modbus_tk import modbus_rtu

master = modbus_rtu.RtuMaster (
    serial.Serial(port="/dev/ttyUSB0",baudrate=9600,bytesize=8,parity='N',stopbits=1,xonxoff=0)    
)
master.set_timeout(5.0)
master.set_verbose(True)

while True:
	try:
		
		'''
		下面是第二类房间代码
		↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		'''
		#下面介绍IO模块每个输入口分别接到哪个传感器上，以及对应的计算公式

		#读取地址为1的IO模块的8路AI继电器的值
		data_1 = master.execute(1, cst.READ_HOLDING_REGISTERS, 50, 8)
		#使用MODBUS协议必须的延时，IO模块厂家用的就是10ms延时，这里也用10ms
		time.sleep(0.01)

		#data_1[0]第一个室内温湿度传感器湿度值
		#计算公式：Humidity = (I - 4) * 25 / 4
		ma_H_0 = data_1[0] / 2500
		Humidity_0 = (ma_H_0 - 4) * 25 / 4
		
		#data_1[1]第一个室内温湿度传感器温度值
		#计算公式：Temperature = (I - 4) * 25 / 8
		ma_T_1 = data_1[1] / 2500
		Temperature_1 = (ma_T_1 - 4) * 25 / 8

		#data_1[2]第二个室内温湿度传感器湿度值
		#计算公式：Humidity = (I - 4) * 25 / 4
		ma_H_2 = data_1[2] / 2500
		Humidity_2 = (ma_H_2 - 4) * 25 / 4
		
		#data_1[3]第二个室内温湿度传感器温度值
		#计算公式：Temperature = (I - 4) * 25 / 8
		ma_T_3 = data_1[3] / 2500
		Temperature_3 = (ma_T_3 - 4) * 25 / 8

		#data_1[4]气体压差变送器
		#计算公式：Pressure = (I - 12) * 25 / 2
		ma_P_4 = data_1[4] / 2500
		Pressure_4 = (ma_P_4 - 12) * 25 / 2

		#data_1[5]供水温度传感器
		#计算公式：Temperature = (7 * I - 60) * 5 / 8
		ma_T_5 = data_1[5] / 2500
		Temperature_5 = (7 * ma_T_5 - 60) * 5 / 8

		#data_1[6]流量计
		#计算公式：Flowmeter = (I - 4) * 7 / 16
		ma_F_6 = data_1[6] / 2500
		Flowmeter_6 = (ma_F_6 - 4) * 7 / 16

		#data_1[7]回水温度传感器
		#计算公式：Temperature = (7 * I - 60) * 5 / 8
		ma_T_7 = data_1[7] / 2500
		Temperature_7 = (7 * ma_T_7 - 60) * 5 / 8

		#到此地址为1的IO模块读取数据及计算对应结果完毕

		#下面是风机盘管线控器控制代码，线控器地址：3
		'''
			在制冷模式下，只有当设置温度低于室内温度才可以控制风机高/中/低，否则风机一直关闭
			在制热模式下，只有当设置温度高于室内温度才可以控制风机高/中/低，否则风机一直关闭
			设设置温度公式：
				设置整数温度：写入数据 = 256 * 设置温度
				举例：设设置温度为23度
					写入数据 = 256 * 23 = 5888
				设置小数温度：写入数据 = 256 * 设置温度 + 5
					小数点后只能写5度
				举例：设设置温度为23.5度
					写入数据 = 256 * 23 + 5 = 5893
		'''
		#读取线控器值
		data_2 = master.execute(3, cst.READ_HOLDING_REGISTERS, 2, 10)
		time.sleep(0.02)

		#data_2[0]线控器状态
		Panel_0 = data_2[0]
		
		#data_2[1]线控器模式
		Panel_1 = data_2[1]

		#data_2[2]线控器设置温度
		Panel_2 = data_2[2]

		#data_2[3]线控器风机模式
		Panel_3 = data_2[3]

		#data_2[4]线控器机型
		Panel_4 = data_2[4]

		#data_2[5]线控器防冻温度
		Panel_5 = data_2[5]

		#data_2[6]线控器通讯检测
		Panel_6 = data_2[6]

		#data_2[7]线控器室内温度
		Panel_7 = data_2[7]

		#data_2[8]线控器防冻功能
		Panel_8 = data_2[8]

		#data_2[9]线控器键盘锁定
		Panel_9 = data_2[9]
		#读取线控器值完毕

		#下面是设置线控器
		#设置线控器状态 -> 关
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 2, output_value = 0)
		time.sleep(0.02)
		#设置线控器状态 -> 开
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 2, output_value = 1)
		time.sleep(0.02)
		#设置线控器模式 -> 制冷
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 3, output_value = 1)
		time.sleep(0.02)
		#设置线控器模式 -> 制热
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 3, output_value = 2)
		time.sleep(0.02)
		#设置线控器模式 -> 通风
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 3, output_value = 3)
		time.sleep(0.02)
		#设置线控器设置温度 -> 23度
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 4, output_value = 5888)
		time.sleep(0.02)
		#设置线控器设置温度 -> 23.5度
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 4, output_value = 5893)
		time.sleep(0.02)
		#设置线控器防冻温度 -> 5度
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 7, output_value = 1280)
		time.sleep(0.02)
		#设置线控器防冻功能 -> 关
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 11, output_value = 0)
		time.sleep(0.02)
		#设置线控器防冻功能 -> 开
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 11, output_value = 1)
		time.sleep(0.02)
		#设置线控器键盘锁定 -> 无
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 12, output_value = 0)
		time.sleep(0.02)
		#设置线控器键盘锁定 -> 有
		master.execute(3, cst.WRITE_SINGLE_REGISTER, 12, output_value = 1)
		time.sleep(0.02)
		#设置线控器键盘锁定 02 03功能码不能写入，和海林远程时明确说明这两个功能码不能写入
		'''↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑'''
	except Exception as err:
		print("err = ", err)