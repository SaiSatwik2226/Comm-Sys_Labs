clc
clear all
close all

bits = randi([0,1],1,10);
t1 = 0.01:0.01:10;
Fs = 100;
dt = 1/Fs;
stoptime = 9.91;
stream1 = [];
nrz = [];
biphi_l = [];
rz_ami = [];
nrz_m = [];
for i= 0.01:0.01:10
stream1(int16(100*i)) = bits(ceil(i));
end
for i = 0.01:0.01:10
if stream1(int16(100*i)) == 0
nrz(int16(100*i)) = -1;
else
nrz(int16(100*i)) = 1;
end
end
for i = 0.01:0.01:10
if i - floor(i) < 0.5 & i ~= floor(i)
biphi_l(int16(100*i)) = stream1(int16(100*i));
% elseif i - floor(i) >= 0.5 | i == floor(i)
else
biphi_l(int16(100*i)) = 1 - stream1(int16(100*i));
end
end
pos = false;
j = 0.01;
for i = 0.01:0.01:10
if i - floor(i) < 0.5 & i ~= floor(i)
if ~pos
rz_ami(int16(100*i)) = -1*stream1(int16(100*i));
else
rz_ami(int16(100*i)) = stream1(int16(100*i));
end
% elseif i == floor(i)
% rz_ami(int16(100*i)) = 0;
else
rz_ami(int16(100*i)) = 0;
end
j = i + 0.01;
if i == floor(i) & stream1(int16(100*i)) == 1
pos = ~pos;
end
end
current_val = 0;
j = 0.01;
for i = 0.01:0.01:10
if i <= 1
nrz_m(int16(100*i)) = 0;
else
nrz_m(int16(100*i)) = current_val;
end
if i ~= 10
j = i + 0.01;
end
if stream1(int16(100*j)) == 1 & i == floor(i)
current_val = 1 - current_val;
end
end
N = size(t1);
sfft = fftshift(fft(stream1))/N(2) ;
p1 = abs(sfft);
f= -Fs/2:1/(stoptime-dt):Fs/2+1 ;
disp(size(p1));
disp(size(f));
subplot(5,1,1)
plot(f,p1);
sfft = fftshift(fft(nrz))/N(2) ;
pnrz = abs(sfft);
f= -Fs/2:1/(stoptime-dt):Fs/2+1 ;
disp(size(p1));
disp(size(f));
subplot(5,1,2)
plot(f,pnrz);
sfft = fftshift(fft(biphi_l))/N(2) ;
pbiphi_l = abs(sfft);
f= -Fs/2:1/(stoptime-dt):Fs/2+1 ;
disp(size(p1));
disp(size(f));
subplot(5,1,3)
plot(f,pbiphi_l);
sfft = fftshift(fft(rz_ami))/N(2) ;
prz_ami = abs(sfft);
f= -Fs/2:1/(stoptime-dt):Fs/2+1 ;
disp(size(p1));
disp(size(f));
subplot(5,1,4)
plot(f,prz_ami);
sfft = fftshift(fft(nrz_m))/N(2) ;
pnrz_m = abs(sfft);
f= -Fs/2:1/(stoptime-dt):Fs/2+1 ;
disp(size(p1));
disp(size(f));
subplot(5,1,5)
plot(f,pnrz_m);
figure;
[b,a] = butter(5,0.1);
z = filter(b,a,p1);
subplot(411);
plot(f,z)
title('Filtered Data for NRZ-L');
z3 = filter(b,a,pbiphi_l);
subplot(412);
plot(f,z3)
title('Filtered Data for bipolar nrz');
z1 = filter(b,a,pnrz);
subplot(413);
plot(f,z1)
title('Filtered Data for NRZ-P');
z2 = filter(b,a,prz_ami);
subplot(414);
plot(f,z2)
title('Filtered Data for prz_ami');