# -*- coding: utf-8 -*-
#pip3 install modbus_tk

import serial
import time
import modbus_tk
import modbus_tk.defines as cst
from modbus_tk import modbus_rtu


master = modbus_rtu.RtuMaster (
    serial.Serial(port="/dev/ttyS0",baudrate=9600,bytesize=8,parity='N',stopbits=1,xonxoff=0)    
)
master.set_timeout(5.0)
master.set_verbose(True)

#获取四路继电器状态->地址为1的继电器             
modbus_relay_addr_1=master.execute(1, cst.READ_COILS,0,16)
#modbus协议必要的延时，不能去掉
time.sleep(0.02)

#打开地址为1的继电器的第一路
'''解析：
    1                       地址
    cst.WRITE_SINGLE_COIL   写线圈
    0                       代码中的0，代表第一路继电器
    output_value=1          给继电器的值：1表示打开，0表示关闭'''
master.execute(1,cst.WRITE_SINGLE_COIL,1,output_value=1)
time.sleep(0.02) 

'''
一些常用的功能码
READ_COILS                     H01  读线圈
READ_DISCRETE_INPUTS           H02  读离散输入
READ_HOLDING_REGISTERS         H03  读寄存器
READ_INPUT_REGISTERS           H04  读输入寄存器
WRITE_SINGLE_COIL              H05  写单一线圈
WRITE_SINGLE_REGISTER          H06  写单一寄存器
WRITE_MULTIPLE_COILS           H15  写多个线圈 
WRITE_MULTIPLE_REGISTERS       H16  写多寄存器 
'''

