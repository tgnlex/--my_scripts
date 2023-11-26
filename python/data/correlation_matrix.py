import pandas as pd 
import matplotlib.pyplot as plt

raw_data = {'x_value': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 'y_val': [40, 90, 110, 150, 290, 320, 410, 505, 550, 600]}0
my_data = pd.DataFrame(data=raw_data)
c_matrix = round(my_data.corr(), 2)
print(c_matrix)