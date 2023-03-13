% this part below must be copied to your m file and complete the %
clear
clc

% reconstruction from oversampling
t=0:0.001:1;% time signal
y=2*cos(2*pi*5*t);

[B,A] = butter(3,1000/100000,'low' ); % butter fly filter
zero_added_signal=zeros(1,length(y)*10);

for i=1:length(y)
    zero_added_signal(i*10)=y(i);
end

zero_added_signal(1:9)=[];
% Adding zeros enhances the signal display and don't change the
%spectrum,it changes sampling freq. only

t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);
plot(t,filtered_signal,'r' )
% XLABEL('time')
% YLABEL('oversampled signals')


%% construction from minimum sampling
figure
t=0:0.1:1; % replace ?? with the suitable number
y=2*cos(2*pi*5*t);
[B,A] = butter(10,0.1,'low' );
zero_added_signal=zeros(1,length(y)*10);
for i=1:length(y)
zero_added_signal(i*10)=y(i);
end
zero_added_signal(1:9)=[];
t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);
plot(t,filtered_signal,'r' )
% XLABEL('time')
% YLABEL('minimum sampled signals')
s=fft(filtered_signal);
s=fftshift(s);
fs=100; % why 100?? Write your comments in the m file
freq=linspace(-fs/2,fs/2,length(s));
figure
plot(freq,abs(s))
% XLABEL('freq')
% YLABEL('magnitude of minimum sampled signals')
%% construction from undersampling sampling
figure
t=0:0.2:1;
y=2*cos(2*pi*5*t);
[B,A] = butter(10,0.2,'low' );
% complete this part as shown in the construction from minimum sampling
%and do the necessary changes , you have to do low pass filtering and %

zero_added_signal=zeros(1,length(y)*10);

for i=1:length(y)
    zero_added_signal(i*10)=y(i);
end

zero_added_signal(1:9)=[];
% Adding zeros enhances the signal display and don't change the
%spectrum,it changes sampling freq. only

t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);
plot(t,filtered_signal,'r' )

s=fft(filtered_signal);
s=fftshift(s);
fs=100; % why 100?? Write your comments in the m file
freq=linspace(-fs/2,fs/2,length(s));

figure
plot(freq,abs(s))