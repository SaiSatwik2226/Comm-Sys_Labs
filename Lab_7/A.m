clear;
clc;
close all;

Fs = 10e5;

L = 2000;
t = (0:L-1)/Fs;

Tau = 1e-5;
disp(1/Tau);

T = 1e-4;
disp(1/T);

disp(Tau + T);

y = zeros(size(t));
k = Fs*(Tau+T*2);
y(1:k:end) = 1;


plot(t, y);
title('Periodic Pulse signal');
xlabel('Time');
ylabel('Amplitude');

f = Fs*(-L/2:L/2-1)/L;

Y = fftshift(fft(y));
figure;
plot(f, (abs(Y/L)));
title('Frequency Spectrum of Periodic Pulse signal');
xlabel('Frequency');
ylabel('Magnitude');
xlim([-Fs/10 Fs/10]);