%% *myconv function*

function [result] = myconv(h, x)
size_x = length(x);
size_h = length(h);
x1 = [x zeros(1,size_h -1)];
h1 = [zeros(1,size_x -1) fliplr(h)];
result = zeros(1,length(h)+length(x)-1);
    for i = 1:size_x+size_h-1
        result(i) = circshift(h1,i)*x1';
    end
end
