nfft = length(a);
nfft2 = 2.^nextpow2(nfft);

fy = fft(a, nfft2);
fy = fy(1:nfft2/2);


Fs = 400e3;
xfft = Fs.*(0:nfft2/2 - 1)/nfft2;

cut_off = 1.5e3/Fs/2;
order = 16;
h = fir1(order, cut_off);


con = conv(a,h);
%con = filter(a,h);
figure;plot(con)
figure;plot(a)

con_smooth = sgolayfilt(con,1,501);
figure;plot(con_smooth)


fullMatFileName = fullfile('E:\Download',  'S02_restingPre_EC')
s = load(fullMatFileName)


b = fir1(75,[0.0038 0.038]); % 0.5/128 = 0.0038; 5/128 = 0.038
%hd = dfilt.dffir(b);
freqz(b, 1, 65536, 128); % 128 là tần số lấy mẫu
c = filter(b,1,a);
subplot(2,1,1);
plot(a); 
subplot(2,1,2);
plot(c); 
axis([0 1400 4050 4300]);
