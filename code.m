%Bai tap lon: Da phuong tien
%Sinh vien: Dao Ngoc Khanh  MSSV:20151963
%Ghi am 
 
r= audiorecorder(44100,16,1);
disp('bat dau ghi am');
recordblocking(r,6);
disp('ket thuc');
r1 = getaudiodata(r,'int16');
audiowrite('orig_input.wav',r1,44100);
y1 = audioread('orig_input.wav');
y1=y1';
 
% Tao cac tone
%A4:440.00 Hz  ;  B4:493.88 Hz;  C5#:  554.37 Hz;  C5:523,25 D5:587.33
%Hz;   E5:659.26 Hz;  F5: 698,445 Hz G5: 783,99   A5: 880Hz    B5:987,76
fs =44100; % sampling frequency (Hz)
t = 1/fs : 1/fs : 0.4; % time axis (seconds)
Amt = 0.5;
f1 = 523.25; % frequency (Hz)
f2 = 587.33;
f3 = 659.26;
f4 = 698.44;
f5 = 783.99;
f6 = 880;
f7 = 987.76;
w = 0; % phase
 
C = Amt * sin( 2 * pi * f1 * t + w );
D = Amt * sin( 2 * pi * f2 * t + w );
E = Amt * sin( 2 * pi * f3 * t + w );
F = Amt * sin( 2 * pi * f4 * t + w );
G = Amt * sin( 2 * pi * f5 * t + w );
A = Amt * sin( 2 * pi * f6 * t + w );
B = Amt * sin( 2 * pi * f7 * t + w );
y2 = [E,F,G,G,E,F,G,G,E,F,G,G,E,A,G];
y=y1+y2;
audiowrite('melody.wav',y,fs);
%bai3
 
 
 Y = fft(y);
plot(abs(Y));
figure(1);
N =length(y);  %Do dai
transform = fft(y)/N;
magTransform = abs(transform);
faxis = linspace(-N/2,N/2,N);
figure(2);
plot(faxis,fftshift(magTransform)); 
title('FFT');
xlabel('Frequency (Hz)'); 
 
 
%bai4
figure(3);
win = 128; % window length in samples
% number of samples between overlapping windows:
hop = win/2;            
 
nfft = win; % width of each frequency bin 
spectrogram(y,win,hop,nfft,fs,'yaxis');
yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt));
title('Spectrogram');


 
 
 
 
 
 
	
