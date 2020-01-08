import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rcParams
import numpy as np

import japanize_matplotlib

rcParams['xtick.direction'] = 'in'
rcParams['ytick.direction'] = 'in'

input_file = 'datasets/tamura2'
data = np.array(pd.read_csv(input_file, delimiter=' \t', header=1))

time_data = data[:,0] # Time[s]
score1    = data[:,1] # Pos[m]
score2    = data[:,2] # Voltage[v]
score3    = data[:,3] # Expect Pos[m]
score4    = data[:,4] # Expect Vel[m/s]
score5    = data[:,5] # Vel[m/s]

plt.figure()
plt.plot(time_data, score1)
plt.plot(time_data, score3)
plt.xlabel("時間 [s]")
plt.ylabel("位置 [m]")
plt.xticks(np.array(range(0, 30, 5))*0.1)
plt.axis(xmin=0, xmax=2.5)#, ymin=1, ymax=5)
plt.show()

plt.figure()
plt.plot(time_data, score4)
plt.plot(time_data, score5)
plt.xlabel("時間 [s]")
plt.ylabel("速度 [m/s]")
plt.axis(xmin=0, xmax=2.5)#, ymin=1, ymax=5)
plt.show()

plt.figure()
plt.plot(time_data, score2)
plt.xlabel("時間 [s]")
plt.ylabel("電圧 [v]")
plt.axis(xmin=0, xmax=2.5)#, ymin=1, ymax=5)
plt.show()
