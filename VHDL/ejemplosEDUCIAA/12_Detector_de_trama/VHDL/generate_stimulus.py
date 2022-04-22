#Python script to generate stimulus.txt

import argparse #argparse is to parse command line arguments
import os
import numpy as np
import random
import string

#Generate random string
def randomString(stringLength=1024):
    bits = '10'
    return ''.join(random.choice(bits) for i in range(stringLength))

#Count occurrences with overlapping
def count_sup(string, sub):
    count = start = 0
    index_list = []
    while True:
        start = string.find(sub, start) + 1
        index_list.append(start-1)
        if start > 0:
            count+=1
        else:
            return (count,index_list)

#Construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-s", "--sequence", required=True,help="Sequence to detect, MSB to the left")
args = vars(ap.parse_args())
sequence = args['sequence']
nBits = len(sequence)

#Check if sequence is a valid sequence. If not, raise an exception
for bit in sequence:
    if(bit != '1' and bit !='0'):
        print("Sequence must be a byte!")
        raise TypeError

#Generate random string with sequence on it
occurrences = 0
indexList = []
while(occurrences == 0):
    randString = randomString()
    #sequence must be inverted in order to read it like a serial register
    occurrences,indexList = count_sup(randString,sequence[::-1])

#Add nBits+1 to all values on indexList (except last one), because sequenceDetector will rise 
#a detection signal nBits+1 clock pulses after sequence appearance on string:
indexList = [x+nBits+1 for x in indexList]
indexList[-1] = -1

print("Random string: ",randString)
#string must be inverted in order to read like a serial register
print("Is Sequence in random string? ",sequence in randString[::-1])
print("Indexes of occurrences: ",indexList)
print("Number of occurrences with overlapping: ",occurrences)
print("Number of occurrences without overlapping: ",randString.count(sequence[::-1]))

#Generate parametersPackage:
with open('parametersPackage.vhd',mode='w') as package:
    package.write("library IEEE;\n")
    package.write("use IEEE.std_logic_1164.all;\n\n")
    package.write("package parametersPackage is\n")
    package.write("    constant OCCURRENCES : integer :=  {};\n".format(occurrences))
    package.write("    constant NBITS : integer :=  {};\n".format(nBits))
    package.write("    constant SEQUENCE : std_logic_vector(NBITS-1 downto 0) := \"{}\";\n".format(sequence))
    package.write("end parametersPackage;\n")

#Write stimulus file
with open('stimulus.txt',mode='w') as stim:
    stim.write(randString)

#Write indexes file
with open('indexes.txt',mode='w') as ind:
    for index,element in enumerate(indexList):
        ind.write(str(indexList[index])+'\n')


    
























