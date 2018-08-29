function clusters = AssignToClusters(im_array, means)
    % AssignToClusters assigns each pixel in an image to a cluster based on
    % which mean that pixel is closest to
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               means       = a 3D array containing the RGB values for
    %                             each of 'k' means
    % Output(s):    clusters    = a 2D array corresponding to 'im_array' 
    %                             representing the closest mean in 'means'                             
    % Author: Feras Albaroudi

%     [im_rows, im_cols, ~] = size(im_array);
    mean_rows = size(means, 1);
    
    % Preallocate an array used to store the results of each calculation
%     clusters = zeros(im_rows, im_cols, mean_rows, 'double');

    % We'll be slicing into im_array several times without changing it, so
    % store each layer to save time
%     red = im_array(:,:,1);
%     green = im_array(:,:,2);
%     blue = im_array(:,:,3);
 
    % Calculate the squared difference between each pixel and each of 'k'
    % means and store the results on a layer corresponding to the position
    % of that 'k' mean in 'means'.
%     for i = 1:mean_rows   
%         clusters(:,:,i) = (red - means(i,1,1)).^2 + ...
%                           (green - means(i,1,2)).^2 + ...
%                           (blue - means(i,1,3)).^2;                      
%     end

    clusters =  (im_array(:,:,1) - reshape(means(1:mean_rows,1,1), [1 1 mean_rows])).^2 + ...
                (im_array(:,:,2) - reshape(means(1:mean_rows,1,2), [1 1 mean_rows])).^2 + ...
                (im_array(:,:,3) - reshape(means(1:mean_rows,1,3), [1 1 mean_rows])).^2;
            
    % The nearest mean for each pixel will be equal to the layer in
    % 'clusters' with the lowest value at that pixel's row-column index. 
    % In the case that there are two or more values that are equal, the
    % nearest mean will be the layer starting from 1 that the minimum 
    % value first occured on.
    [~, clusters] = min(clusters, [], 3);

            
end

% We want to subtract the red value of the first mean from 





























