import matplotlib.pyplot as plt
import pandas as pd

my_data = pd.read_csv("data.csv", header=0, sep=",")
my_data.plot(x="x_data", y="y_data", kind="line"),
plt.ylim(ymin=0)
plt.xlim(xmin=0)

plt.show()