% function which generates a 2D clusters array based on which mean is closest to a
% point in an image.
% inputs
%   imageArray = 3D image array with m rows, n rows and 3 layers
%   means = 3D array with k no. of rows, 1 column and 3 layers
% output
%   clusters = 2D array with m rows and n columns, containing the cluster
%   number for each pixel in the image.
% author = Ahmed Al-azi

function [clusters] = AssignToClusters(imageArray,means)
imageArraySize = size(imageArray);
m = imageArraySize(1);
n = imageArraySize(2);
clusters = zeros(m,n);

meansSize = size(means);
k = meansSize(1);
meanArray = zeros(k,1);

for i=1:m
    for j=1:n
        for h=1:k
            meanArray(h) = SquaredDistance(imageArray(i,j,:),means(h,1,:));
            % using SquaredDistance function to get array with 3 means
        end
        smallestMean = min(meanArray);
        indexMean = find(meanArray==smallestMean);
        indexSizeCheck = size(indexMean);
        if indexSizeCheck(1)>1
            indexMean = indexMean(1);
        end
        % find the cluster number of the smallest mean value
        clusters(i,j) = indexMean;
    end
end

end