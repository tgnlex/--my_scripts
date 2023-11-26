import bz2 
data = b """\ 
This is a test """

c = bz2.compress(data)

# Data Compression ratio
len(data) / len(c) 

d = bz2.decompress(c)
data == d # Check equality 