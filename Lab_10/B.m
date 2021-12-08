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
c = cos(2*pi*50.*t);
Carrier = cos(2*pi*50.*t1);
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
demod = ask.*c;
Demodulated_Seq = zeros(1,N);

for i=1:N
    Demodulated_Seq(1,i) = sum(demod(1,[(i-1)*100+1:i*100]))>1;
end
Demodulated_Seq