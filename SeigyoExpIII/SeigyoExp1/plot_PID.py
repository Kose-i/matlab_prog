import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rcParams
import numpy as np

import japanize_matplotlib

rcParams['xtick.direction'] = 'in'
rcParams['ytick.direction'] = 'in'

# 1週目
input_file = 'datasets/20191204bc.csv'
data = np.array(pd.read_csv(input_file, delimiter='\t'))
time_data = data[:,0] # サンプル番号
score1    = data[:,1] # 流量[L/min]
score2    = data[:,2] # 差圧変換器出力[v]

#PID_controll.png
plt.figure()
plt.plot(time_data, score2)
#x_range = np.array(range(0,350,10))
#y = x_range*0 + score2[0]
#plt.plot(x_range, y, linestyle='dashed')
#y = x_range*0 + score2[-1]
#plt.plot(x_range, y, linestyle='dashed')

#x_tmp = np.array(range(0,130+10,10))
#y_tmp = 0.04*x_tmp + 0.88
#plt.plot(x_tmp, y_tmp)
plt.yticks([10, 20, 30, 40, 50])
plt.xticks(np.array(range(500, 2100, 500)))
plt.axis(xmin=0, xmax=2000, ymin=0, ymax=50)
plt.xlabel("時間 [s]")
plt.ylabel("水位 [cm]")
#y_stab = score2[-1]
#plt.text(x=300, y=0, s=""+str(y_stab))
plt.show()
