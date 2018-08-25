
% Repeat this script 100 times to average how long it takes to execute
% Ghetto, but it works! (kinda...)
for i = 1:1
    
clear
clc

filename = 'clocktower.jpg';
k = 4;
im_array = imread(filename);
im_array = double(im_array);

points = SelectKRandomPoints(im_array, k);

seed_means = GetRGBValuesForPoints(im_array, points);

% KMeansRGB does these two on its own.
% clusters = AssignToClusters(im_array, rgb_vals);
% new_means = UpdateMeans(im_array, k, clusters);

[clusters, means] = KMeansRGB(im_array, seed_means, 100);

im_data = CreateKColourImage(clusters, means);

% a = [192; 66; 65];
% b = [50; 73; 192];
% c = [135; 203; 135];
% 
% Colours = cat(3, a, b, c);
% 
% P = Colours(1,1,:); % this is the first pixel, in row 1 column 1
% Q = Colours(3,1,:);% this is the third pixel in row 3, column 1
% % find the squared distance
% d = SquaredDistance(P, Q)

end

