clc;
clear;
close all;
bits= randi([0,1],1,10);
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
for i=1:length(bits)
if bits(i)==1
x((i-1)*n+1:i*n) = 1;
else x((i-1)*n+1:i*n) = -1;
end
end
plot(t, x);
title("NRZ-L Decoding")
axis([0 10 -1.5 1.5])
counter = 0;
for i = 1:length(t)
if t(i)>counter
counter = counter + 1;
if x(i)>0
result(counter) = x(i);
else result(counter) = 0;
end
end
end
disp('NRZ-L Decoding:');
disp(result);