#!/usr/bin/bash python3
import csv
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib import rcParams

#
import japanize_matplotlib
#

rcParams['xtick.direction'] = 'in'
rcParams['ytick.direction'] = 'in'

#変更するパラメータ
data_num  = 4 # 使用するデータ番号0~4
start_pos = 20  # 傾きの始まる点
end_pos   = 200 # 傾きの終わる点
sampling_ratio = 39 # サンプリングの周期
method_n = 1 # 前nと後nの平均値を取る # 1以外については未実装


def csv_read(filename):
    #read_matrix = list()
    #with open(filename) as f:
    #    reader = csv.reader(f)
    #    l = [row for row in reader]
    #    #read_matrix.append(l)
    #    read_matrix += l
    #return read_matrix
    return pd.read_csv(filename)

def sampling(data, start_pos, end_pos):
    return data[start_pos:end_pos+1]

def a_b(mat_x, mat_y):
    n = len(mat_x)
    sum_x = sum(mat_x)
    sum_y = sum(mat_y)
    sum_x_double = sum(mat_x**2)
    sum_xy = sum(mat_x*mat_y)
    a_grad    = (n*sum_xy - sum_x*sum_y) / (n*sum_x_double - (sum_x)**2)
    b_section = (sum_x_double*sum_y - sum_xy*sum_x) / (n*sum_x_double - (sum_x)**2)
    return (a_grad, b_section)
def a_b_ma(mat_x, mat_y):
    ave_x = sum(mat_x)/len(mat_x)
    ave_y = sum(mat_y)/len(mat_y)
    print("var(x):",sum([(i-ave_x)**2 for i in mat_x]))
    a = sum([(i-ave_x)*(j-ave_y) for i,j in zip(mat_x, mat_y)])/sum([(i-ave_x)**2 for i in mat_x])
    b = ave_y - a*ave_x
    return (a,b)

def modify_error(data, diff_period=1):
    assert diff_period == 1, "Error(func(modify_error) diff_period != 1)"
    # 外側diff_period個については使えない(使い物にならないデータになる)
    return sum([data[0:-2], data[1:-1], data[2:]])/3

def error_sum(data, t_data, K_p=2.4908, T_p=1516.3, L_p=23.0744):
    c = 50*K_p*(1-np.exp(-(t_data-L_p)/T_p))+data[0]
    sum_diff = sum([abs(e-f)/e for e,f in zip(data, c)])/len(data)
    return sum_diff

## Control_Exp.png
#mat = np.array(csv_read('datasets/bc_controll.CSV'))*100
#time_mat = np.array(range(0, len(mat)))*10
#y = 0*time_mat+59.15
#plt.plot(time_mat, mat[:, 4])
#plt.plot(time_mat, y, linestyle="dashed")
#plt.xlabel("t [s]")
#plt.xticks(range(0,4000,1000))
#plt.yticks(range(20,80,10))
##plt.axis(xmin=0, xmax, ymin, ymax)
#plt.axis(xmin=0, xmax=len(mat)*10)
#plt.ylabel("Θ [℃]")
#tmp_x = np.array(range(1400, 1600, 100))
#tmp_y = 0*tmp_x + 30
#plt.plot(tmp_x, tmp_y)
#tmp_y = 0*tmp_x + 27
#plt.plot(tmp_x, tmp_y, linestyle="dashed")
#plt.text(x=1530, y=30.5-1, s="実測値")
#plt.text(x=1530, y=27.5-1, s="Θ(t)=59.15")
#plt.show()
##
mat = np.array(csv_read('datasets/bc.CSV'))*100
data1 = mat[:,data_num]
time_mat = np.array(range(0, len(mat)))*10

## Identification.png
#plt.plot(time_mat, data1)
#plt.xlabel("t [s]")
#plt.xticks(range(1000,8000,1000))
#plt.yticks(range(10,170,10))
#plt.ylabel("Θ [℃]")
##plt.rcParams['axes.xmargin'] = 0
##plt.rcParams['axes.ymargin'] = 0
#upper_time = len(time_mat)*10
#plt.axis(xmin=0, xmax=upper_time, ymin=0, ymax=160)
#plt.show()
##print(len(data1))
##print(len(data1[0]))

# データの誤差を修正 移動平均法
modified_data1 = modify_error(data1, method_n)

print("サンプリング周期[s]:",sampling_ratio*10)
print("適用範囲:",start_pos*10,"[s]-",end_pos*10,"[s]")

