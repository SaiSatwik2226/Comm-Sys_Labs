Fm = 2e3;

m = sin(2*pi*Fm*t);

sampled = m.*y;

figure;
plot(t, sampled, t, m);
legend('Sampled signal', 'Sine wave');
title('Sine Wave');
xlabel('Time');
ylabel('Amplitude');

Sampled = (fft(sampled));
figure;
plot(f, (abs(Sampled/L)));
title('Frequency Spectrum');
xlabel('Frequency');
ylabel('Magnitude');