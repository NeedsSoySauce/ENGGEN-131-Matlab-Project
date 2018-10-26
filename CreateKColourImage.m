function im_array = CreateKColourImage(clusters, k_means)
    % CreateKColourImage returns a k-colour image for an image that has 
    % had its pixels divided into k clusters. All pixels in a given cluster 
    % will be recoloured using the mean colour values for that cluster.
    % Input(s):     clusters    = a 2D array corresponding to 'im_array' 
    %                             representing the cluster each pixel is 
    %                             assigned to  
    %               k_means     = a 3D array of k rows, 1 column and 3
    %                             layers containing the RGB values for
    %                             each of 'k' means
    % Output(s):    im_array    = a uint8 3D array containing 3 layers
    %                             representing an images RGB values 
    % Author: Feras Albaroudi
    
    [im_rows, im_cols, ~] = size(clusters);
    
    % Preallocate space for a 24 bit RGB image (8 bits per colour channel)
    im_array = zeros(im_rows, im_cols, 3, 'uint8');

    % Split im_array into its 3 colour layers so we can assign to each
    % individually using a logical array
    red = im_array(:,:,1);
    green = im_array(:,:,2);
    blue = im_array(:,:,3);
    
    for i = 1:size(k_means,1)      
        % The following logical array is likely to contain many zeros, so
        % we can conserve a large amount of memory and significantly 
        % improve performance by storing it as a sparse array.
        idx = sparse(clusters==i);
        
        % Assign the mean colour for each cluster to all the pixels in that
        % cluster
        red(idx) = k_means(i,1,1);
        green(idx) = k_means(i,1,2);
        blue(idx) = k_means(i,1,3);
    end

    % Recombine the colour layers
    im_array = cat(3, red, green, blue);
    
end

