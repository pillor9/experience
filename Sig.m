Fs = 1000;%采样频率
T = 1/Fs;%采样周期
N = 1500;%信号长度
t = (0:N-1)*T;%时间轴，从t=0至1.5，步长为0.001，共N个采样点
S=0.8*sin(2*pi*60*t) +sin(2*pi*110*t)+0.7*sin(2*pi*200*t);%构建信号
figure;
plot(t(1:250),S(1:250)) ;% 绘图，横轴t、纵轴S，绘制前250个点 
xlabel('Time (s)')    % 添加横轴标签 
ylabel('Amplitude')    % 添加纵轴标签 
title('Time Domain Signal');   % 添加标题
X = S + 0.1*randn(size(t));% randn(size(t))返回一个和t有同样大小的随机数组
figure;
plot(t(1:250),X(1:250)) ;% 绘图，横轴t、纵轴S，绘制前250个点 
xlabel('Time (s)')    % 添加横轴标签 
ylabel('Amplitude')    % 添加纵轴标签 
title('Noise with Signal');   % 添加标题
Y =fft(S);        %原信号进行FFT变换
P2 =abs(Y/N);
P1 = P2(1:N/2+1);P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(N/2))/N;
figure;
plot(f,P1);
title('无噪信号频谱图');
xlabel('frequency (Hz)');
ylabel('|P1(f)|');
Y=fft(X);          %有噪信号快速傅里叶变换
P2=abs(Y/N);        %重新缩放Y
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs/N*(0:(N/2));
figure;
plot(f,P1,"LineWidth",1) ;
title("有噪信号频谱图");
xlabel("f (Hz)");
ylabel("|P1(f)|");
P1(1:90)=0;
P1(302:end) = 0; 
figure;
plot(f,P1);
title('滤波后的频谱图');
xlabel("f (HZ)");
ylabel("|P1(f)|");
Z=ifft(P1,1500);  %傅里叶逆变换
Z=real(Z);      %取实部
 
figure;
plot(t(1:250),Z(1:250));
title("滤波后时域图");
xlabel('Time (s)') ;   % 添加横轴标签 
ylabel('Amplitude') ;   % 添加纵轴标签 
