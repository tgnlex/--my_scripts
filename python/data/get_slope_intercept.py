import pandas as pd 
import numpy as np


my_data = pd.read("data.csv", header=0, sep=",")

x = my_data[""]
y = my_data[""]

slope_intercept = np.polyfit(x,y,1)

print(slope_intercept)