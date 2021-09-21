clear;
clc;
close all;

Fs = 200*1000;
T = 1/Fs;
L = 400;
t = (0:L-1)*T;

m = cos(2*pi*2000*t);
c = 3*cos(2*pi*100000*t);
[b, a] = butter(6, 5000*2/Fs);

% Under Modulated
y = (3 + m).*(c/3);

r = abs(y)-3;

dms = filter(b, a, r);
figure(1); plot(t, dms);
title('Demodulated signal in Under modulation (Time domain)');

DMS = fft(dms);
DMS = fftshift(DMS);
P2 = abs(DMS/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L-1))/L;
figure(2); plot(f, P2);
title('Demodulated signal in Under modulation (Spectral domain)');

%Crtitically Modulated
y = (3 + 3*m).*(c/3);

r = abs(y)-3;
% fft

dms = filter(b, a, r);
figure(3); plot(t, dms);
title('Demodulated signal in Crtitically modulation (Time domain)');

DMS = fft(dms);
DMS = fftshift(DMS);
P2 = abs(DMS/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L-1))/L;
figure(4); plot(f, P2);
title('Demodulated signal in Crtitically modulation (Spectral domain)');

%over modulated
y = (3 + 4*m).*(c/3);

r = abs(y)-3;
% fft

dms = filter(b, a, r);
figure(5); plot(t, dms);
title('Demodulated signal in overmodulation (Time domain)');

DMS = fft(dms);
DMS = fftshift(DMS);
P2 = abs(DMS/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L-1))/L;
figure(6); plot(f, P2);
title('Demodulated signal in overmodulation (Spectral domain)');