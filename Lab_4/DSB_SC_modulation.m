clear;
clc;
close all;
 
Fs = 400*1000;
T = 1/Fs;
L = 1000;
t = (0:L)*T;
Fm = 2000;
Fc = 100000;

Am = 1;
Ac = 2;
 
m = Am*sin(2*pi*Fm*t);
c = Ac*cos(2*pi*Fc*t);

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
 
y = m.*c;
 
subplot(3, 1, 3);
plot(t, y);
title('DSB SC spectrum');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
grid;
 
%freq spectrums’  
f = Fs*(-L/2:(L/2-1))/L;

figure;
M = fftshift(fft(m,L));
P2_1 = abs(M/L);
subplot(2,1,1);
plot(f,P2_1);
 
C = fftshift(fft(c,L));
P2_2 = abs(C/L);
hold on
plot(f, P2_2);
title('Spectrum of message & carrier signal');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("Message","Carrier");
 
 
Y = fftshift(fft(y,L));
P2_3 = abs(Y/L);
subplot(212);
plot(f, P2_3);
title('DSB SC spectrum');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("Signal");

figure;
subplot(211);
plot(f,P2_1.^2);
hold on
plot(f,P2_2.^2);
title('Power Spectrum of message & carrier signal');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Message","Carrier");

subplot(212);
plot(f,P2_3.^2);
title('Power Spectrum of DSB-SC wave');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Signal");
