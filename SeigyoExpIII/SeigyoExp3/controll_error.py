import pandas as pd
import numpy as np

def error_sum(data, f):
    sum_diff = sum([abs(e-f)/f for e in data])/len(data)
    return sum_diff

filename = "datasets/bc_controll.CSV"

data_box = np.array(pd.read_csv(filename))*100
tmp_data = data_box[:,4:]
Tw = 50
data = tmp_data[Tw:]
print(data)
print(error_sum(data, 59.15))

