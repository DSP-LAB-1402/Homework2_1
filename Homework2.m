%% * Homework2*
%% Programmers
%%%
% Mohammad Mahdi Elyasi - 9823007
%
% Moein Nasiri - 9823093

%% Clear the Workspace
close all;
clear all;
clc;

%% Homework2_2
h = 0.1*ones(1,10);
t = 0:1:199;
x = [ones(1,25) zeros(1,25)];
for i = 1:3
    x = [x ones(1,25) zeros(1,25)];
end
y = myconv(x,h);
y=y(1:200);

figure('Name', 'Convolution');
stem(t,x);
xlabel('Samples');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
stem(t,y);
legend('input', 'Convolved signal');
%% Homework2_3
h = [1];
for j = 1:14
    h = [h 0.75^(j)];
end
h = 0.25*h;
x = [ones(1,25) zeros(1,25)];
t = 0:1:199;
for i = 1:3
    x = [x ones(1,25) zeros(1,25)];
end
y = myconv(x,h);
y=y(1:200);

figure('Name', 'Convolution');
stem(t,x);
xlabel('Samples');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
stem(t,y);
legend('input', 'Convolved signal');
%% Homework2_4
x = [ones(1,25) zeros(1,25)];
t = 0:1:199;
for i = 1:3
    x = [x ones(1,25) zeros(1,25)];
end
y = myconv([1,-1],x);
for i = 1:4
    y = myconv([1,-1],y);
end
y = 1/5*y;
y=y(1:200);
figure('Name', 'Convolution');
stem(t,x);
xlabel('Samples');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
stem(t,y);
legend('input', 'Convolved signal');
