import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rcParams
import numpy as np

import japanize_matplotlib

rcParams['xtick.direction'] = 'in'
rcParams['ytick.direction'] = 'in'

# 1週目
input_file = 'datasets/20191113bc.csv'
data = np.array(pd.read_csv(input_file, delimiter='\t'))
time_data = data[:,0] # サンプル番号
score1    = data[:,1] # 流量[L/min]
score2    = data[:,2] # 差圧変換器出力[v]

plt.figure()
#plt.plot(time_data*5, score2)
plt.scatter(time_data*5, score2, s=2)
plt.xlabel("時間 [s]")
plt.ylabel("差圧変換器出力 [V]")
plt.xticks(np.array(range(0, 1900, 500)))
plt.yticks([1,2,3,4,5])
plt.axis(xmin=0, xmax=1790, ymin=1, ymax=5)
Lp = 75
Tp = 370
#Tp = 270
x_temp = np.array(range(0, 2000, 1))
time_thread = time_data*5 - Lp
time_thread[time_thread <= 0] = 0
y_temp = 0.1067*(27.6944*(1 - np.exp(-(time_thread)/Tp))) +score2[0]
plt.plot(time_data*5, y_temp, linestyle='dashed')

# labeling
temp_x = np.array(range(1200,1400, 50))
temp_y = 0*temp_x + 1.5
plt.plot(temp_x, temp_y, linestyle='dashed')
temp_y = 0*temp_x + 1.3
plt.scatter(temp_x, temp_y, s=2)
plt.text(x=1370, y=1.45, s="モデル値")
plt.text(x=1390, y=1.25, s="実測値")

plt.show()

def error_sum(data_t1, data_model):
    sum_error = sum([abs(e-f)/f for e,f in zip(data_t1,data_model)])
    return sum_error/len(data_model)
print(error_sum(score2, y_temp))
#plt.figure()
#plt.plot(time_data*5, score1)
#plt.xlabel("時間 [s]")
#plt.ylabel("流量 [L/min]")
#plt.xticks(np.array(range(0, 1900, 500)))
#plt.yticks(np.array(range(15,24,2)))
#plt.axis(xmin=0, xmax=1790)
#plt.show()
