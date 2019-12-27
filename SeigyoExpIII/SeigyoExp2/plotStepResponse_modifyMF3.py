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
t = data[:,0]
y = data[:,1]

# 2週目
h = 10
#r = 0.4
alpha = 20.04

y0 = y[-1]

def func_yt(t, y0, zeta, beta, gamma, delta):
	return y0*(1-(1/np.sqrt(1-zeta**2))*np.exp(-beta*t)*np.cos(gamma*t - delta))
def error_mean(y_theory, y):
#	sum_diff = sum([0 if(e==0) else abs(e-f)/abs(e) for e,f in zip(y_theory, y)])/len(y)
#	sum_diff = sum([abs(e-f)*abs(f) for e,f in zip(y_theory, y)])
	sum_diff = max([abs(e-f) for e,f in zip(y_theory, y)])
	return sum_diff

def modify_MF(t, y, M, F):
	alpha = 20.04
	h = 10
	a0 = alpha*h/M
	a1 = F/M
	omega_n = np.sqrt(a0)
	zeta = a1/(2*np.sqrt(a0))
	beta = zeta*omega_n
	gamma = omega_n*np.sqrt(1-zeta**2)
	delta = np.arctan(zeta/np.sqrt(1-zeta**2))
	tmp_y = func_yt(t, y0, zeta, beta, gamma, delta)	
	error_p = error_mean(tmp_y, y)
	return error_p*100 #[%]

if __name__=='__main__':
	m_left ,m_right = 6, 10
	m_left_score ,m_right_score = 200, 200
	f_mid = 0
	while m_right - m_left>0.0001:
		m_mid = (m_left + m_right)/2
		f_left, f_right = 30, 50
		f_left_score  = modify_MF(t, y, m_mid, f_left)
		f_right_score = modify_MF(t, y, m_mid, f_right)
		while f_right - f_left>0.0001:
			f_mid = (f_left + f_right)/2
			tmp_error = modify_MF(t, y, m_mid, f_mid)
			if f_left_score > f_right_score:
				f_left_score = tmp_error
				f_left = f_mid
			else:
				f_right_score = tmp_error
				f_right = f_mid
		if m_left_score > m_right_score:
			m_left_score = f_left_score
			m_left = m_mid
		else:
			m_right_score = f_left_score
			m_right = m_mid
		print(m_left, end='-')
		print(m_right)
		print(m_left_score, end='-')
		print(m_right_score)
	print("F=", end=' ')
	print(f_mid)
	print("M=", end=' ')
	print(m_mid)
	print("error=", end=' ')
	print(m_left_score)
