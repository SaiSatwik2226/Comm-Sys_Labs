clear;
clc;
close all;

Fs = 400*1000;
T = 1/Fs;
L = 1000;
t = (0:L-1)*T;

Am = 1;
Ac = 2;

m = Am*sin(2*pi*2000*t);
c = Ac*cos(2*pi*100000*t);

[n,w] = buttord(2*2000/Fs,(8.4*2000)/Fs,.5,5);
[b,a] = butter(n,w,'low');

y = m.*c;

dms = (y.*c)./2;%./Ac^2;

%time domain
dms = filter(b, a, dms);
figure(1);
plot(t, dms);
title('Demodulated signal(Time domain)');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
disp(max(dms));
grid;


%freq domain
DMS = fft(dms);
DMS = fftshift(DMS);
P2 = abs(DMS/L);

disp(max(P2));
f = Fs*(-L/2:(L/2-1))/L;
figure(2);
plot(f, P2);
title('Demodulated signal(Spectral domain)');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("Signal");
grid;

%power spectrum
f = Fs*(-L/2:(L/2-1))/L;
figure(3);
plot(f, P2.^2);
title('Demodulated signal Power Spectrum');
title('Power Spectrum');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Signal");
grid;
