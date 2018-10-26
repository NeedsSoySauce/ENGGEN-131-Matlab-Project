function clusters = AssignToClusters(im_array, k_means)
    % AssignToClusters assigns each pixel in an image to a cluster based on
    % which mean that pixel is closest to
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               k_means     = a 3D array of k rows, 1 column and 3
    %                             layers containing the RGB values for
    %                             each of 'k' means
    % Output(s):    clusters    = a 2D array corresponding to 'im_array' 
    %                             representing the cluster each pixel is 
    %                             assigned to      
    % Author: Feras Albaroudi

    k_rows = size(k_means, 1);

    % Calculate the squared difference between each pixel and each of 'k'
    % means and store the results on a layer corresponding to the position
    % of that mean in k_means.
    
    % This is done by reshaping the RGB values for each k-mean into k
    % layers and then subtracting that from the corresponding colour
    % channel in im_array. From there we simply square each element and add
    % the RGB values from each layer together to get the squared distance.

    clusters =  (im_array(:,:,1) - reshape(k_means(1:k_rows,1,1), [1 1 k_rows])).^2 + ...
                (im_array(:,:,2) - reshape(k_means(1:k_rows,1,2), [1 1 k_rows])).^2 + ...
                (im_array(:,:,3) - reshape(k_means(1:k_rows,1,3), [1 1 k_rows])).^2;
            
    % The nearest cluster for each pixel will be equal to the layer in
    % 'clusters' with the lowest value at that pixel's row-column index. 
    % In the case that there are two or more values that are equal, the
    % nearest cluster will be the layer starting from 1 that the minimum 
    % value first occured on.
    [~, clusters] = min(clusters, [], 3);

end





























