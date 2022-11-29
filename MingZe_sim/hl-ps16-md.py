# -*- coding: utf-8 -*-

import serial
import time
import modbus_tk
import modbus_tk.defines as cst
from modbus_tk import modbus_rtu

def hex_to_float(h):
    i = int(h, 16)
    return struct.unpack('<f', struct.pack('<I', i))[0]

master = modbus_rtu.RtuMaster (
	serial.Serial(port="/dev/ttyUSB0",baudrate=9600,bytesize=8,parity='N',stopbits=1,xonxoff=0)
)
master.set_timeout(5.0)
master.set_verbose(True)

while True:
	try:
		
		data = master.execute(2, cst.READ_HOLDING_REGISTERS, 20, 2)
		time.sleep(0.01)
		
		print('data', data) 
		
		(h, l) = data
		dataStr = str(hex(h))[2:].zfill(4) + str(hex(l))[2:].zfill(4)
		print(dataStr)
		print(hex_to_float(dataStr))
		#ma_T = data[4] / 2500
		#print("ma_T = ", ma_T)


		#hdp300 = (ma_H - 4) * 100 / 16
		#print("hum = ", hum)
	except Exception as err:
		print("err = ", err)


