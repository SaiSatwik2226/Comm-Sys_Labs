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

figure(1);
subplot(311);
plot(t, m);
title('Message signal(Time domain)');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
grid;

mhat = imag(hilbert(m));
c1 = Ac*sin(2*pi*Fc*t);

x1 = (m.*c);
x2 = (mhat.*c1);

[n,w] = buttord(2*2000/Fs,(8.3*2000)/Fs,.5,5);
[b,a] = butter(n,w,'low');

ylsb = x1+x2;
yusb = x1-x2;

dms = (yusb.*c)./(Ac);

dms = filter(b, a, dms);
figure(1);
subplot(312);
plot(t, dms);
title('Demodulated signal(Time domain) from USB');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
disp(max(dms));
grid;

DMS = fft(dms);
DMS = fftshift(DMS);
P2 = abs(DMS/L);

disp(max(P2));
f = Fs*(-L/2:(L/2-1))/L;
figure(2);
subplot(221);
plot(f, P2);
title('Demodulated signal(Spectral domain) from USB');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("Signal");
grid;

%power spectrum
f = Fs*(-L/2:(L/2-1))/L;
figure(2);
subplot(222);
plot(f, P2.^2);
title('Demodulated signal Power Spectrum from USB');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Signal");
grid;

%for LSB

dms = (ylsb.*c)./(Ac);

dms = filter(b, a, dms);
figure(1);
subplot(313);
plot(t, dms);
title('Demodulated signal(Time domain) from LSB');
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
legend("Signal");
disp(max(dms));
grid;

DMS = fft(dms);
DMS = fftshift(DMS);
P2 = abs(DMS/L);

disp(max(P2));
f = Fs*(-L/2:(L/2-1))/L;
figure(2);
subplot(223);
plot(f, P2);
title('Demodulated signal(Spectral domain) from LSB');
xlabel("frequency(Hz)");
ylabel("Amplitude");
legend("Signal");
grid;

%power spectrum
f = Fs*(-L/2:(L/2-1))/L;
figure(2);
subplot(224);
plot(f, P2.^2);
title('Demodulated signal Power Spectrum from LSB');
xlabel("frequency(Hz)");
ylabel("Power(W)");
legend("Signal");
grid;