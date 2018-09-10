% This script is using the k-means algorithm to partie the points in an
% image into k clusters
% input : A = A 3D array with m row, n columns and 3 layers, containing an
% RGB image
%         seedmeans = A 3D array containing k rows, 1 column and 3 layers,
%         containing the seed mean values which will be used to initialise
%         the k-means algorithm.
%         M = The maximum number of iterations to perform.
% Output: clusters: A 2D array with m rows and n columns specifying which
%                   cluster each pixel belongs to
%         means : A 3D array containing k rows, 1 column and 3 layers,
%                 where each row contains the mean colour values for the
%                 cluster corresponding to that row number.
% Author : Northern
function [clusters, means] = KMeansRGB(A,seedmeans,M)

end