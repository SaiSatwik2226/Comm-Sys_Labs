[m_, n] = size(sampled);

rSampled = (ifft(Sampled));
[ii, jj] =size(rSampled);
t1 = t(1:jj);
figure;
plot(t1 , rSampled, t, m);

legend('Sampled signal', 'Sine wave');
title('Sine Wave');
xlabel('Time');
ylabel('Amplitude');