% Fs = 2e4;
% tau = 1/Fs;%pulse duration
% L = 1000;
% t = (0:L-1)*tau;
% 
% T = 4*tau; %interpulse duration
% 
% tp = zeros(L);
% 
% tp(1:5:end) = 1;
% 
% plot(t,tp,'r');
% xlim([0,50*tau]);

% f=10; %frequency of the impulse in Hz
% fs=f*10; % sample frequency is 10 times higher
% t=0:1/fs:1; % time vector
% y=zeros(size(t));
% y(1:fs/f:end)=1;
% plot(t,y);