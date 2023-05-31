import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(0, 1, 200)
f1 = 5
f2 = 10
signal1 = 2 * np.sin(2 * np.pi * f1 * t)
signal2 = 6 * np.sin(2 * np.pi * f2 * t)
signal3 = signal1 + signal2

Fs = 1 / (t[1] - t[0])
Freq = np.linspace(-(Fs / 2), (Fs / 2), len(t))
Sigf1 = np.fft.fft(signal1)
Sigf2 = np.fft.fft(signal2)
Sigf3 = np.fft.fft(signal3)

plt.subplot(3, 2, 1)
plt.plot(t, signal1)
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.title('Signal_1 in Time Domain')

plt.subplot(3, 2, 2)
plt.plot(Freq, np.abs(np.fft.fftshift(Sigf1)))
plt.xlabel('Frequency')
plt.ylabel('Amplitude')
plt.title('Signal_1 in Frequency Domain')

plt.subplot(3, 2, 3)
plt.plot(t, signal2)
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.title('Signal_2 in Time Domain')

plt.subplot(3, 2, 4)
plt.plot(Freq, np.abs(np.fft.fftshift(Sigf2)))
plt.xlabel('Frequency')
plt.ylabel('Amplitude')
plt.title('Signal_2 in Frequency Domain')

plt.subplot(3, 2, 5)
plt.plot(t, signal3)
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.title('Signal_3 in Time Domain')

plt.subplot(3, 2, 6)
plt.plot(Freq, np.abs(np.fft.fftshift(Sigf3)))
plt.xlabel('Frequency')
plt.ylabel('Amplitude')
plt.title('Signal_3 in Frequency Domain')

plt.tight_layout()
plt.show()
