%% 常用函数
%% 1 将多个一维数组组合成一个一维数组；
% 1.1 当A、B为行向量时：
A=[1 2 3]; B=[4 5 6]; 
C=[A;B];
C=C(:);

% 1.2 当A、B为列向量时：  PS: Matlab 采用“列优先”

A=[1; 2; 3]; B=[4; 5; 6]; 
C=[A, B].';
C=C(:);

%1.3 for循环

for ii = 1:10 
  fprintf('value of a: %d\n', ii);
end
  fprintf('跳出循环后，value of a: %d\n', ii);
  
%1.4 如何将矩阵转化为一维数组
x=x(:)  % 从第一列开始121+121.....+121；

%1.5 如果是以行数据的方式排成一行或一列，可以将A倒置。（也许有可以直接使用的程序，目前还没有找到，暂时这样使用。）

a=[1,2,3;4,5,6;7,8,9];

b=a';

c=b(:);

c=[1;2;3;4;5;6;7;8;9];

%1.6 matrix1=zeros(4,5);%4*5的矩阵，矩阵中每个元素都为0 

% 1.7 截取一个一维数组X的前120 000个；
data = X(1:120000);


%% 将121*1000 -> 1000 + 1000+...+1000 一个121个数据首尾相接。

a = x1';
data = a(:)';
% data = data(1:120000);
hyxt(data);

imwrite(P,'P.jpg'); %保存为一个图片

%% 凯斯西储大学
data = X130_DE_time(1:120000);
hyxt(data);
%%
clear;clc;

%%  specgram
% Fs 采样率 44100
Fs=12000;
	[B, F, T, P] = spectrogram(data,1024,512,1024,Fs);   % B是F大小行T大小列的频率峰值，P是对应的能量谱密度
	%[P, F, T] = stft(data, 1024, 512, 1024, Fs);
    [x, t] = istft(B,512,1024,Fs);
    figure
	imagesc(T,F,P);
	set(gca,'YDir','normal')
	colorbar;
	xlabel('时间 t/s');
	ylabel('频率 f/Hz');
	title('短时傅里叶时频图');
%% 图像部分

x=imread('P.jpg');
subplot(2,2,1);
imshow(x); %输出彩色图像
% x = rgb2gray(x);  % 必须转换为灰度图像，进行下一步操作；
subplot(2,2,2)
imshow(x)  % 输出灰度图像
xbw=im2bw(x,0.95); %再转换为二值图像
subplot(2,2,3);
imshow(xbw);  %输出黑白二值图像

imwrite(xbw, '6666.jpg');  %save graphic
