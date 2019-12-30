import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rcParams
import numpy as np

import matplotlib
import japanize_matplotlib
#font = {'family':'Yugothic'}
#matplotlib.rc('font', **font)

rcParams['xtick.direction'] = 'in'
rcParams['ytick.direction'] = 'in'

# 1週目
input_file = 'datasets/stepResponse.csv'
data = np.array(pd.read_csv(input_file, delimiter=','))
time_data = data[:,0] # サンプル番号
score1    = data[:,1] # 流量[L/min]
#score2    = data[:,2] # 差圧変換器出力[v]

#plt.figure()
#plt.plot(time_data, score1)

#tmp_x = np.array(range(0,25, 1))*0.1
#tmp_y = 0*tmp_x + score1[-1]
#plt.plot(tmp_x, tmp_y, linestyle='dashed')
#plt.show()

# 2週目
h = 10
r = 0.4
alpha = 20.04

y0 = score1[-1]

def func_yt(t, y0, zeta, beta, gamma, delta):
	return y0*(1-(1/np.sqrt(1-zeta**2))*np.exp(-beta*t)*np.cos(gamma*t - delta))
def error_mean(y_theory, y):
	sum_diff = sum([0 if(e==0) else abs(e-f)/abs(e) for e,f in zip(y_theory, y)])/len(y)
	return sum_diff

def modify_MF(t, y, M, F):
	a0 = alpha*h/M
	a1 = F/M
	omega_n = np.sqrt(a0)
	zeta = a1/(2*np.sqrt(a0))
	beta = zeta*omega_n
	gamma = omega_n*np.sqrt(1-zeta**2)
	delta = np.arctan(zeta/np.sqrt(1-zeta**2))
	tmp_y = func_yt(t, y0, zeta, beta, gamma, delta)
	plt.figure()
	plt.plot(t, tmp_y, label='       ')
	plt.scatter(t, y, label="       ")
	plt.xlabel("時間 [s]")
	plt.ylabel("位置 [m]")
	plt.xticks([1, 2.5])
	plt.yticks([0.1, 0.2, 0.3, 0.4, 0.5, 0.6])
	plt.axis(xmin=0, xmax=2.5, ymin=0, ymax=0.6)
	plt.legend(bbox_to_anchor=(1, 0.4), loc='upper right', borderaxespad=1, fontsize=20)
	plt.show()
	error_p = error_mean(tmp_y, y)
	return error_p*100#[%]

tmp_matrix = np.zeros((17, 70))

if __name__=='__main__':
	M = 8.120566206902657
	F = 34.824276941266916
	#M = 7.7496
	#F = 40.0001
	print("Initial", modify_MF(time_data, score1, M, F))
