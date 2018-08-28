% Determines the average time to run  by averaging the
% results of several runs

clear;
clc;

iterations = 10;

times = zeros(iterations,1);

pic = imread('clocktower.jpg');

k = 10;
max_its = 200;

pic=double(pic);

points = [127,270;132,449;150,484;184,491;70,347;84,344;201,35;74,115;193,433;100,400];
profile on;
for i = 1:iterations

    
    tic
    clusts = GetRGBValuesForPoints(pic, points);

    [assign, clusts] = KMeansRGB(pic, clusts, max_its);

    k_pic = CreateKColourImage(assign, clusts);
    toc
    
    times(i) = toc;
end
profile off;
profile viewer;

disp(['Average time is ' num2str(mean(times)) ' seconds.'])