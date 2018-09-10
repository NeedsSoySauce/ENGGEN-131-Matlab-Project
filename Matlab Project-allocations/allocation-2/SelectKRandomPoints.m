% function which generates a list of k randomly selected pixels from an
% image.
% inputs
%   imageArray = 3D image array used to select points from.
%   k = no. of points to randomly select.
% output
%   points = 2D array with k no. of rows and 2 columns, representing k no.
%   of randomly selected points/pixels.
% author = Ahmed Al-azi

function [points] = SelectKRandomPoints(imageArray,k)
points = zeros(k,2);
sizeImage = size(imageArray);

for i=1:k
    randomIndex = round(rand*sizeImage(1:2));
    while ismember(randomIndex,points,'rows') %check if points are already in array, fix if they are
        randomIndex = round(rand*sizeImage(1:2));
    end
    for j=1:2
        points(i,j) = randomIndex(j);
    end
end

end