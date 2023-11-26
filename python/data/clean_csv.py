import pandas as pd

my_data = pd.read_csv("data.csv", header=0, sep=",")

my_data.dropna(axis=0, inplace-True)
