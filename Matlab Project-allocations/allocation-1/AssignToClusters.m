% This script is used to assgin every point in an image to a cluster which
% the point is closest to.
% Input : A = A 3D array with m rows, n columns and 3 layers, containing an
% RGB image
%         Means = A A 3D array containing k rows, 1 column and 3 layers
%         containing the colour information for each of k means.
% Output : A single output with m rows and n columns 2D array, that
% catains the corresponding cluster number for each pixel in the image
% Author : Northern

[clusters] = AssignToClusters(A,Means)

end