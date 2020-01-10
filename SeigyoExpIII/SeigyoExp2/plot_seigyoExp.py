import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rcParams
import numpy as np

import japanize_matplotlib

rcParams['xtick.direction'] = 'in'
rcParams['ytick.direction'] = 'in'

input_file = 'datasets/tamura6'
data = np.array(pd.read_csv(input_file, delimiter=' \t', header=1))

time_data = data[:,0] # Time[s]
score1    = data[:,1] # Pos[m]
score2    = data[:,2] # Voltage[v]
score3    = data[:,3] # Expect Pos[m]
score4    = data[:,4] # Expect Vel[m/s]
score5    = data[:,5] # Vel[m/s]

fig = plt.figure(figsize=(13.0, 4.4))
plt.plot(time_data, score1, label="位置", linewidth=1, marker='.')
plt.plot(time_data, score3, label="推定位置", linewidth=1, marker='.')
plt.xlabel("時間 [s]")
plt.ylabel("位置 [m]")
plt.xticks(np.array(range(1, 3, 1)))
#plt.yticks(np.array(range(1, 6, 1))*0.1)
plt.yticks(np.array(range(-10, 10, 1)))
#plt.axis(xmin=0, xmax=2.5, ymin=0, ymax=0.5)
plt.axis(xmin=0, xmax=2.5, ymin=-2, ymax=2)
plt.legend()
plt.show()

fig = plt.figure(figsize=(13.0, 4.4))
plt.plot(time_data, score4, label="推定速度", linewidth=1, marker='.')
plt.plot(time_data, score5, label="速度", linewidth=1, marker='.')
plt.xlabel("時間 [s]")
plt.ylabel("速度 [m/s]")
plt.xticks(np.array(range(0, 3, 1)))
#plt.yticks(np.array(range(-3, 5, 1)))
plt.yticks(np.array(range(-10, 10, 2)))
#plt.axis(xmin=0, xmax=2.5, ymin=-3, ymax=4)
plt.axis(xmin=0, xmax=2.5, ymin=-8, ymax=8)
plt.legend()
plt.show()

fig = plt.figure(figsize=(13.0, 4.4))
plt.plot(time_data, score2, linewidth=1, marker='.')
plt.xlabel("時間 [s]")
plt.ylabel("電圧 [v]")
plt.xticks(np.array(range(0, 3, 1)))
plt.yticks(np.array(range(-5, 15, 5)))
plt.axis(xmin=0, xmax=2.5, ymin=-5, ymax=10)
plt.show()
