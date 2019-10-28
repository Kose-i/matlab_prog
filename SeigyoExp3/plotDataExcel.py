#!/usr/bin/bash python3
import csv
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

#変更するパラメータ
data_num  = 4 # 使用するデータ番号0~4
start_pos = 20  # 傾きの始まる点
end_pos   = 200 # 傾きの終わる点
sampling_ratio = 20 # サンプリングの周期
method_n = 1 # 前nと後nの平均値を取る # 1以外については未実装
filename1 = 'output/sampling200/output1.csv'
filename2 = 'output/sampling200/output2.csv'
filename3 = 'output/sampling200/output3.csv'


def csv_read(filename):
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
    return sum([data[0:-2], data[1:-1], data[2:]])/3

def error_sum(data, t_data, K_p, T_p, L_p):
    c = 50*K_p*(1-np.exp(-(t_data-L_p)/T_p))+data[0]
    sum_diff = sum([abs(e-f)/f for e,f in zip(data, c)])/len(data)
    return sum_diff

def main():
    mat = np.array(csv_read('datasets/bc.CSV'))*100
    time_mat = np.array(range(0, len(mat)))*10
    data1 = mat[:,data_num]
    modified_data1 = modify_error(data1, method_n)
    time_mat = time_mat[1:]
    print("サンプリング周期[s]:",sampling_ratio*10)
    print("適用範囲:",start_pos*10,"[s]-",end_pos*10,"[s]")
    #plt.plot(time_mat, mat)
    #x_warn = [start_pos*10, end_pos*10]
    #y_warn = [data1[start_pos], data1[end_pos]]
    #plt.scatter(x_warn, y_warn, marker='o')
    #plt.show()
    sample_data = sampling(modified_data1, start_pos=start_pos-1, end_pos=end_pos)
    sample_time = sampling(time_mat, start_pos=start_pos-1, end_pos=end_pos)
    next_sample_data = sample_data[sampling_ratio:]  # はじめの値を除く
    prev_sample_data = sample_data[:-sampling_ratio]# 最後の値を除く
    sample_time = sample_time[:-sampling_ratio]        # つじつま合わせ
    data_diff = next_sample_data - prev_sample_data
    log_data = np.log(data_diff)
    
    #plt.plot(sample_time,log_data)
    a,b = a_b(mat_x=sample_time, mat_y=log_data)
    x = np.linspace(10*start_pos,end_pos*10,10)
    y = a*x + b 
    print("a:", a, ", b:",b)
    K_p = (mat[-1, data_num] - mat[0, data_num]) / 50
    print("K_p:", K_p)
    T_p = -1/a
    print("T_p:",T_p)
    L_p = T_p*(b-np.log(50*K_p*(1-np.exp(-sampling_ratio*10/T_p))))
    print("L_p:", L_p)
    #plt.plot(x,y)
    #plt.show()
    error_t = error_sum(data1, time_mat ,K_p=K_p, T_p=T_p, L_p=L_p)
    print("相対誤差平均:" ,error_t*100, "[%]")
    
    # 保持するデータ
    with open(filename1, "w", encoding="Shift_jis") as f: # 文字コードをShift_JISに指定
      writer = csv.writer(f, lineterminator="\n") # writerオブジェクトの作成 改行記号で行を区切る
      writer.writerows([["time[s]","data(t-1)[degree]","data(t)", "data(t+1)","Average"]])
      stock_tmp = []
      for time_data,past_data,now_data,future_data,average_data in zip(time_mat, data1[2:], data1[1:-1], data1[:-2],sum([data1[2:],data1[1:-1],data1[:-2]])/3):
        stock_t = [time_data, past_data, now_data, future_data,average_data]
        stock_tmp.append(stock_t)
      writer.writerows(stock_tmp) # csvファイルに書き込み
    # 保持するデータ
    with open(filename2, "w", encoding="Shift_jis") as f: # 文字コードをShift_JISに指定
      writer = csv.writer(f, lineterminator="\n") # writerオブジェクトの作成 改行記号で行を区切る
      writer.writerows([["sample_time","data_(t+h)","data_(t)","data_([t+h]-[t])","log_data"]])
      stock_tmp = []
      for st,nd,pd,df,ld in zip(sample_time, next_sample_data,prev_sample_data, data_diff, log_data):
        stock_t = [st, nd, pd, df, ld]
        stock_tmp.append(stock_t)
      writer.writerows(stock_tmp) # csvファイルに書き込み
    # 保持するデータ
    with open(filename3, "w", encoding="Shift_jis") as f: # 文字コードをShift_JISに指定
      writer = csv.writer(f, lineterminator="\n") # writerオブジェクトの作成 改行記号で行を区切る
      n = len(sample_time)
      sum_x = sum(sample_time)
      sum_y = sum(log_data)
      sum_x_double = sum(sample_time**2)
      sum_xy = sum(sample_time*log_data)
      a_grad    = (n*sum_xy - sum_x*sum_y) / (n*sum_x_double - (sum_x)**2)
      b_section = (sum_x_double*sum_y - sum_xy*sum_x) / (n*sum_x_double - (sum_x)**2)
      writer.writerows([["n",n]])
      writer.writerows([["sum(x)",sum_x]])
      writer.writerows([["sum(y)",sum_y]])
      writer.writerows([["sum(x^2)",sum_x_double]])
      writer.writerows([["sum(x*y)",sum_xy]])
      writer.writerows([["a",a_grad]])
      writer.writerows([["b",b_section]])
      writer.writerows([["K_p",K_p]])
      writer.writerows([["T_p",T_p]])
      writer.writerows([["L_p",L_p]])
    return error_t

if __name__=='__main__':
    mini_c = 0
    mini_tmp = 1000
    sampling_ratio = 20
    main()
    #print("sampling_ratio:",mini_c)
    #print("error:", mini_tmp)
