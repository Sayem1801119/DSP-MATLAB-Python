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

sampling_frequencies = [10, 50, 100, 200]
rms_vals = np.zeros(len(sampling_frequencies))

# Create a figure with subplots
# Variables fig and plot
fig, plot = plt.subplots(len(sampling_frequencies), 1, figsize=(6, 8))

# Iterate over sampling frequencies
plt.figure(2)
for i, sf in enumerate(sampling_frequencies):
    t = np.linspace(0, 1, sf)
    s = 10 * np.sin(2 * np.pi * f1 * t)
    plot[i].stem(t, s)
    plot[i].set_title(f"Sampling frequency {sf} Hz")
    plt.tight_layout()
    plt.subplots_adjust(hspace=0.5)
# Finding sampling error
    s_resampled = np.interp(ts, t, s)
    s_diff = ss - s_resampled
    # Calculate RMS of s_diff
    rms_vals[i] = np.sqrt(np.mean(np.square(s_diff)))

# Sampling error vs Sampling frequency
plt.figure(3)
plt.plot(sampling_frequencies, rms_vals, '-g', linewidth=2)
plt.title("sampling Error vs  Sampling Frequency")
plt.xlabel(' Sampling Frequency (Hz)')
plt.ylabel('sampling Error')
plt.show()
