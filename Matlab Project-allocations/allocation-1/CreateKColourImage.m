% This script is used to create a k-colour image for an image that has had
% its pixels divided into k clusters. All pixels in a given cluster will be
%  recoloured using the mean colour values for that cluster
% Input : clusters ; A 2D array with m rows and n columns, specifying which
% cluster each pixel belongs to
%         means : A 3D array containing k rows, 1 column and 3 layers,
% where each row contains the mean colour values for the cluster
% corresponding to that row number.
% Output: MyImage: a single output, A 3D array of unsigned 8 bit integers
% with m rows, n columns and 3 layers, representing an RGB image. The
% colour of each pixel in the image is determined by the colour associated
% with that cluster.
% Author : Northern

function [MyImage] = CreateKColourImage(clusters,means)

% find the size of the clusters and store them into row and col values
[row,col] = size(clusters);

% find the layers of the means
[~,~,layers] = size(means);

% set myImage as a unit8 type and create a list of zeros
MyImage = uint8(zeros(row,col,layers));
% loop through every row, col and layer
for i = 1:row
    for j = 1:col
        for m = 1:layers
            clusternum = clusters(i,j);
            % replace the zeros with the correct numbers
            MyImage(i,j,m) = means(clusternum,:,m);
        end
    end
end