%% stft
function [stft, f, t] = stft(x, wlen, h, nfft, fs)
 if size(x,2) > 1
 x = x';
 end
xlen = length(x);
win = hamming(wlen, 'periodic');
rown = ceil((1+nfft)/2);
coln = 1+fix((xlen-wlen)/h);
stft = zeros(rown, coln);
indx = 0;
col = 1;
% perform STFT
while indx + wlen <= xlen
xw = x(indx+1:indx+wlen).*win;
X = fft(xw, nfft);
stft(:,col) = X(1:(rown));
indx = indx + h;
col = col + 1;
end
t = (wlen/2:h:xlen-wlen/2-1)/fs;
f = (0:rown-1)*fs/nfft;
end
% http://blog.sina.com.cn/s/blog_82a927880102uwi1.html 提供两个函数的网址
% https://www.cnblogs.com/hogli/p/5918199.html Matlab 语谱图(时频图)绘制与分析
% https://blog.csdn.net/shenziheng1/article/details/53868684 短时傅里叶分析：spectrogram函数
