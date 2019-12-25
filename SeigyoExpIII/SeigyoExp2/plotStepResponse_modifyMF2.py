import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rcParams
import numpy as np

import japanize_matplotlib

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
alpha = 20.09

y0 = score1[-1]

def func_yt(t, y0, zeta, beta, gamma, delta):
	return y0*(1-(1/np.sqrt(1-zeta**2))*np.exp(-beta*t)*np.cos(gamma*t - delta))
def error_mean(y_theory, y):
	sum_diff = sum([0 if(e==0) else abs(e-f)/abs(e) for e,f in zip(y_theory, y)])/len(y)
	return sum_diff

#output_file = "./data2.txt"
#file = open(output_file, 'a')
def modify_MF(t, y, M, F):
	a0 = alpha*h/M
	a1 = F/M
	omega_n = np.sqrt(a0)
	zeta = a1/(2*np.sqrt(a0))
	beta = zeta*omega_n
	gamma = omega_n*np.sqrt(1-zeta**2)
	delta = np.arctan(zeta/np.sqrt(1-zeta**2))
	#tmp_x = np.array(range(0,25, 1))*0.1
	#tmp_y = func_yt(tmp_x, y0, zeta, beta, gamma, delta)
	tmp_y = func_yt(t, y0, zeta, beta, gamma, delta)	
	error_p = error_mean(tmp_y, y)
#	plt.plot(t, y)
#	print("M = ", M, end=' ')
#	print("F = ", F, end=' ')
#	print("a0 = ", a0, end=' ')
#	print("a1 = ", a1, end=' ')
#	print("error_p = ", error_p, end='\n')
#	file = open(output_file, "a")	
#	file.write(str(M))
#	file.write(",")
#	file.write(str(F))
#	file.write(",")
#	file.write(str(error_p))
#	file.write("\n")
#	file.close()
	return error_p

tmp_matrix = np.zeros((17, 7000))

if __name__=='__main__':
	M = 8.120566206902657
	F = 34.824276941266916
	print("Initial", modify_MF(time_data, score1, M, F))
	#min_b = 10
	for m in np.array(range(7, 10, 1)):
		for f in np.array(range(3000, 5000, 1)):
			tmp_matrix[m][f] = modify_MF(time_data, score1, m, f*0.01)
			#min_a = modify_MF(time_data, score1, m, f)
		plt.figure()
		mat = tmp_matrix[m][:]
		plt.plot(np.array(range(0, 7000, 1))*0.01, mat)
		plt.axis(ymin=0, ymax=0.1)
		plt.title("M="+str(m))
		plt.show()
			#min_b = min([min_a, min_b])
	#print(min_b)
	print(tmp_matrix)
	#print(modify_MF(time_data, score1, M, F))
	#print(modify_MF(time_data, score1, 8.0, 34.0))
	#print(modify_MF(time_data, score1, 8, 35))

