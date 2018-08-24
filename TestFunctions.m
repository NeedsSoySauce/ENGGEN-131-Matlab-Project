clear
clc

filename = 'clocktower.jpg';
k = 4;

im_array = imread(filename);

im_array = double(im_array);

points = SelectKRandomPoints(im_array, k);

rgb_vals = GetRGBValuesForPoints(im_array, points);

nearest_mean = AssignToClusters(im_array, rgb_vals);

% new_means = UpdateMeans(im_array, k, nearest_mean);

KMeansRGB(im_array, rgb_vals, 100);

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

