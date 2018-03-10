import numpy as np
import matplotlib.pyplot as plt
import matplotlib.lines as mplines

a = -3
b = 3
x = y = [-5,5]

y, x = np.ogrid[x[0]:x[1]:100j, y[0]:y[1]:100j]
plt.contour(x.ravel(), y.ravel(), -y**2 + x**3 + x*a + b, [0])

x = [-5,-0.15]
y = [-5,5]
plt.plot(x, y, '-', color='blue')
_x = [-0.5,(-0.5+x[1]-x[0])]
_y = [-5,5]
plt.plot(_x, _y, '-',color='blue')

# Annotations
xs = [-1.8, 1.3, 1.3]
ys = [1.6, -1.2, 1.2]
pts = ['2P', 'R', u"R' = P ⊕ P = 2P"]
plt.plot(xs, ys, 'o', color='orange')
for i in range(len(pts)):
    plt.annotate(pts[i], xy=(xs[i], ys[i]), xytext=(xs[i]-0.2, ys[i]+0.5))

plt.title("Annotated of 2*P")
plt.show()
