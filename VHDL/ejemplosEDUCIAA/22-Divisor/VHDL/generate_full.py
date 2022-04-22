#Generate stimulus file for divider_tb

import argparse
import random


#Parse arguments from command line
ap = argparse.ArgumentParser()
ap.add_argument("-n", "--nbits", required=True,help="Number of bits of divider")
args = vars(ap.parse_args())
nBits = int(args['nbits'])
#Tuple that holds all possible values (0 to 2**nBits-1)
possibleValues = tuple(range(2**nBits))

#Number of Cases to test:
nCases = 10

#Generate parametersPackage:
with open('parametersPackage.vhd',mode='w') as package:
    package.write("library IEEE;\n")
    package.write("use IEEE.std_logic_1164.all;\n\n")
    package.write("package parametersPackage is\n")
    package.write("    constant NBITS : integer :=  {};\n".format(nBits))
    package.write("end parametersPackage;\n")

#Generate stimulus file:
with open('stimulus_full.txt',mode='w') as stim:
    for i in range(2**nBits):
        for j in range(2**nBits):
            if(j != 0):
                num = i
                den = j
                res = i//j
                rmn = i%j
                #List:
                l = [str(num),str(den),str(res),str(rmn)]
                #Write to file:
                stim.write('c'+' '.join(l)+'\n')
            else:
                num = i
                #Write to file:
                stim.write('z'+str(num)+' 0'+'\n')
            #end if
        #end for
    #end for
#end with































