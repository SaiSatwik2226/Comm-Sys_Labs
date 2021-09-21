clear;
clc;
close all;

Fs = 200*1000;
T = 1/Fs;
L = 500;
t = (0:L-1)*T;

m = cos(2*pi*2000*t);
c = 3*cos(2*pi*100000*t);


% Original Signal
y = (3 + m).*(c/3);

figure(1);
plot(t, y);
title("Under Modulation");
grid;

% fft
Y = fft(y);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L-1))/L;
figure(2);
plot(f, P2);
title("Under Modulation");




%critical modulation
y = (3 + (3*m)).*(c/3);
figure(3);
plot(t, y);
title("Critical Modulation");
grid;

% fft of critical modulation
Y = fft(y);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L-1))/L;
figure(4);
plot(f, P2);
title('Spectrum of AM wave when Q=0 Critical Modulation');
xlabel('Frequency');
ylabel('Amplitude');


figure(7);
plot(f, P2.^2);
title("Freq. Spectrum of Carrier Signal");
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Signal");
grid;


% overmodulation
y = (3 + (5*m)).*(c/3);
figure(5);
plot(t, y);
title("Over Modulation");
grid;

% fft of overmodulation
Y = fft(y);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L-1))/L;
figure(6);
plot(f, P2);
title('Overmodulation');
xlabel('Frequency');
ylabel('Amplitude');
figure(8);
plot(f, P2.^2);
title("Freq. Spectrum of Carrier Signal");
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Signal");
grid;