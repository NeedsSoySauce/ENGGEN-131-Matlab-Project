function means = UpdateMeans(im_array, k, clusters)
    % UpdateMeans returns the mean RGB values for each of 'k' clusters
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               k           = a scalar specifying how many clusters 
    %                           = there are      
    %               clusters    = a 2D array corresponding to 'im_array' 
    %                             representing the cluster each pixel is 
    %                           = assigned to            
    % Output(s):    means       = a 3D array containing the mean RGB values
    %                             for each cluster
    % Author: Feras Albaroudi

    % Split the image into its RGB layers as we can't index into a
    % temporary array
    red = im_array(:,:,1);
    green = im_array(:,:,2);
    blue = im_array(:,:,3);
    
    % Preallocate space for 'means'
    means = zeros(k, 1, 3, 'double');
    
    % The mean RGB values for each cluster will be the mean of the red,
    % green and blue layers concatenated together
    for i = 1:k
        
        % The following logical array is likely to contain many zeros, so
        % we can conserve a large amount of memory and significantly 
        % improve performance by storing it as a sparse array.
        idx = sparse(clusters == i);

        % Calculating the mean of the red, green and blue layers and
        % assigning them directly to 'means'. This is done to avoid any
        % overhead from calling cat() or mean().
        elems = nnz(idx);
        means(i,1,1) = sum(red(idx))/elems;
        means(i,1,2) = sum(green(idx))/elems;
        means(i,1,3) = sum(blue(idx))/elems;

    end
    
end

