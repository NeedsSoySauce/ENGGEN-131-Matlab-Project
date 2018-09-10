function [means] = UpdateMeans(imageRaw, numberOfClusters, clusterIndex)
% Update the mean values for each cluster by taking the mean of each colour
% value inside each cluster.
% Input:    imageRaw:   3D array containing an RGB image. m rows, n
%                       columns, 3 layers (RGB)
%           numberOfClusters: The value of k. The number of colours you
%                       want to reduce imageRaw down to.
% Output:   output:     A 3D array of the mean RGB values for each cluster.
%                       numberOfClusters rows, 1 column and 3 layers (RGB).
% Author: Vincent Wong

    % Preallocate output with numberOfCluster rows, 1 column and 3 layers
    % for performance.
    means = zeros(numberOfClusters, 1, 3);
    
    % Create cell array of each colour layer in imageRaw to be able to
    % index them seperatly as 1, 2, 3.
    
    layers = {imageRaw(:,:,1), imageRaw(:,:,2), imageRaw(:,:,3)};
    
    % For each cluster, take the mean of each layer where the current
    % cluster matches the clusterIndex.
    for cluster=1:numberOfClusters
               
        for layer = 1:3
           
            means(cluster, 1, layer) = ...
                mean(layers{layer}(clusterIndex == cluster));
       
        end
       
    end
    
return