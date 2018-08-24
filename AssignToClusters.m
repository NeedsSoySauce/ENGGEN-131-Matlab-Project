function nearest_mean = AssignToClusters(im_array, mean_vals)
    % AssignToClusters assigns each pixel in an image to a cluster based on
    % which mean that pixel is closest to
    % Input(s):     im_array        = a 3D array containing an images RGB values
    %               mean_vals       = a 3D array containing the RGB values for
    %                                 each of 'k' means
    % Output(s):    nearest_means   = a 2D array corresponding to 'im_array' 
    %                                 representing the closest mean in 'mean_vals'                             
    % Author: Feras Albaroudi

    % Convert the input arrays to a double as uint8's are unable to store
    % negative numbers and or numbers in excess of 255 which we may
    % encounter when calculating the squared distances
    im_array = double(im_array);
    mean_vals = double(mean_vals);
    
    [im_rows, im_cols, ~] = size(im_array);
    [k_rows, ~, ~] = size(mean_vals);
    
    % Preallocate an array used to store the results of each calculation
    nearest_mean = zeros(im_rows, im_cols, k_rows);

    % Calculate the squared difference between each pixel and each of 'k'
    % means and store the results on a layer corresponding to the position of
    % that 'k' mean
    for i = 1:k_rows      
        nearest_mean(:,:,i) = (im_array(:,:,1) - mean_vals(i,1,1)).^2 + ...
                              (im_array(:,:,2) - mean_vals(i,1,2)).^2 + ...
                              (im_array(:,:,3) - mean_vals(i,1,3)).^2;
    end

    % The nearest mean for each pixel will be equal to the layer in
    % nearest_means with the lowest value at that pixel position. In the
    % case that there are two or more values that are equal, the nearest_mean 
    % will be the layer starting from 1 that the minimum value first 
    % occured on.   
    [~, nearest_mean] = min(nearest_mean, [], 3);
    
end



