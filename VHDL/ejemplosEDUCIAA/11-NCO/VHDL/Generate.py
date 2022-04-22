#Python script to generate both parametersPackage.vhd and stimulus.txt

import argparse #argparse is to parse command line arguments
#import os

# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-n", "--ncobits", required=True,help="Number of bits for nco accumulator (12 bits max)")
ap.add_argument("-f", "--fconbits", required=True,help="Number of bits for frequency control word (ncoBits bits max)")
args = vars(ap.parse_args())
ncoBits = int(args['ncobits'])
#Set ncoBits to 12 bits max
if ncoBits > 12:
    ncoBits = 12
#end if	
#Set freqControlBits to ncoBits bits max
freqControlBits = int(args['fconbits'])
if freqControlBits > ncoBits:
    freqControlBits = ncoBits
#end if

#Create 'parametersPackage.vhd' file
with open('parametersPackage.vhd',mode='w') as package:
    package.write("package parametersPackage is\n")
    package.write("    constant NCOBITS : integer :=  %d;\n"%ncoBits)
    package.write("    constant FREQCONTROLBITS : integer := %d;\n"%freqControlBits)
    package.write("end parametersPackage;\n")

#Create 'stimulus.txt'

values = tuple(range(2**ncoBits))
controlWords = tuple(range(1,2**freqControlBits))
valuesTop = max(values)
stop = False
accum = 0
with open('stimulus.txt',mode='w') as stim:
    for fcw in controlWords:
        s = 'c'+format(0,str(ncoBits)+'b')
        s = s.replace(' ','0')
        s += '\n'
        stim.write(s)
        while not(stop):
            accum += fcw
            if(accum > valuesTop):
                accum -= (valuesTop+1)
                if (accum == 0):
                    stop = True
                #end if
            #end if
            s = 'c'+format(accum,str(ncoBits)+'b')
            s = s.replace(' ','0')
            s += '\n'
            stim.write(s)
        #end while
        stim.write("#\n")
        stop = False
    #end for

#os.system("./test.sh")
####


            





