clear;
clf;
clc;
x = [1 2 3 4];
h = [1 -1 2 1];
Nx = length(x);
Nh = length(h);
N = max(Nx,Nh);
newX = [x,zeros(1,N-Nx)];
newH = [h,zeros(1,N-Nh)];
x1 = fft(newX);
h1 = fft(newH);
Y = x1.*h1;
y = ifft(Y);
disp(y);


subplot(2,2,1);
a = gca()
a.x_location = "origin";
a.y_location = "origin";
xlabel("time");
ylabel("Amplitude");
title("First sequence");
plot2d3(x);


subplot(2,2,2);
a = gca()
a.x_location = "origin";
a.y_location = "origin";
xlabel("time");
ylabel("Amplitude");
title("Second Sequence");
plot2d3(h);


subplot(2,2,3);
a = gca()
a.x_location = "origin";
a.y_location = "origin";
xlabel("time");
ylabel("Amplitude");
title("Convolution sequence");
plot2d3(y);