# 適用範囲を確認
#plt.plot(time_mat, mat)
x_warn = [start_pos*10, end_pos*10]
y_warn = [data1[start_pos], data1[end_pos]]
#plt.scatter(x_warn, y_warn, marker='o')
#plt.show()

sample_data = sampling(modified_data1, start_pos=start_pos, end_pos=end_pos)
sample_time = sampling(time_mat, start_pos=start_pos, end_pos=end_pos)
#print("sample_time:",sample_time)
#TODO Data番号は0から開始される

#plt.plot(sample_time, sample_data)
#plt.show()

#print(sample_data)
next_sample_data = sample_data[sampling_ratio:]  # はじめの値を除く
prev_sample_data = sample_data[:-sampling_ratio]# 最後の値を除く

sample_time = sample_time[:-sampling_ratio]        # つじつま合わせ

#print(prev_sample_data)
#print(next_sample_data)
data_diff = next_sample_data - prev_sample_data
#plt.plot(data_diff)
log_data = np.log(data_diff)

a,b = a_b(mat_x=sample_time, mat_y=log_data)
#z-t200s.png
tmp_data = modified_data1
tmp_data_sample = tmp_data[sampling_ratio:] - tmp_data[:-sampling_ratio]
#tmp_data_sample = tmp_data[:-sampling_ratio] - tmp_data[sampling_ratio:]
graph_time = time_mat[1:-sampling_ratio-1]
import sys
eps = sys.float_info.epsilon
log_eps = np.log(eps)
#graph_data = [np.log(t) if t>1 else 0 for t in tmp_data_sample]
#graph_data = [np.log(t) if t>eps else np.log(eps) for i,t in enumerate(tmp_data_sample)]
graph_data = [np.log(t) if t > 0.1 else np.nan for t in tmp_data_sample]
x = np.linspace(0,7000,10)
y = a*x + b 
plt.plot(x,y,linestyle="dashed")
plt.scatter(graph_time, graph_data, s=10, c='red')
plt.plot(sample_time,log_data)
tmp_x = np.array(range(350, 650, 100))
tmp_pos = -1.30
tmp_y = 0*tmp_x + tmp_pos
plt.scatter(tmp_x, tmp_y, s=10, c='red')
#plt.plot(tmp_x, tmp_y)
tmp_x = np.array(range(350, 650, 100))
tmp_y = 0*tmp_x + tmp_pos -0.3
plt.plot(tmp_x, tmp_y, linestyle="dashed")
plt.text(x=670, y=tmp_pos-0.1, s="実測値")
plt.text(x=670, y=tmp_pos-0.3-0.05, s="z=-0.0006621t+3.3652")
plt.axis(xmin=0)
plt.xlabel("t [s]")
plt.ylabel("z (t)")
plt.show()

print("a:", a, ", b:",b)
#print("end:", mat[-1, data_num], "start:",mat[0, data_num])
K_p = (mat[-1, data_num] - mat[0, data_num]) / 50
print("K_p:", K_p)
T_p = -1/a
print("T_p:",T_p)
L_p = T_p*(b-np.log(50*K_p*(1-np.exp(-sampling_ratio*10/T_p))))
print("L_p:", L_p)

# step_response200s.png
model_data = 50*K_p*(1-np.exp(-(time_mat-L_p)/T_p))+data1[0]
plt.xlabel("t [s]")
plt.ylabel("Θ (t)")
plt.plot(time_mat, model_data, linestyle='dashed')
plt.plot(time_mat, data1)
#plt.xticks(range(0))
# 軸ラベル
tmp_x = np.array(range(4000, 5000, 100))
tmp_y = 0*tmp_x + 50
plt.plot(tmp_x, tmp_y)
tmp_y = 0*tmp_x + 40
plt.plot(tmp_x, tmp_y, linestyle="dashed")
plt.text(x=5000, y=50-1, s="実測値")
plt.text(x=5000, y=40-1, s="モデル値")
plt.yticks(range(20, 180, 20))
plt.xticks(range(1000, 8000, 1000))
plt.axis(xmin=0, xmax=7300, ymin=0)
plt.show()

error_t = error_sum(data1, time_mat ,K_p=K_p, T_p=T_p, L_p=L_p)
#error_t = error_sum(data1, time_mat)
print("error[%]:" ,error_t*100)
