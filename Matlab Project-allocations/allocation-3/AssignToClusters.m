function [clusterIndex] = AssignToClusters(imageRaw, means)
% Assigns a cluster to each pixel of the raw image by taking the mean which
% is the lowest distance away from each pixel.
% Input:    imageRaw:    3D array containing an RGB image. m rows, n
%                        columns, 3 layers (RGB)
%           means:       3D array of means. k rows, 1 column, 3 layers
%                        (RGB)
% Output:   clusterIndex: 2D array with same size as 1 layer of image Raw.
%                        Array contains corresponding cluster number for
%                        each pixel in the image.
% Author: Vincent Wong

    % Find size of each input to use for processing
    [rows, columns, ~] = size(imageRaw);
    [rowsMeans, ~, ~] = size(means);
    
    % Preallocate the distance storage with k layers - to store distance to
    % each mean from each pixel.
    store = zeros(rows, columns, rowsMeans);
    
    for cluster=1:rowsMeans
        
        % Extend means to each m rows and n columns to use for element wise
        % processing
        meanArray = repmat(means(cluster, 1, :), [rows,columns,1]);
        % Find relative Euclidean distance from each pixel to each mean
        colours = sum((imageRaw - meanArray).^2,3);
        
        % Store distance as the kth layer inside the distance store
        store(:,:,cluster) = colours;
        
    end
    
    % Return the minimum index working in the 3rd dimension (compare layers
    % of each pixel)
    [~, clusterIndex] = min(store, [], 3);

end