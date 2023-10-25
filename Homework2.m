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

%% Homework2_1_2
% In this task we want to make a psudo-integrate filter and use the
% function we made to filter input signal
%
% Here we declare some variables and signals
h = 0.1 * ones(1, 10);
t = 0:1:199;
x = [ones(1, 25) zeros(1, 25)];
%%%
% Here we make the input signal which its T is 50
for i = 1:3
    x = [x ones(1, 25) zeros(1, 25)];
end

%%%
% Here we make sure the length of y matches with input signal
y = myconv(x, h);
y = y(1:200);
%%%
% Here we plot signals on each other
figure('Name', 'Convolution');
stem(t, x);
xlabel('Samples');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
stem(t, y);
legend('input', 'Convolved signal');

%% Homework2_1_3
% Here we do what we did prior for another filter, with myconv function
%
% Now we declare variables and signals we wnat to use
h = [1];

for j = 1:14
    h = [h 0.75 ^ (j)];
end

h = 0.25 * h;
x = [ones(1, 25) zeros(1, 25)];
t = 0:1:199;

for i = 1:3
    x = [x ones(1, 25) zeros(1, 25)];
end

%%%
% Here we make sure the length of y matches with input signal
y = myconv(x, h);
y = y(1:200);
%%%
% Here we plot signals on each other
figure('Name', 'Convolution');
stem(t, x);
xlabel('Samples');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
stem(t, y);
legend('input', 'Convolved signal');

%% Homework2_1_4
% Here we do the same things as we did till now for another filter
%
% We declare variables and signals now
x = [ones(1, 25) zeros(1, 25)];
t = 0:1:199;

for i = 1:3
    x = [x ones(1, 25) zeros(1, 25)];
end

y = myconv([1, -1], x);

for i = 1:4
    y = myconv([1, -1], y);
end

%%%
% Here we make sure the length of y matches with input signal
y = 1/5 * y;
y = y(1:200);
%%%
% Here we plot signals on each other
figure('Name', 'Convolution');
stem(t, x);
xlabel('Samples');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
stem(t, y);
legend('input', 'Convolved signal');

%% Homework2_2
% Main purpose of this task is filtering of noisy signals
%
% In this part we want to make signals and then plot it
%
% Now first we declare signals and variables below
M = 100;
n1 = 0:1:200;
n = 0:1:100;
w = 0.54 - 0.46 * sin(2 * pi * n / M);
h = w .* (0.25 * sinc(0.25 * (n - M / 2)) - 0.15 * sinc(0.15 * (n - M / 2)));
s = sin(0.2 * pi * n1);
x = s + sin(0.05 * pi * n1) + sin(0.35 * pi * n1);
%%%
% Now we plot our signal with and without interferenced signals

figure('Name', 'signals');
stem(n1, x);
xlabel('Samples');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
stem(n1, s);
legend('three frequencies', 'one frequency');
%%%
% Homework2_2_2
%
% Here we filter signal, and plot signals on each other
t = -50:50;
y = filter(h, 1, x);
figure('Name', 'signals');
stem(n1, s);
xlabel('Samples');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
stem(n1, y);
legend('input signal', 'filtered signal');
%%%
% Homework2_2_3
%
% Here we make a filter with "filterDesigner" toolbox and then filter
% our signal with it.
%
% Here we used Eliptic filter
FD = Filter_Designer;
y1 = FD.filter(x);
%%%
% Now we plot signals on each other
figure('Name', 'signals_2');
stem(n1, s);
xlabel('Samples');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
stem(n1, y1);
legend('input signal', 'filtered signal_2');
