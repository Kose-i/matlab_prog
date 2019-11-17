import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# 1週目
input_file = 'datasets/20191113bc.csv'
data = np.array(pd.read_csv(input_file, delimiter='\t'))
time_data = data[:,0]
score     = data[:,1]
score2    = data[:,2]

plt.figure()
#plt.plot(time_data, score)
plt.plot(time_data, score2)
x_range = np.array(range(0,350,10))
y = x_range*0 + score2[0]
plt.plot(x_range, y, linestyle='dashed')
y = x_range*0 + score2[-1]
plt.plot(x_range, y, linestyle='dashed')

x_tmp = np.array(range(0,130+10,10))
y_tmp = 0.04*x_tmp + 0.9
plt.plot(x_tmp, y_tmp)
plt.show()
