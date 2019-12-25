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

plt.figure()
plt.plot(time_data, score1)

tmp_x = np.array(range(0,25, 1))*0.1
tmp_y = 0*tmp_x + score1[-1]
plt.plot(tmp_x, tmp_y, linestyle='dashed')
plt.show()

# 2週目
h = 10
r = 0.4
alpha = 20.09

y0 = score1[-1]
ym = max(score1)
for e, f in zip(time_data, score1):
	if (f == ym):
		tm = e;

a1 = -1*2*np.log(ym/y0 - 1) / tm
a0 = ((np.pi**2) / (tm**2)) + (a1**2)/4
#b0 = a0*y0/r
print("y0 = ", y0)
print("ym = ", max(score1))
print("tm = ", tm)
print("a1 = ", a1)
print("a0 = ", a0)

M = alpha*h/a0
F = a1*M
print("M = ", M)
print("F = ", F)

def func_yt(t, y0, zeta, beta, gamma, delta):
	return y0*(1-(1/np.sqrt(1-zeta**2))*np.exp(-beta*t)*np.cos(gamma*t - delta))

omega_n = np.sqrt(a0)
zeta = a1/(2*np.sqrt(a0))
beta = zeta*omega_n
gamma = omega_n*np.sqrt(1-zeta**2)
delta = np.arctan(zeta/np.sqrt(1-zeta**2))
print("omega_n = ", omega_n)
print("beta = ", beta)
print("zeta = ", zeta)
print("gamma = ", gamma)
print("delta = ", delta)

plt.figure()
plt.plot(time_data, score1)
tmp_y = func_yt(t, y0, zeta, beta, gamma, delta)
plt.plot(t, tmp_y, linestyle='dashed')
plt.show()

def error_mean(y_theory, y):
	sum_diff = sum([0 if(e==0) else abs(e-f)/e for e,f in zip(y_theory, y)])/len(y)
	return sum_diff

error_p = error_mean(tmp_y, score1)
print("error = ", error_p)
