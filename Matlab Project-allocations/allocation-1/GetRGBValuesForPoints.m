% This script is used to return the RGB colour values for a list of
% specified points from an image
% Inputs:  A = A 3D image array to be used for selecting RGB colour valuse
%          P = A 2D array of k rows and 2 cols identifying which point to
%          extract values for
% Outputs: A single 3D array containing k rows, 1 column and 3 layers
%          which representing a list of k points from the image
% Author : Northern

function Colours = GetRGBValuesForPoints(A,P)

% find how many layers are in a 3D image array
[~,~,layers] = size(A);
% find how many rows are in P array
[rowsP,~] = size(P);

% set p rows 1 column and A layers full of zeros
Colours = zeros(rowsP,1,layers);

% loop through all the rows and layers
for i = 1:rowsP
    for j = 1:layers
        % store every points to k rows, 1 col and j layers
        Colours(i,1,j) = A(P(i,1),P(i,2),j);
    end
end


