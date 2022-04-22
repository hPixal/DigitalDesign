#serial_msg.py
"""Open serial port to read message from EDU-FPGA"""
import serial
import struct

#Open serial port
ser = serial.Serial('/dev/ttyUSB1',9600)
print(ser.name)

#Read new line
nl = 0
while nl != b'\n':
    nl = ser.read(1)

i = 0
for i in range (10):
    sample = ser.read(9)
    print(sample)

ser.close()
