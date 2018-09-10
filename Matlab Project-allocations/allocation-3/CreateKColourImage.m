function [outputImage] = CreateKColourImage(clusterIndex, meanColours)
% Create the final image by using the cluster mask to determine the mean
% colours for each pixel.
% Input:    clusterIndex:   2D array of last used cluster index. m rows, n
%                           columns
%           meanColours:    3D array with the last mean colour data. k
%                           rows, 1 columns and 3 layers (RGB).
% Output:   outputImage:    3D array containing the k image. m rows, n
%                           columns, 3 layers (RGB)
% Author: Vincent Wong
    
    [rows, columns, ~] = size(clusterIndex);
    [rowsMeans, ~, ~] = size(meanColours);
    
    % Create indexable cell array of preallocated layers of size row x
    % column.
    layers = {zeros(rows, columns, 'uint8'), ...
              zeros(rows, columns, 'uint8'), ...
              zeros(rows, columns, 'uint8')};
    
    outputImage = zeros(rows, columns, 3, 'uint8');
    
    for cluster=1:rowsMeans
        
        for layer=1:3
            % Set the RGB values of each pixel where the 
            % clusterIndex==cluster mask is true to the mean cluster RGB
            % values.
            layers{layer}(clusterIndex == cluster) = ...
                meanColours(cluster, layer);
            outputImage(:,:,layer) = layers{layer};
        end
        
    end
    
return