% This script tests SelectKRandomPoints() with known values to confirm
% it is functioning as expected

clear
clc

% a = zeros(2,2,3);

data = imread('Peter.jpg');

% a = SelectKRandomPoints(data,4)


func = @() SelectKRandomPoints(data,16);

a = zeros(1000,1,1);

for i = 1:1000
    a(i) = timeit(func);
end

mean(a)

% 1.1690e-05
% 1.7736e-05























