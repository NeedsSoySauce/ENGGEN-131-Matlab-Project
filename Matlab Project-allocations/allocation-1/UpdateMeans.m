% This script is used to calculate the mean values for each cluster
% Input : A = A 3D array with m row, n columns and 3 layers, containing an RGB
%         image
%         k = A single value, k, specifying how many clusters there are.
%         clusters= A 2D array with m rows and n columns specifying which cluster
%         each pixel belongs to
% Output : A single output, a 3D array containing k rows, 1 column and 3
%          layers, containing the mean values for each cluster.
% Author : Northern

[means] = UpdateMeans(A,k,clusters)

end

