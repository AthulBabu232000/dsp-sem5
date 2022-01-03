clear;
clf;
clc;
nx = [1 2 3 4];
nh= [1 -1 2 1];
h = [];
h = [h,nx];
x1 = nx
for i=1:(length(nx)-1)
    x1 = [x1($)x1(1:1:$-1)];
    h = [h;x1];
end
h = h';
y = h*nh'
disp(y);

subplot(2,2,1);
a = gca()
a.x_location = "origin";
a.y_location = "origin";
xlabel("time");
ylabel("Amplitude");
title("First sequence");
plot2d3(nx);


subplot(2,2,2);
a = gca()
a.x_location = "origin";
a.y_location = "origin";
xlabel("time");
ylabel("Amplitude");
title("Second Sequence");
plot2d3(nh);


subplot(2,2,3);
a = gca()
a.x_location = "origin";
a.y_location = "origin";
xlabel("time");
ylabel("Amplitude");
title("Convolution sequence");
plot2d3(y);
