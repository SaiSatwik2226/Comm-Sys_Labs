clear;
clc;
close all;

Fs = 400*1000;
T = 1/Fs;
L = 1000;
t = (0:L-1)*T;
Fm = 2000;
Fc = 100000;

Am = 1;
Ac = 2;

m = Am*sin(2*pi*Fm*t);
c = Ac*cos(2*pi*Fc*t);

mhat = imag(hilbert(m));
c1 = Ac*sin(2*pi*Fc*t);

x1 = (m.*c);
x2 = (mhat.*c1);

figure(1);
subplot(4,2,[1 2]);
plot(t, m);
title('Message signal');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Message");
axis([0 4/Fm -2 2]);
grid;

subplot(4,2,[3 4]);
plot(t, c);
title('Carrier signal');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Carrier");
axis([0 4/Fm -2 2]);
grid;

subplot(4,2,5);
plot(t,x1);
title('m(t)*cos(2*pi*Fc*t) signal');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
axis([0 4/Fm -2 2]);
grid;

subplot(4,2,7);
plot(t,x2);
title('mhat(t)*sin(2*pi*Fc*t) signal');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
axis([0 4/Fm -2 2]);
grid;

yusb = x1-x2;
ylsb = x1+x2;
subplot(426);
plot(t, yusb);
title('USB Wave');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("USB");
axis([0 4/Fm -2 2]);
grid;

subplot(428);
plot(t, ylsb);
title('LSB Wave');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("LSB");
axis([0 4/Fm -2 2]);
grid;


%freq spectrums’ 

f = Fs*(-L/2:(L/2-1))/L;

figure(2);
M = fftshift(fft(m));
P2_1 = abs(M/L);
C = fftshift(fft(c));
P2_2 = abs(C/L);

subplot(211);
plot(f, P2_1);
hold on;
plot(f, P2_2);
title('Spectrum of message & carrier signal');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("Message","Carrier");


Yusb = fftshift(fft(yusb));
P2_3 = abs(Yusb/L);
Ylsb = fftshift(fft(ylsb));
P2_4 = abs(Ylsb/L);

subplot(212);
plot(f, P2_3);
hold on;
plot(f, P2_4);
title('USB & LSB wave');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("USB","LSB");


figure(3);
subplot(211);
plot(f,P2_1.^2);
hold on;
plot(f,P2_2.^2);
title('Power Spectrum of carrier signal');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Message","Carrier");

subplot(212);
plot(f,P2_3.^2);
hold on;
plot(f,P2_4.^2);
title('Power Spectrum of USB & LSB wave');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("USB","LSB");