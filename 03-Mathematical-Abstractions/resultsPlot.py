import pandas
import numpy as np
from matplotlib import pyplot as plt

df = pandas.read_csv('result.csv', header=0, names=['x','y','dy'])
var = df.to_numpy()
x = var[:,0]
y = var[:,1]
dy = var[:,2]

fig = plt.figure()
ax1 = fig.add_subplot(1,1,1)
ax2 = ax1.twinx()
plt.title("Plot function")
ax1.set_xlabel("x")
ax1.set_ylabel("f(x)", color='b' )
ax2.set_ylabel("f'(x)", color='r')
ax1.set_ylim([-1,1])
ax2.set_ylim([-1,1])
ax1.grid(linestyle='--')
ax1.plot(x, y, "-+b")
ax2.plot(x, dy, "-or")
plt.show()

