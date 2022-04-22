#serial_plot.py
"""Open serial port to read 8 bit samples from EDU-FPGA"""
import serial
import struct
import matplotlib.pyplot as plt
import numpy as np

#Define size of arrays for samples and time
uartBaudRate = 115200
N = 2048
y = np.zeros(N)
x = np.linspace(0,N-1,N)
x = (x*1000000)/uartBaudRate

#Create the plot in interactive mode
plt.ion()
fig = plt.figure()
ax = fig.add_subplot(111)
ax.set_ylim(0,256)
ax.set_title("Samples from EDU-CIAA-FPGA",fontsize=14,pad=10)
ax.set_xlabel("Time [us]")
line1, = ax.plot(x, y, 'g-')

#Open serial port
ser = serial.Serial('/dev/ttyUSB1',uartBaudRate)
print(ser.name)

while True:
    try:
        for i in range(N):
            sample = ser.read(1)
            sample = struct.unpack('<1B',sample)
            y[i] = sample[0]
        #end for
        line1.set_ydata(y)
        fig.canvas.draw()
        fig.canvas.flush_events()
    except KeyboardInterrupt:
        break
#end while

ser.close()




