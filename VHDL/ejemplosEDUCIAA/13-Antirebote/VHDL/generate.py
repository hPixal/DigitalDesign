import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import os

def remove_non_numeric(s):
    out = ''
    for i in range(len(s)):
        if(s[i].isnumeric()):
            out += s[i]
        #end if
    #end for
    return out

files = []
path = 'waves_csv/'
for file in os.listdir(path):
    if '.csv' in file:
        files.append(path+file)
        print(file)
    #end if
#end for

dataframes = {}
for i in range(len(files)):
    dataframes[i] = pd.read_csv(files[i],names=['Time','Voltage'])
#end for

tb_l = []
vb_l = []
dfClean = {}

for i in range(len(dataframes)):
    timebase = dataframes[i].iloc[0,0]
    timebase = int(remove_non_numeric(timebase))
    tb_l.append(timebase)
    
    voltbase = dataframes[i].iloc[1,1]
    voltbase = int(remove_non_numeric(voltbase))
    vb_l.append(voltbase)
    
    dataframes[i] = dataframes[i].iloc[3:,:]
    dataframes[i].reset_index(drop=True,inplace=True)
    
    Ndivisions = 20
    msPerDivision = timebase*1e-9
    
    dataframes[i]['Time'] = dataframes[i]['Time'].astype(float).apply(
        lambda x:x*1e5*msPerDivision*Ndivisions/4064)
    dataframes[i]['Voltage'] = dataframes[i]['Voltage'].astype(float)
    
    dfClean[i] = pd.DataFrame()
    dfClean[i]['Time'] = dataframes[i]['Time']
    dfClean[i]['Voltage'] = dataframes[i]['Voltage'].apply(lambda x: 0 if x<600 else 1)
#end for

for ind in range(len(files)):
    fig = plt.figure()

    ax0 = fig.add_subplot(211)
    ax1 = fig.add_subplot(212)

    dataframes[ind].plot(kind='line',x='Time',y='Voltage',figsize=(14,9),ax=ax0)

    dfClean[ind].plot(kind='line',x='Time',y='Voltage',yticks=[0,1],ax=ax1)

    ax0.set_xlabel('Time [ms]',fontsize=14)
    ax0.set_ylabel('Voltage [mV]',fontsize=14)
    ax0.legend('')
    ax1.set_xlabel('Time [ms]',fontsize=14)
    ax1.set_ylabel('Logic Level',fontsize=14)
    ax1.legend('')
    
    plt.savefig(path+'wave_'+str(ind)+'.png',format='png',bbox_inches='tight')



fileNames = ['stimulus/stim_one_glitch.txt',\
            'stimulus/stim_zero_to_one.txt',\
            'stimulus/stim_zero_glitch.txt']

for i in range(len(dfClean)):
    samples = dfClean[i]['Voltage'].tolist()
    with open(fileNames[i],mode='w') as stim:
        delta = tb_l[i]*1e-6*Ndivisions/4064
        stim.write('{:.5f}'.format(delta)+' us'+'\n') #str(delta)
        for sample in samples:
            stim.write(str(sample)+'\n')
        #end for
    #end with
#end for
