clear;
clc;
close all;

Fs = 200*1000;
T = 1/Fs;
L = 500;
t = (0:L-1)*T;
Fm = 2000;
Fc = 100000;

m = cos(2*pi*Fm*t);
c = 3*cos(2*pi*Fc*t);


subplot(3, 1, 1);
plot(t, m);
title('Message signal');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
grid;
subplot(3, 1, 2);
plot(t, c);
title('Carrier signal');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
grid;

y = (3 + m).*(c/3);

subplot(3, 1, 3);
plot(t, y);
title('AM Wave');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
grid;

%freq spectrums’ 

f = Fs*(0:(L-1))/L;


figure;
M = fft(m);
P2_1 = abs(M/L);
P1_1 = P2_1(1:L/2+1);
P1_1(2:end-1) = 2*P1_1(2:end-1);

subplot(3, 1, 1);
plot(f, P2_1);
title('Spectrum of message signal');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("Signal");


C = fft(c);
P2_2 = abs(C/L);
P1_2 = P2_2(1:L/2+1);
P1_2(2:end-1) = 2*P1_2(2:end-1);

subplot(3, 1, 2);
plot(f, P2_2);
title('Spectrum of carrier signal');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("Signal");


Y = fft(y);

P2_3 = abs(Y/L);
P1_3 = P2_3(1:L/2+1);
P1_3(2:end-1) = 2*P1_3(2:end-1);

subplot(3, 1, 3);
plot(f, P2_3);
title('Spectrum of AM wave');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("Signal");


figure;
subplot(3,1,1);
plot(f,P2_1.^2);
title('Power Spectrum of message signal');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Signal");

subplot(3,1,2);
plot(f,P2_2.^2);
title('Power Spectrum of carrier signal');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Signal");

subplot(3,1,3);
plot(f,P2_3.^2);
title('Power Spectrum of AM wave');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Signal");