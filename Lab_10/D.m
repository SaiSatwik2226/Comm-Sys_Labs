clear all
close all
clc
N=10;
Seq=randi([0,1],1,N);
Ts=0.001; Fs=1/Ts; To=1; Fo=1/To;
n0=0.1/Ts; Vplus=5; V0=0; Vminus=-5;
t=Ts:Ts:To; T=length(t);
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
demod1 = fsk.*c1;
demod2 = fsk.*c2;
Demodulated_seq1 = zeros(1,N);
Demodulated_seq2 = zeros(1,N);
for i=1:N
 Demodulated_seq1(1,i) = sum(demod1(1,[(i-1)*100+1:i*100]))>1;
 Demodulated_seq2(1,i) = sum(demod2(1,[(i-1)*100+1:i*100]))<1;
end
Demodulated_seq1
Demodulated_seq2