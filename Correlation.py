import numpy as np
import matplotlib.pyplot as plt

x = np.array([3, 4, 5, 6, 2])
y = np.array([4, 5, 6])
m = len(x)
n = len(y)
Lag = np.arange(-(n-1), m)
L = m + n - 1
znum = L - m
Z = np.zeros(znum)
Xnew = np.concatenate((Z, x, Z))
CRR = np.zeros(L)

for i in range(L):
    A = np.zeros(L + znum)
    for k in range(n):
        p = n - k - 1
        A[i + p] = y[p]
    CRs = A * Xnew
    CRR[i] = np.sum(CRs)

Cross_correlation = np.vstack((Lag, CRR))
print(Cross_correlation)
plt.subplot(3, 1, 1)
n1 = np.arange(1, m+1)
plt.stem(n1, x, 'b', use_line_collection=True)
plt.title('x[n]')
plt.xlabel('Sample Index')
for i, j in zip(n1, x):
    plt.text(i, j, str(j), va='bottom', ha='left')

plt.subplot(3, 1, 2)
n2 = np.arange(1, n+1)
plt.stem(n2, y, 'r', use_line_collection=True)
plt.title('y[n]')
plt.xlabel('Sample Index')
for i, j in zip(n2, y):
    plt.text(i, j, str(j), va='bottom', ha='left')

plt.subplot(3, 1, 3)
n3 = np.arange(-(n-1), m)
plt.stem(n3, CRR, 'g', use_line_collection=True)
plt.title('Correlation, r[n]')
plt.xlabel('Lag Index')
for i, j in zip(n3, CRR):
    plt.text(i, j, str(j), va='bottom', ha='left')

plt.tight_layout()
plt.show()

# r = np.correlate(x, y, 'full')
# print(r)
