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

#import csv
#with open('20191113csv.csv', "w", encoding="Shift_jis") as f: # 文字コードをShift_JISに指定
#   writer = csv.writer(f, lineterminator="\n") # writerオブジェクトの作成 改行記号で行を区切る
#   stock_tmp = []
#   for a,b,c in zip(time_data, score1, score2):
#     stock_t = [a,b,c]
#     stock_tmp.append(stock_t)
#   writer.writerows(stock_tmp) # csvファイルに書き込み

#print("Q(0)=", score1[0], " Q(\infty)=", score1[-1])
#print("H(0)=", 0.106*score2[0]-0.217, " H(\infty)=", 0.106*score2[-1]-0.217)
print("H(\infty) - H(0) =", 10.67*score2[-1] - 10.67*score2[0])
print("r=Q(\infty) - Q(0) =", score1[-1] - score1[0])
print("k=", ((score2[-1] - score2[0])/0.1067)/(score1[-1] - score1[0]))

plt.figure()
plt.plot(time_data, score2)
x_range = np.array(range(0,350,10))
y = x_range*0 + score2[0]
plt.plot(x_range, y, linestyle='dashed')
y = x_range*0 + score2[-1]
plt.plot(x_range, y, linestyle='dashed')

x_tmp = np.array(range(0,130+10,10))
y_tmp = 0.04*x_tmp + 0.88
plt.plot(x_tmp, y_tmp)
plt.yticks([0, 1, 2, 3, 4, 5])
plt.xticks(np.array(range(100, 350, 100)))
plt.axis(xmin=0, xmax=356, ymin=0, ymax=5)
y_stab = score2[-1]
plt.text(x=300, y=0, s=""+str(y_stab))
plt.show()
