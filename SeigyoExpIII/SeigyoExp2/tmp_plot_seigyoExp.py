import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rcParams
import numpy as np

import japanize_matplotlib

rcParams['xtick.direction'] = 'in'
rcParams['ytick.direction'] = 'in'

input_file = 'datasets/tamura3'
data = np.array(pd.read_csv(input_file, delimiter=' \t', header=1))

time_data = data[:,0] # Time[s]
score1    = data[:,1] # Pos[m]
score2    = data[:,2] # Voltage[v]
score3    = data[:,3] # Expect Pos[m]
score4    = data[:,4] # Expect Vel[m/s]
score5    = data[:,5] # Vel[m/s]

def plot_engine():
    fig = plt.figure(figsize=(13.0, 4.4))
    plt.plot(time_data, score1, label="位置", linewidth=1, marker='.')
    plt.plot(time_data, score3, label="推定位置", linewidth=1, marker='.')
    plt.xlabel("時間 [s]")
    plt.ylabel("位置 [m]")
    plt.xticks(np.array(range(0, 30, 5))*0.1)
    plt.axis(xmin=0, xmax=2.5, ymin=0, ymax=0.5)
    plt.legend()
    plt.show()
    
    fig = plt.figure(figsize=(13.0, 4.4))
    plt.plot(time_data, score4, label="推定速度", linewidth=1, marker='.')
    plt.plot(time_data, score5, label="速度", linewidth=1, marker='.')
    plt.xlabel("時間 [s]")
    plt.ylabel("速度 [m/s]")
    plt.axis(xmin=0, xmax=2.5, ymin=-3, ymax=4)
    plt.legend()
    plt.show()
    
    fig = plt.figure(figsize=(13.0, 4.4))
    plt.plot(time_data, score2, linewidth=1, marker='.')
    plt.xlabel("時間 [s]")
    plt.ylabel("電圧 [v]")
    plt.axis(xmin=0, xmax=2.5, ymin=-2, ymax=10.5)
    plt.show()

if __name__=='__main__':
    for i in range(1, 15, 1):
        input_file = 'datasets/tamura' + str(i)
        data = np.array(pd.read_csv(input_file, delimiter=' \t', header=1))
        time_data = data[:,0] # Time[s]
        score1    = data[:,1] # Pos[m]
        score2    = data[:,2] # Voltage[v]
        score3    = data[:,3] # Expect Pos[m]
        score4    = data[:,4] # Expect Vel[m/s]
        score5    = data[:,5] # Vel[m/s]
        plot_engine()
