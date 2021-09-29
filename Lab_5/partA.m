clear;
clc;
close all;

Fs = 400*1000;
T = 1/Fs;
L = 2000;
t = (0:L-1)*T;

Am = 1;
Ac = 3;
Fm = 2*1000;
Fc = 10*1000;
Wc = 2*pi*Fc;
Wm = 2*pi*Fm;
kf = 2*pi*5.5*1000;

m = Am*sin(Wm*t);
c = Ac*sin(Wc*t);

x = kf*Am*cos(Wm*t)/(Wm);
y = Ac*sin(Wc*t+x);

% Part A Modulation
figure(1);
    subplot(3, 1, 1);
    plot(t, m);
    title('Message Signal');
    xlabel('time(t)');
    ylabel("Amplitude(Volt)");
    legend("Message");
    grid;

    subplot(3, 1, 2);
    plot(t, c);
    title('Carrier Signal');
    xlabel('time(t)');
    ylabel("Amplitude(Volt)");
    legend("Carrier");
    grid;

    subplot(3, 1, 3);
    plot(t, y);
    title('FM Modulated Signal');
    xlabel('time(t)');
    ylabel("Amplitude(Volt)");
    legend("FM Signal");
    grid;


% Frequency Spectrum
f = Fs * (-L/2:(L/2-1)) / L;

M = fftshift( fft(m) );
M = abs(M/L);
figure(2);
    subplot(2, 1, 1);
    plot(f, 10*log(M) );
    title('Frequency Spectrum of Message');
    xlabel("Freq (Hz)");
    ylabel("Magnitude in dB");
    legend("Signal");
    grid;

    C = fftshift( fft(c) );
    C = abs(C/L);
    figure(2);
    subplot(2, 1, 2);
    plot(f, 10*log(C) );
    title('Frequency Spectrum of Carrier');
    xlabel("Freq (Hz)");
    ylabel("Magnitude in dB");
    legend("Signal");
    grid;


Y = fftshift( fft(y) );
Y = abs(Y/L);

figure(3);
    plot(f, 10*log(Y) );
    title('Frequency Spectrum of FM Modulated Signal');
    xlabel("Freq (Hz)");
    ylabel("Magnitude in dB");
    legend("Signal");
    grid;


beta = 0.4377;
%beta = 1;

psi_NBFM = cos(2*pi*Fc*t) + (beta/2)*cos(2*pi*(Fc+Fm)*t) - (beta/2)*cos(2*pi*(Fc-Fm)*t);

figure(4);
    plot(t, psi_NBFM);
    xlabel('time(t)');
    ylabel("Amplitude(Volt)");
    legend("Signal");
    grid;

PSI_NBFM = fftshift( fft(psi_NBFM) );
PSI_NBFM = abs(PSI_NBFM/L);
figure(5);
    plot(f, 10*log(PSI_NBFM) );
    title('Frequency Spectrum of NBFM');
    xlabel("Freq (Hz)");
    ylabel("Magnitude in dB");
    legend("Signal");
    grid;