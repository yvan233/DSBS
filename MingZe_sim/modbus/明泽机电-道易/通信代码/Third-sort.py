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
		下面是第三类房间的代码
		↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		'''
		#1、供水管主管加回水管

		#下面介绍IO模块每个输入口分别接到哪个传感器上，以及对应的计算公式

		#读取地址为1的IO模块的8路AI继电器的值
		data_1 = master.execute(1, cst.READ_HOLDING_REGISTERS, 50, 8)
		#使用MODBUS协议必须的延时，IO模块厂家用的就是10ms延时，这里也用10ms
		time.sleep(0.01)

		#data_1[0]回水管温度传感器
		#计算公式：Temperature = (7 * I - 60) * 5 / 8
		ma_T_0 = data_1[0] / 2500
		Temperature_0 = (7 * ma_T_0 - 60) * 5 / 8

		#data_1[1]供水管温度传感器
		#计算公式：Temperature = (7 * I - 60) * 5 / 8
		ma_T_1 = data_1[1] / 2500
		Temperature_1 = (7 * ma_T_1 - 60) * 5 / 8
		
		#data_1[2] -> 空
		#data_1[3] -> 空
		#data_1[4] -> 空
		#data_1[5] -> 空
		#data_1[6] -> 空
		#data_1[7] -> 空

		#到此地址为1的IO模块读取数据及计算对应结果完毕

		#2、供水管备用管
		#读取地址为1的IO模块的8路AI继电器的值
		data_1 = master.execute(1, cst.READ_HOLDING_REGISTERS, 50, 8)
		#使用MODBUS协议必须的延时，IO模块厂家用的就是10ms延时，这里也用10ms
		time.sleep(0.01)

		#data_1[0]供水管温度传感器
		#计算公式：Temperature = (7 * I - 60) * 5 / 8
		ma_T_0 = data_1[0] / 2500
		Temperature_0 = (7 * ma_T_0 - 60) * 5 / 8

		#data_1[1] -> 空
		#data_1[2] -> 空
		#data_1[3] -> 空
		#data_1[4] -> 空
		#data_1[5] -> 空
		#data_1[6] -> 空
		#data_1[7] -> 空

		'''↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑'''
	except Exception as err:
		print("err = ", err)