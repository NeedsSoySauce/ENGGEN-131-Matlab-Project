function im_array = CreateKColourImage(clusters, means)
    % CreateKColourImage returns a k-colour image for an image that has 
    % had its pixels divided into k clusters. All pixels in a given cluster 
    % will be recoloured using the mean colour values for that cluster.
    % Input(s):     clusters    = a 2D array specifying which cluster each
    %                             pixel in im_array belongs to  
    %               means       = a 3D array containing the mean RGB values
    %                             for each cluster
    % Output(s):    im_array    = a uint8 3D array containing 3 layers
    %                             representing an images RGB values 
    % Author: Feras Albaroudi

    [im_rows, im_cols, ~] = size(clusters);
    
    % Preallocate space for an 8 bit image
    im_array = zeros(im_rows, im_cols, 3, 'uint8');

    % Split im_array into its 3 colour layers so we can assign to each
    % individually using a logical array
    red = im_array(:,:,1);
    green = im_array(:,:,2);
    blue = im_array(:,:,3);
    
    % We only need to loop through the unique values in 'clusters' as these
    % represent the means that will be assigned to im_array
    for i = unique(clusters)'
        red(clusters==i) = means(i,1,1);
        green(clusters==i) = means(i,1,2);
        blue(clusters==i) = means(i,1,3);
    end

    % Recombine the colour layers
    im_array = cat(3, red, green, blue);
end

