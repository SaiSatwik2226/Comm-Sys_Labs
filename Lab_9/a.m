clear;
clc;
close all;

Fc = 10e5;
Fs = 2*Fc;

L = 2000;
t = (0:L-1)/Fc;

Tau = 1e-5;
disp(1/Tau);

T = 1e-4;
disp(1/T);

disp(Tau + T);

y = zeros(size(t));
k = Fc*(Tau+T*2);
y(1:k:end) = 1;


plot(t, y);
title('Periodic Pulse signal');
xlabel('Time');
ylabel('Amplitude');