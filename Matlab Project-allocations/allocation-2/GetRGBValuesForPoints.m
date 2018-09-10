% function which generates the RGB colour values for a list of points from
% an image.
% inputs
%   imageArray = 3D image array used to get RGB values from.
%   points = 2D array with k no. of rows and 2 columns used to pick which
%   colour points are extracted from the imageArray.
% output
%   Colours = 3D array with k no. of rows, 1 column and 3 layers, representing k
%   points from the imageArray.
% author = Ahmed Al-azi

function [Colours] = GetRGBValuesForPoints(imageArray,points)
sizeOfpoints= size(points);
k = sizeOfpoints(1); % no. of rows
Colours = zeros(k,1,3);

for i=1:k
    for j=1
        Colours(i,j,1) = imageArray(points(i,j),points(i,(j+1)),1);
        Colours(i,j,2) = imageArray(points(i,j),points(i,(j+1)),2);
        Colours(i,j,3) = imageArray(points(i,j),points(i,(j+1)),3);
        % uses index values of points to get values in points which are used
        % as index values for the imageArray to get the RGB values and
        % inserting them into the new Colour array.
    end
end

end