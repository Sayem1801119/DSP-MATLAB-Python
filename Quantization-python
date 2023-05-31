import numpy as np
import matplotlib.pyplot as plt

# Signal frequency 10 Hz
f1 = 10
ts = np.linspace(0, 1, 600)
ss = 10 * np.sin(2 * np.pi * f1 * ts)
plt.figure(1)
plt.plot(ts, ss, '-b', linewidth=2)
plt.title('Continuous Signal, 10 Sin(20*pi*t)')
plt.xlabel(' Main Signal Sampled at 600 Hz')

Q_level = [2, 4, 8, 16]
snew = np.zeros_like(ss)
quantization_error = []
# Create a figure with subplots
# Variables fig and plot
fig, plot = plt.subplots(len(Q_level), 1, figsize=(8, 8))

# Iterate over Q_level
plt.figure(2)
for i, Ql in enumerate(Q_level):
    for k in range(len(ss)):
        level = np.linspace(-10, 10, Ql)
        difference = np.abs(level - ss[k])
        index = np.argmin(difference)
        snew[k] = level[index]
    plot[i].plot(ts, snew)
    plot[i].set_title(f"Number of quantization levels {Ql} ")
    plt.tight_layout()
    plt.subplots_adjust(hspace=0.5)

    # Calculate quantization error
    error = np.mean(np.abs(ss - snew))
    quantization_error.append(error)

plt.figure(3)
plt.plot(Q_level, quantization_error)
plt.title("Quantization Error vs Quantization Level")
plt.xlabel("Quantization Level (Q_level)")
plt.ylabel("Quantization Error")
plt.show()
