clear all
close all
clc
N=10;
Seq=randi([0,1],1,N);
Ts=0.001; 
Fs=1/Ts; 
To=1; 
Fo=1/To;

n0=0.1/Ts; 
Vplus=5; 
V0=0; 
Vminus=-5;

t=Ts:Ts:To; 
T=length(t);

nrzl=zeros(1,T);
t1= Ts:Ts:100*Ts;
c = 3*cos(2*pi*50.*t);

Carrier = 3*cos(2*pi*50.*t1);
ask = zeros(1,T);

for i=1:N
    for j=1:n0
        if (Seq(1,i)==1)
            nrzl(1,j+(i-1)*N*10)=Vplus;
        end
        if (Seq(1,i)==0)
            nrzl(1,j+(i-1)*N*10)=Vminus;
        end
    end
end
for i=1:N
    if (Seq(1,i)==1)
        ask(1,[(i-1)*100+1:i*100])=Carrier;
    end
end
figure (1)
subplot(311)
plot(t,nrzl); 
xlabel("Time Axis"); 
ylabel("Amplitude"); 
title("Binary Data in NRZ-L");

subplot(312)
plot(t,c); 
xlabel("Time Axis"); 
ylabel("Amplitude"); 
title("Carrier");

subplot(313)
plot(t,ask); 
xlabel("Time Axis"); 
ylabel("Amplitude"); 
title("ASK");

NRZL = (1/T).*fftshift(fft(nrzl,T));
C = (1/T).*fftshift(fft(c,T));
ASK = (1/T).*fftshift(fft(ask,T));
f=(-Fs/2)+Fo:Fo:(Fs/2);

figure (2)
subplot(311)
plot(f,abs(NRZL)); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Binary Data Spectrum");

subplot(312)
plot(f,abs(C)); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Carrier Spectrum");

subplot(313)
plot(f,abs(ASK)); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("ASK Spectrum");

figure (3)
subplot(311)
plot(f,20*log10(abs(NRZL))); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Binary Data Spectrum");

subplot(312)
plot(f,20*log10(abs(C))); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Carrier Spectrum");

subplot(313)
plot(f,20*log10(abs(ASK))); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("ASK Spectrum");