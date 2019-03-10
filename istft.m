%% Inverse Short-Time Fourier Transform  

function [x, t] = istft(stft, h, nfft, fs)
coln = size(stft, 2);
xlen = nfft + (coln-1)*h;
x = zeros(1, xlen);
win = hamming(nfft, 'periodic');
if rem(nfft, 2)
for b = 0:h:(h*(coln-1))
X = stft(:, 1 + b/h);
X = [X; conj(X(end:-1:2))];
 xprim = real(ifft(X));
 x((b+1):(b+nfft)) = x((b+1):(b+nfft)) + (xprim.*win)';
 end
 else
 for b = 0:h:(h*(coln-1))
X = stft(:, 1+b/h);
X = [X; conj(X(end-1:-1:2))];
xprim = real(ifft(X));
x((b+1):(b+nfft)) = x((b+1):(b+nfft)) + (xprim.*win)';
end
end
W0 = sum(win.^2);
x = x.*h/W0;
actxlen = length(x);
t = (0:actxlen-1)/fs;
end
% https://blog.csdn.net/shenziheng1/article/details/53868684


