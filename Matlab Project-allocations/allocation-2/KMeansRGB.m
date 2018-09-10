% function which recolours an image using the mean colour values for a
% cluster.
% inputs
%   imageArray = 3D image array with m rows, n rows and 3 layers.
%   seedMeans = 3D array with k rows, 1 column and 3 layers, containing
%   the seed mean values that are used to initialise the kmeans algorithm.
%   maxIterations = maximum no. of iterations to perform.
% outputs
%   clusters = 2D array with m rows and n columns.
%   seedMeans1 = 3D array with k rows, 1 column and 3 layers. Each row
%   contains mean colour value for the cluster which corresponds to that
%   row number.
% author = Ahmed Al-azi

function [clusters,seedMeans1] = KMeansRGB(imageArray,seedMeans,maxIterations)
meanSize = size(seedMeans);
k = meanSize(1);
count = 0;

for i=1:maxIterations
    clusters = AssignToClusters(imageArray,seedMeans);
    seedMeans1 = seedMeans;
    seedMeans = UpdateMeans(imageArray,k,clusters);
    count = count + 1;
    if seedMeans == seedMeans1
        break
    end
end
if count == maxIterations
    disp('Maximum number of iterations reached before convergence was achieved')
end

end