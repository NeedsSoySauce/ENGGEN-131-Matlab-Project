% function which creates a k-colour image using pixels that were divided
% into k clusters.
% inputs
%   clusters = 2D array of k clusters.
%   means = 3D array of mean colour values with k clusters corresponding to
%           row numbers.
% output
%   imageArray = 3D array of uint8 integers representing an RGB image.
% author = Ahmed Al-azi

function [imageArray] = CreateKColourImage(clusters,means)
means = round(means); % uint8 must contain only integers
m = size(clusters,1); % no. of rows
n = size(clusters,2); % no. of columns
imageArray = zeros(m,n,3,'uint8');

for i=1:m
    for j=1:n
        % using cluster values as row numbers of means to obtain correct
        % colour value from means array
        imageArray(i,j,1) = means(clusters(i,j),1,1);
        imageArray(i,j,2) = means(clusters(i,j),1,2);
        imageArray(i,j,3) = means(clusters(i,j),1,3);
    end
end

end