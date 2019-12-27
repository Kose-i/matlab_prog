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
time_data = data[:,0]
score1    = data[:,1]

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

def modify_MF(t, y, M, F):
	a0 = alpha*h/M
	a1 = F/M
	omega_n = np.sqrt(a0)
	zeta = a1/(2*np.sqrt(a0))
	beta = zeta*omega_n
	gamma = omega_n*np.sqrt(1-zeta**2)
	delta = np.arctan(zeta/np.sqrt(1-zeta**2))
	tmp_y = func_yt(t, y0, zeta, beta, gamma, delta)	
	error_p = error_mean(tmp_y, y)
	return error_p*100

tmp_matrix = np.zeros((17, 71))

if __name__=='__main__':
	M = 8.120566206902657
	F = 34.824276941266916
	print("Initial", modify_MF(time_data, score1, M, F))
	for m in np.array(range(4, 16, 2)):
		for f in np.array(range(17, 71, 1)):
			tmp_matrix[m][f] = modify_MF(time_data, score1, m, f)
		mat = tmp_matrix[m][:]
		plt.figure()
		plt.scatter(np.array(range(0, 71, 1)), mat)
		plt.axis(ymin=0, ymax=20, xmin=17, xmax=71)
		plt.xlabel("F")
		plt.ylabel("相対誤差 [%]")
		plt.show()
		print("M=", end=' ')
		print(str(m))
