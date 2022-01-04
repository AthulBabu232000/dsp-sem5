clc;
clear;
x = [1,2,-1,2,3,-2,-3,-1,1,1,2,-1];
h = [1,2,3,-1];
disp(conv(x,h));
len_h = length(h);
block_no = length(x)/length(h);
start = len_h + 1;
first_block = [zeros(1,len_h-1),x(1:len_h)];
y = [];
y(1,:)=first_block;
for i = 2:block_no
    stop = start + len_h - 1;
    y(i,:) = [y(i-1,$-2:$),x(start:stop)];
    start = start+len_h;
end

i=i+1;
y(i,:) = [y(i-1,$-2:$),zeros(1:length(first_block)-length(y(i-1,$-2:$)))];
h = [h,zeros(1,len_h - 1)];
disp(y);
disp(h);
block_count = length(y)/length(h);
disp(block_count);
sub_answer = [];
answer = [];
for k = 1:block_count
    a=fft(y(k,:));
    b=fft(h);
    c=a.*b;
    d=round(ifft(c));
    disp(d);
    sub_answer(k,:) = d(len_h:$);
    answer = [answer sub_answer(k,:)];
end
disp(answer);
