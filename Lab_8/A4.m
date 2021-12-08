clc
clear all
close all

%spectrum plots
b= randi([0,1],1,10);
l=length(b);
b(l+1)=0;
n=1;
figure;
subplot(411);
%nrz - L%
totT1=[];
yfin1=[];
while n<=l
t=(n-1):.001:n;
totT1=[totT1,t];
if b(n)==1
if b(n+1)==b(n)
y=(t<=n);
else
y=(t<n);
end
else
if b(n+1)==b(n)
y=(t>n);
else
y=(t>=n);
end
end
yfin1=[yfin1,y];
plot(t,y)
hold on;
axis([0 l -1.5 1.5]);
n=n+1;
end
title('NRZ');
xlabel('Time');
ylabel('Amplitude');

l=length(b);
b(l+1)=0;
n=1;
subplot(412);
totT2=[];
yfin2=[];
while n<=l
t=(n-1):.001:n;
totT2=[totT2,t];
if b(n)==1
if b(n+1)==0
y=(t<(n-0.5))+(-1)*(t>=n-0.5&t<=n);
else
y=(t<(n-0.5)|t==n)+(-1)*(t>=n-0.5&t<n);
end
else
if b(n+1)==1
y=(-1)*(t<(n-0.5))+(t>=n-0.5&t<=n);
else
y=(-1)*(t<(n-0.5)|t==n)+(t>=n-0.5&t<n);
end
end
yfin2=[yfin2,y];
plot(t,y)
hold on;
axis([0 l -1.5 1.5]);
n=n+1;
end
title('Manchester');
xlabel('Time');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%
l=length(b);
b(l+1)=0;
n=1;
subplot(413)
totT3=[];
yfin3=[];
while n<=l
t=(n-1):.001:n;
totT3=[totT3,t];
if b(n)==1
if b(n+1)==b(n)
 y=(t<(n-0.5))+(t==n);
else
y=(t<(n-0.5));
end
else
if b(n+1)==1
y=0*(t<(n-0.5))+(t==n);
else
y=0*(t<(n-0.5));
end
end
n=n+1;
yfin3=[yfin3,y];
plot(t,y)
hold on;
axis([0 l -1.5 1.5]);
end
title('RZ');
xlabel('Time');
ylabel('Amplitude');
%%%%%%%%%%%%%%%
l=length(b);
b(l+1)=0;
n=1;
subplot(414);
totT4=[];
yfin4=[];
while n<=l
t=(n-1):.001:n;
totT4=[totT4,t];
if b(n)==1
if b(n+1)==b(n)
y=(t<=n);
else
y=(t<n);
end
else
if b(n+1)==b(n)
y=(t>n);
else
y=(t>=n);
end
end
yfin4=[yfin4,y];
plot(t,y)
hold on;
axis([0 l -1.5 1.5]);
n=n+1;
end
title('NRZ-M (Bipolar)');
xlabel('Time');
ylabel('Amplitude');


%%%
%%%%spectrums plot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure,
fs=size(totT1,2);%sampling rate
t = 0:1/fs:1-1/fs;
%t=totT;
N=size(t,2);
%Take fourier transform
fftm = fft(yfin1);
fftm = fftshift(fftm);
%Next, calculate the frequency axis, which is defined by the sampling rate
%Since the signal is complex, we need to plot the magnitude to get it to
subplot(411)
f = fs/2*linspace(-1,1,fs);
plot(f, abs(fftm)/N);
title('spectrum of NRZ');
xlabel('Frequency (Hz)');
ylabel('magnitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs=size(totT2,2);%sampling rate
t = 0:1/fs:1-1/fs;
%t=totT;
N=size(t,2);
%Take fourier transform
fftm = fft(yfin2);
fftm = fftshift(fftm);
%Next, calculate the frequency axis, which is defined by the sampling rate
%Since the signal is complex, we need to plot the magnitude to get it to
subplot(412)
f = fs/2*linspace(-1,1,fs);
plot(f, abs(fftm)/N);
title('spectrum of Manchester');
xlabel('Frequency (Hz)');
ylabel('magnitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs=size(totT3,2);%sampling rate
t = 0:1/fs:1-1/fs;
%t=totT;
N=size(t,2);
%Take fourier transform
fftm = fft(yfin3);
fftm = fftshift(fftm);
%Next, calculate the frequency axis, which is defined by the sampling rate
%Since the signal is complex, we need to plot the magnitude to get it to
subplot(413)
f = fs/2*linspace(-1,1,fs);
plot(f, abs(fftm)/N);
title('spectrum of RZ');
xlabel('Frequency (Hz)');
ylabel('magnitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs=size(totT4,2);%sampling rate
t = 0:1/fs:1-1/fs;
%t=totT;
N=size(t,2);
%Take fourier transform
fftm = fft(yfin4);
fftm = fftshift(fftm);
%Next, calculate the frequency axis, which is defined by the sampling rate
%Since the signal is complex, we need to plot the magnitude to get it to
subplot(414)
f = fs/2*linspace(-1,1,fs);
plot(f, abs(fftm)/N);
title('spectrum of NRZ-M (Bipolar)');
xlabel('Frequency (Hz)');
ylabel('magnitude');