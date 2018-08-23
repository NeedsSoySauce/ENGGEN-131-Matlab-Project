%clear
clc

filename = 'test.jpg';
im_array = imread(filename)
points = SelectKRandomPoints(im_array, 4);

%rgb_vals = GetRGBValuesForPoints(im_array, points)

AssignToClusters(im_array, rgb_vals)

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

