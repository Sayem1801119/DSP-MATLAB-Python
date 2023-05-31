clc
close all
clear all;
t=linspace(0,1,200);
f1=5;
f2=10;
signal1=2*sin(2*pi*f1*t);
signal2=6*sin(2*pi*f2*t);
signal3=signal1+signal2;

%Random Signal
Noise=randn((size(signal3)));
%Adding Noise
SigN3=signal3+Noise;

Order=5;
Cutoff=0.2;
[a,b]=butter(Order,Cutoff)
Denoised_Bt=filtfilt(a,b,SigN3);

Fs=1/(t(2)-t(1));
Freq=linspace(-(Fs/2),(Fs/2),length(t));
Sigf1=fft(signal1);
Sigf2=fft(signal2);
Sigf3=fft(signal3);
Noisef=fft(Noise);
SigN3f=fft(SigN3);
Denoisedf=fft(Denoised_Bt);
DenoisedfT=ifft(Denoisedf);

figure(1)
subplot(4,2,1)
plot(t,Noise)
xlabel('Time')
ylabel('Amplitude')
title('Noise in Time Domain')

subplot(4,2,2)
plot(Freq,abs(fftshift(Noisef)));
xlabel('Frequency')
ylabel('Amplitude')
title('Noise in Frequency Domain')

subplot(4,2,3)
plot(t,signal3)
xlabel('Time')
ylabel('Amplitude')
title('Noise in Time Domain')

subplot(4,2,4)
plot(Freq,abs(fftshift(Sigf3)));
xlabel('Frequency')
ylabel('Amplitude')
title('Signal_3 in Frequency Domain')

subplot(4,2,5)
plot(t,SigN3)
xlabel('Time')
ylabel('Amplitude')
title('Signal_3 with Noise Time Domain')

subplot(4,2,6)
plot(Freq,abs(fftshift(SigN3f)));
xlabel('Frequency')
ylabel('Amplitude')
title('Signal_3 with Noise in Frequency Domain')

subplot(4,2,7)
plot(t,DenoisedfT)
xlabel('Time')
ylabel('Amplitude')
title('Signal_3 without Noise in Time Domain')

subplot(4,2,8)
plot(Freq,abs(fftshift(Denoisedf)));
xlabel('Frequency')
ylabel('Amplitude')
title('Signal_3 without Noise in Frequency Domain')
