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
c1 = 3*cos(2*pi*50.*t);
c2 = 3*cos(2*pi*70.*t);

Carrier1 = 3*cos(2*pi*50.*t1);
Carrier2 = 3*cos(2*pi*70.*t1);

fsk = zeros(1,T);

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
        fsk(1,[(i-1)*100+1:i*100])=Carrier1;
    end
    if (Seq(1,i)==0)
        fsk(1,[(i-1)*100+1:i*100])=Carrier2;
    end
end

figure (1)
subplot(411)
plot(t,nrzl);
xlabel("Time Axis"); 
ylabel("Amplitude"); 
title("Binary Data in NRZ-L");

subplot(412)
plot(t,c1); 
xlabel("Time Axis"); 
ylabel("Amplitude"); 
title("Carrier 1");

subplot(413)
plot(t,c2); 
xlabel("Time Axis"); 
ylabel("Amplitude"); 
title("Carrier 2");

subplot(414)
plot(t,fsk); 
xlabel("Time Axis"); 
ylabel("Amplitude"); 
title("FSK");

NRZL = (1/T).*fftshift(fft(nrzl,T));
C1 = (1/T).*fftshift(fft(c1,T));
C2 = (1/T).*fftshift(fft(c2,T));
FSK = (1/T).*fftshift(fft(fsk,T));
f=(-Fs/2)+Fo:Fo:(Fs/2);

figure (2)
subplot(411)
plot(f,abs(NRZL)); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Binary Data Spectrum");

subplot(412)
plot(f,abs(C1)); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Carrier Spectrum 1");

subplot(413)
plot(f,abs(C2)); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Carrier Spectrum 2");

subplot(414)
plot(f,abs(FSK)); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("FSK Spectrum");

figure (3)
subplot(411)
plot(f,20*log10(abs(NRZL))); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Binary Data Spectrum");

subplot(412)
plot(f,20*log10(abs(C1))); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Carrier Spectrum 1");

subplot(413)
plot(f,20*log10(abs(C2))); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("Carrier Spectrum 2");

subplot(414)
plot(f,20*log10(abs(FSK))); 
xlabel("Frequency"); 
ylabel("Amplitude"); 
title("FSK Spectrum");