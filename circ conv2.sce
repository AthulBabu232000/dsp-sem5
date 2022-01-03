x = [1 2 3 4];
h = [1 -1 2 1];
x = x(:,$:-1:1);
y = [];
for i=1:length(x)
    x = [x($)x(1:$-1)];
    y(:,i) = sum(x.*h);   
end
disp(y)

