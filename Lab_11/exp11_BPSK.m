randombits = randi([0 1], 1, 10);
fs = 1000;
ts = 1/fs;
N = 0.1/ts;
t = 0:ts:1;

m = zeros(1, length(t));
for i = 1:10
    if randombits(i) == 0
        m(1+(i-1)*N:i*N) = -5;
    else
        m(1+(i-1)*N:i*N) = 5;
    end
end

c = 3*sin(2*pi*50*t);

figure(1);

subplot(311);
plot(t, m);
title('Message Signal');
subplot(312);
plot(t, c);
title('Carrier Signal');

bpsk = c.*m;
subplot(313);
plot(t, bpsk);
title('BPSK Signal');

l = length(t);

f = -fs/2:fs/2;
m_s = abs(fftshift(fft(m))/l);
c_f = abs(fftshift(fft(c))/l);
bpsk_f = abs(fftshift(fft(bpsk))/l);


figure(2);
subplot(311);
plot(f, m_s);
title('Message Signal Spectrum');
subplot(312);
plot(f, c_f);
title('Carrier Signal Spectrum');
subplot(313);
plot(f, bpsk_f);
title('BPSK Signal Spectrum');

m_s_db = 10*log(m_s);
c_f_db = 10*log(c_f);
bpsk_f_db = 10*log(bpsk_f);

figure(3);
subplot(311);
plot(f, m_s_db);
title('Message Signal Spectrum in dB');
subplot(312);
plot(f, c_f_db);
title('Carrier Signal Spectrum');
subplot(313);
plot(f, bpsk_f_db);
title('BPSK Signal Spectrum in dB');

figure(4);

for i = 1:length(t)
    if c(i)*bpsk(i) > 0
        d(i) = 1;
    else
        d(i) = 0;
    end
end
plot(t, d);
title('Demodulated Signal');
