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
with open('stimulus.txt',mode='w') as stim:
    ####num > den (N different cases)####
    NumGreaterThanDen = []
    for i in range(nCases):
        num = random.choice(possibleValues)
        while(num == 0):
            num = random.choice(possibleValues)
        #end while
    
        den = random.choice(possibleValues)
        while(den > num or den == 0):
            den = random.choice(possibleValues)
        #end while

        #Result:
        res = num//den

        #Remainder:
        rmn = num%den
        
        #List:
        l = [str(num),str(den),str(res),str(rmn)]
   
        #Write to file:
        stim.write('c'+' '.join(l)+'\n')

        #Append case to list:
        NumGreaterThanDen.append((num,den))
    #end for


    ####num < den (N different cases)####
    NumLowerThanDen = []
    for i in range(nCases):
        num = random.choice(possibleValues)
        while(num == 0):
            num = random.choice(possibleValues)
        #end while
    
        den = random.choice(possibleValues)
        while(den < num):
            den = random.choice(possibleValues)
        #end while
        
        #Result:
        res = num//den

        #Remainder:
        rmn = num%den
        
        #List:
        l = [str(num),str(den),str(res),str(rmn)]
   
        #Write to file:
        stim.write('c'+' '.join(l)+'\n')

        #Append case to list:
        NumLowerThanDen.append((num,den))
    #end for
    
    
    ####num = m*den (m integer > 1) (N different cases)####
    NumMultipleOfDen = []
    for i in range(nCases):
        den = random.choice(possibleValues)
        while(den == 0):
            den = random.choice(possibleValues)
        #end while
    
        t = tuple(range(1+max(possibleValues)//den))
        m = max(t)
        num = m*den
    
        #Result:
        res = num//den

        #Remainder:
        rmn = num%den
        
        #List:
        l = [str(num),str(den),str(res),str(rmn)]
   
        #Write to file:
        stim.write('c'+' '.join(l)+'\n')

        #Append case to list:
        NumMultipleOfDen.append((num,den))
    #end for
    
    
    ####num = den (Ndifferent cases)####
    NumEqualsDen = []
    for i in range(nCases):
        den = random.choice(possibleValues)
        num = den
        while((num,den) in NumEqualsDen) and (den == 0):
            den = random.choice(possibleValues)
            num = den
        #end while
    
        #Result:
        res = num//den

        #Remainder:
        rmn = num%den
        
        #List:
        l = [str(num),str(den),str(res),str(rmn)]
   
        #Write to file:
        stim.write('c'+' '.join(l)+'\n')

        #Append case to list:
        NumEqualsDen.append((num,den))
    #end for

    ####num = 0 , den != 0####
    den = 0
    num = 0
    while(den == 0):
        den = random.choice(possibleValues)
    #end while

    NumZero = (num,den)

    #Result:
    res = num//den

    #Remainder:
    rmn = num%den
        
    #List:
    l = [str(num),str(den),str(res),str(rmn)]
   
    #Write to file:
    stim.write('c'+' '.join(l)+'\n')
    
    ####num != 0 , den = 0####
    num = 0
    while(num == 0):
        num = random.choice(possibleValues)
    #end while

    denZero = (num,0)
   
    #Write to file:
    stim.write('z'+str(num)+' 0'+'\n')

    ####num = 0 , den = 0####
    ZeroByZero = (0,0)
    #Write to file:
    stim.write('z 0 0\n')
#end with































