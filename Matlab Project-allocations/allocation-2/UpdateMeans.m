% function which calculates the mean values for each cluster value.
% inputs
%   imageArray = 3D image array with m rows, n rows and 3 layers.
%   k = no. of clusters.
%   clusters = 2D array with m rows and n columns, specifies position of
%   cluster to pixel.
% output
%   means = 3D array with k rows, 1 column and 3 layers, containing the
%   mean values for each cluster.
% author = Ahmed Al-azi

function [means] = UpdateMeans(imageArray,k,clusters)
means = zeros(k,1,3);
clusterSize = size(clusters);
m = clusterSize(1);
n = clusterSize(2);
redArray = [];
greenArray = [];
blueArray = [];
index = 1;

for h=1:k
    for i=1:m
        for j=1:n
            if clusters(i,j) == h
                redArray(index) = imageArray(i,j,1);
                greenArray(index) = imageArray(i,j,2);
                blueArray(index) = imageArray(i,j,3);
                % adding corresponding cluster values to pixel values into
                % arrays used to calculate the means for each respective
                % colour.
                index = index + 1;
            end
        end
    end
    means(h,1,1) = mean(redArray);
    means(h,1,2) = mean(greenArray);
    means(h,1,3) = mean(blueArray);
    redArray = [];
    greenArray = [];
    blueArray = [];
    index = 1;
end

end