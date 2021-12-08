clc
clear all
close all
b= randi([0,1],1,10);
l=length(b);
b(l+1)=0;
n=1;
figure;
subplot(411);
%nrz - L%
while n<=l
t=(n-1):.001:n;
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
plot(t,y)
hold on;
axis([0 l -1.5 1.5]);
n=n+1;
end
title('NRZ');
xlabel('Time');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%Manchester%%%%%%%%%%%%
l=length(b);
b(l+1)=0;
n=1;
subplot(412);
while n<=l
t=(n-1):.001:n;
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
while n<=l
t=(n-1):.001:n;
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
while n<=l
t=(n-1):.001:n;
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
plot(t,y)
hold on;
axis([0 l -1.5 1.5]);
n=n+1;
end
title('NRZ-M (Bipolar)');
xlabel('Time');
ylabel('Amplitude');