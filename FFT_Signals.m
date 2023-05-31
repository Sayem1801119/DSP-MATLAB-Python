clc
close all
clear all;
t=linspace(0,1,200);
f1=5;
f2=10;
signal1=2*sin(2*pi*f1*t);
signal2=6*sin(2*pi*f2*t);
signal3=signal1+signal2;

Fs=1/(t(2)-t(1));
Freq=linspace(-(Fs/2),(Fs/2),length(t));
Sigf1=fft(signal1);
Sigf2=fft(signal2);
Sigf3=fft(signal3);

subplot(3,2,1)
plot(t,signal1)
xlabel('Time')
ylabel('Amplitude')
title('Signal_1 in Time Domain')

subplot(3,2,2)
plot(Freq,abs(fftshift(Sigf1)));
xlabel('Frequency')
ylabel('Amplitude')
title('Signal_1 in Frequency Domain')

subplot(3,2,3)
plot(t,signal2)
xlabel('Time')
ylabel('Amplitude')
title('Signal_2 in Time Domain')

subplot(3,2,4)
plot(Freq,abs(fftshift(Sigf2)));
xlabel('Frequency')
ylabel('Amplitude')
title('Signal_2 in Frequency Domain')

subplot(3,2,5)
plot(t,signal3)
xlabel('Time')
ylabel('Amplitude')
title('Signal_3 in Time Domain')

subplot(3,2,6)
plot(Freq,abs(fftshift(Sigf3)));
xlabel('Frequency')
ylabel('Amplitude')
title('Signal_3 in Frequency Domain')
