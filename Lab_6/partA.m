clear;
clc;
close all;

Fs = 1000*1000;
T = 1/Fs;
L = 4000;
t = (0:L-1)*T;

Am = 1;
Ac = 3;
fm = 2*1000;
fc = 10*1000;
wm = 2*pi*fm;
wc = 2*pi*fc;

kp = 2*pi;

m = Am * sin(wm*t);
c = Ac * sin(wc*t);
m_ = Am * kp;
% m_ = 0.5;
x = m_ * cos(wm*t);

y = Ac * cos(wc*t + x);

figure(1);

subplot(3, 1, 1);
plot(t, m);
title('Message Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, c);
title('Carrier Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, y);
title('PM Modulated Signal');
xlabel('Time');
ylabel('Amplitude');

figure(2);
plot(t, y);
title('Phase Modulated Signal');
xlabel('Time');
ylabel('Amplitude');

% -------------------------------------------------

% Power calculations.
power_timedomain = sum(abs(y).^2)/length(y);

[pxx, f] = periodogram(y, hamming(length(y)), [], Fs, 'centered', 'psd');
power_freqdomain = bandpower(pxx, f, 'psd');

% -------------------------------------------------

% Frequency Spectrum
f = Fs * (-L/2:( L/2 - 1 ) )/L;

M = fftshift(fft(m));
M = abs(M/L);

figure(3);
subplot(3, 1, 1);
plot(f, M);
title('Frequency Spectrum of Message Signal');
xlabel('Frequency');
ylabel('Amplitude');

C = fftshift(fft(c));
C = abs(C/L);

subplot(3, 1, 2);
plot(f, C);
title('Frequency Spectrum of Carrier Signal');
xlabel('Frequency');
ylabel('Amplitude');

Y = fftshift(fft(y));
Y = abs(Y/L);

subplot(3, 1, 3);
plot(f, Y);
title('Frequency Spectrum of PM Modulated Signal');
xlabel('Frequency');
ylabel('Amplitude');

figure(4);
subplot(3, 1, 1);
plot(f, 10*log10(M) );
title('Frequency Spectrum of Message Signal');
xlabel('Frequency');
ylabel('Amplitude (in dB)');

C = fftshift(fft(c));
C = abs(C/L);

subplot(3, 1, 2);
plot(f, 10*log10(C) );
title('Frequency Spectrum of Carrier Signal');
xlabel('Frequency');
ylabel('Amplitude (in dB)');

Y = fftshift(fft(y));
Y = abs(Y/L);

subplot(3, 1, 3);
plot(f, 10*log10(Y) );
title('Frequency Spectrum of PM Modulated Signal');
xlabel('Frequency');
ylabel('Amplitude (in dB)');
axis([-inf inf -30 inf]);

% -------------------------------------------------

% Demodulation
wct = (1*2*pi*fc*t);
m_dms = angle(hilbert(y));
figure(7);
plot(t, m_dms);
title('Hilbert Transform');
xlabel('Time');
ylabel('Amplitude');

m_dms = unwrap(m_dms);
figure(8);
plot(t, m_dms);
title('Unwrapped Signal');
xlabel('Time');
ylabel('Amplitude');

m_dms = m_dms - wct;
figure(9);
plot(t, m_dms);
title('Demodulated Signal');
xlabel('Time');
ylabel('Amplitude');

m_dms = unwrap(angle(hilbert(y))) - wct;
figure(5);
subplot(2, 1, 1);
plot(t, m);
title('Original Message Signal');
xlabel('Time');
ylabel('Amplitude');
subplot(2, 1, 2);
plot(t, m_dms);
title('Demodulated Message Signal');
xlabel('Time');
ylabel('Amplitude');

M_dms = fftshift( fft(m_dms) );
M_dms = abs(M_dms/L);
figure(6);
subplot(2, 1, 1);
plot(f, 10*log10(M));
axis([-20*1000 20*1000 -inf inf]);
title('Frequency Spectrum of Original Message Signal');
xlabel('Frequency');
ylabel('Amplitude (in dB)');

subplot(2, 1, 2);
plot(f, 10*log10(M_dms));
axis([-20*1000 20*1000 -inf inf]);
title('Frequency Spectrum of Demodulated Message Signal');
xlabel('Frequency');
ylabel('Amplitude (in dB)');