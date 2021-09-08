clear;
clc;
close all;

t = 0:0.5*10^-6:10^-3;

m = cos(2*pi*2000*t);
c = 3*cos(2*pi*100000*t);

subplot(4, 2, 1);
plot(t, m);
grid;
subplot(4, 2, 2);
plot(t, c);
grid;

y = (3 + m).*(c/3);

subplot(4, 2, 3);
plot(t, y);
grid;

mfft = fftshift(fft(m));
N=10^-3/(0.5*10^-6);
Fs = 2*10^6;
dF = Fs/N;
f = -Fs/2:dF:Fs/2;
subplot(4,2,4);
plot(f,abs(mfft)/N);
subplot(4,2,5);
plot(f,abs(fftshift(fft(c)))/N);
subplot(4,2,6);
plot(f,abs(fftshift(fft(y)))/N);

subplot(4,2,7);
plot(f,(abs(fftshift(fft(y)))/N)-(abs(fftshift(fft(c)))/N));