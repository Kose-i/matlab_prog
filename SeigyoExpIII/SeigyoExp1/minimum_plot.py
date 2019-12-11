import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rcParams
import numpy as np

import japanize_matplotlib

rcParams['xtick.direction'] = 'in'
rcParams['ytick.direction'] = 'in'

# 1週目
input_file = 'datasets/h_v_transform.csv'
data = np.array(pd.read_csv(input_file, delimiter=','))
x = data[:,0]
y = data[:,1]

plt.figure()
plt.scatter(x, y)
approximity_x = np.array(range(0, 100, 10))
approximity_y = 0.1067*approximity_x - 0.217
plt.plot(approximity_x, approximity_y, linestyle='dashed')
#plt.axis(xmin=0, xmax=60, ymin=0, ymax=6)
plt.axis(xmin=x[0], xmax=x[-1], ymin=y[0], ymax=y[-1])
tmp_x = np.array(range(40, 45, 1))
tmp_y = 0*tmp_x + 2.1
plt.plot(tmp_x, tmp_y, linestyle='dashed')
plt.scatter([42], [1.6])
plt.xlabel('水位 [cm]')
plt.ylabel('出力電圧 [V]')
plt.text(x=45, y=2, s="近似直線")
plt.text(x=45, y=1.5, s="実測値")
plt.xticks([10, 20, 30, 40, 50])
plt.yticks([1, 2, 3, 4, 5])
plt.show()

input_file = 'datasets/i_q_transform.csv'
data = np.array(pd.read_csv(input_file, delimiter=','))
x = data[:,0]
y = data[:,1]

plt.figure()
plt.scatter(x, y)
approximity_x = np.array(range(0, 30, 1))
approximity_y = 7.745*approximity_x - 46.691
plt.plot(approximity_x, approximity_y, linestyle='dashed')
#plt.axis(xmin=0, xmax=25, ymin=0, ymax=35)
plt.axis(xmin=x[0], xmax=x[-1], ymin=min(y), ymax=30)
plt.ylabel('流量 [L/min]')
plt.xlabel('電流 [mA]')
tmp_x = np.array(range(13, 16, 1))
tmp_y = 0*tmp_x + 6.5
plt.plot(tmp_x, tmp_y, linestyle='dashed')
plt.scatter([14], [4.3])
plt.text(x=15, y=6, s="近似直線")
plt.text(x=15, y=4, s="実測値")
plt.yticks([5, 10, 15, 20, 25, 30])
plt.xticks([5, 10, 15, 20])
plt.show()
