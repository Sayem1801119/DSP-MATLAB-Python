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

Fs=1/(t(2)-t(1));
Freq=linspace(-(Fs/2),(Fs/2),length(t));
Sigf1=fft(signal1);
Sigf2=fft(signal2);
Sigf3=fft(signal3);
Noisef=fft(Noise);
SigN3f=fft(SigN3);

threshold=30;
Denoised=SigN3f;
for i=1:length(Denoised)
if abs(Denoised(i))<threshold
Denoised(i)=0;
end
end
DenoisedT=ifft(Denoised);

figure(1)
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
