close all
clear;
clc;

pic = imread('clocktower.jpg');
k = 10;
max_its = 200;

% figure;
% imshow(pic);

pic=double(pic);

points = [127,270;132,449;150,484;184,491;70,347;84,344;201,35;74,115;193,433;100,400];

profile on;

clusts = GetRGBValuesForPoints(pic, points);

[assign, clusts] = KMeansRGB(pic, clusts, max_its);

k_pic = CreateKColourImage(assign, clusts);

profile off;

% figure;
% imshow(k_pic);

profile viewer;