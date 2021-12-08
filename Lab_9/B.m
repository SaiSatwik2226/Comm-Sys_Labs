clear;
clc;
close all;

% ---   a   ---
fc = (10e3);
fm = 2e3;
disp(fc/fm);
Fs = 10*fc;

L = 750;
t = (0:L-1)/Fs;

m = sin(2*pi*fm*t);

squarePulse = square(t*Fs/(2*pi));
squarePulse(squarePulse < 0) = 0;

subplot(3,1,1);
plot(t, m);
axis([0 L/Fs -1.2 1.2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal');
subplot(3,1,2);
plot(t, squarePulse);
axis([0 L/Fs -0.2 1.2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Square Pulse Signal');


% ---   b   ---
A = 2;
sawtoothPulse = A*sawtooth(2*pi*fc*t);
subplot(3,1,3);
plot(t, sawtoothPulse);
axis([0 L/Fs -2.2 2.2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sawtooth Signal');


% ---   c   ---
PWM = zeros(1, L);
for i=1:L
    if ( m(i) >= sawtoothPulse(i) )
        PWM(i) = 1;
    end
end

% ---   d   ---
figure;
subplot(2,1,1);
plot(t, m);
hold on;
plot(t, sawtoothPulse);
axis([0 L/Fs -2.2 2.2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message & Sawtooth Signal');
legend('Message','Sawtooth');

subplot(2,1,2);
plot(t, PWM);
axis([0 L/Fs -2.2 2.2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Pulse Width Modulated Signal');

% ---   e   ---
f = (-L/2:(L-1)/2)*Fs/L;

M = abs(fftshift(fft(m)));
PWM_spectrum = abs(fftshift(fft(PWM)));
figure;
subplot(2,1,1);
plot(f, mag2db(M));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Freq. Spectrum of Message Signal');
subplot(2,1,2);
plot(f, mag2db(PWM_spectrum));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Freq. Spectrum of PWM Signal');





% ---   f   ---
PPM = zeros(1, L);
for i=1:L
   if( PWM(i)==1 && PWM(i+1)==0 )
       for j=0:((1/fm)/10*Fs)
           PPM(i+j) = 1;
       end
   end 
end
PPM = PPM(1:length(t));

% ---   g   ---
figure;
subplot(2,1,1);
plot(t, m);
hold on;
plot(t, sawtoothPulse);
axis([0 L/Fs -2.2 2.2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message & Sawtooth Signal');
legend('Message', 'Sawtooth');

subplot(2,1,2);
plot(t, PPM);
axis([0 L/Fs -2.2 2.2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Pulse Position Modulated Signal');


% ---   h   ---
PPM_spectrum = abs(fftshift(fft(PPM)));
figure;
subplot(2,1,1);
plot(f, mag2db(M));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Freq. Spectrum of Message Signal');
subplot(2,1,2);
plot(f, mag2db(PPM_spectrum));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Freq. Spectrum of PPM Signal');