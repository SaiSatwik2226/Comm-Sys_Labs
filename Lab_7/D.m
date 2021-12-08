Fs1 = 8e3;

Fm1= 3e3;

L1= 1000;

t1= (0:L1-1)/Fs;

m1= sin(2*pi*Fm1*t1);

y1= zeros(size(t1));

y1(1:(Fs/Fs1):end) = 1;

figure;
plot(t1, y1);
title('Periodic Pulse signal');
xlabel('Time');
ylabel('Amplitude');

ySampled = y1.*m1;
figure;
plot(t1, ySampled, t1, m1);
legend('Sampled signal', 'Sine wave');
title('Sine Wave');
xlabel('Time');
ylabel('Amplitude');

f1= Fs*(-L1/2:L1/2-1)/L1;

Y_sampled = fftshift(fft(ySampled));
figure;
plot(f1, (abs(Y_sampled/L1)));
axis([-5e4 5e4 -inf inf]);
title('Frequency Spectrum of Periodic Pulse signal');
xlabel('Frequency');
ylabel('Magnitude');

yRecovered = (ifft(Y_sampled));

figure;
plot(t1 , yRecovered, t1, m1);

legend('Sampled signal', 'Sine wave');
title('Sine Wave');
xlabel('Time');
ylabel('Amplitude');


Y_recovered = fftshift(fft(yRecovered));
figure;
plot(f1, (abs(Y_recovered/L1)));
axis([-5e4 5e4 -inf inf]);
title('Frequency Spectrum of Periodic Pulse signal');
xlabel('Frequency');
ylabel('Magnitude');
