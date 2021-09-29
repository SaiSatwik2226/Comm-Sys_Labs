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

% Part B Demodulation
y_demsig = [diff(y) 0];
figure(6);
    plot(t, y_demsig);
    title('Differentiated Signal');
    xlabel('time(t)');
    ylabel("Amplitude(Volt)");
    legend("Diff Signal");
    grid;
    y_demsig = abs(y_demsig);

figure(7);
    plot(t, y_demsig);
    title('Envelope of the Signal');
    xlabel('time(t)');
    ylabel("Amplitude(Volt)");
    legend("Envelope Signal");
    grid;
    [b, a] = butter(5, 2*Fm/Fs);
    y_demsig = filter(b, a, y_demsig);

figure(8);
    subplot(2, 1, 1);
    plot(t, Am*sin(Wm*t) );
    title('Original Message Signal');
    xlabel('time(t)');
    ylabel("Amplitude(Volt)");
    legend("Message");
    grid;

    subplot(2, 1, 2);
    plot(t, y_demsig);
    title('Demodulated Signal');
    xlabel('time(t)');
    ylabel("Amplitude(Volt)");
    legend("Message");
    grid;

figure(9);
    plot(t, y_demsig);
    title('Demodulated Signal');
    xlabel('time(t)');
    ylabel("Amplitude(Volt)");
    legend("Message");
    grid;

    
f = Fs * (-L/2:(L/2-1)) / L;

M = fftshift( fft(m) );
M = abs(M/L);

% Frequency Spectrum of Original & Demodulated Signal
figure(10);
    subplot(2, 1, 1);
    plot(f, M);
    title('Frequency Spectrum of Original Message Signal');
    xlabel("Freq (Hz)");
    ylabel("Magnitude in dB");
    legend("Signal");
    grid;
    
    Y_demsig = fftshift( fft(y_demsig) );
    Y_demsig = abs(Y_demsig/L);
    
    subplot(2, 1, 2);
    plot(f, Y_demsig);
    title('Frequency Spectrum of Demodulated Signal');
    xlabel("Freq (Hz)");
    ylabel("Magnitude in dB");
    legend("Signal");
    grid;