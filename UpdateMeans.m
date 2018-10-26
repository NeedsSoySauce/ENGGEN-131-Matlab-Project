function k_means = UpdateMeans(im_array, k, clusters)
    % UpdateMeans returns the mean RGB values for each of 'k' clusters
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               k           = a scalar specifying how many clusters 
    %                           = there are      
    %               clusters    = a 2D array corresponding to 'im_array' 
    %                             representing the cluster each pixel is 
    %                           = assigned to            
    % Output(s):    k_means     = a 3D array of k rows, 1 column and 3
    %                             layers containing the RGB values for
    %                             each of 'k' means
    % Author: Feras Albaroudi

    % Split the image into its RGB layers as we can't index into a
    % temporary array
    red = im_array(:,:,1);
    green = im_array(:,:,2);
    blue = im_array(:,:,3);

    % Preallocate space for k_means
    k_means = zeros(k, 1, 3);
    
    % The mean RGB values for each cluster will be the mean of the red,
    % green and blue layers concatenated together
    for i = 1:k
        
        % The following logical array is likely to contain many zeros, so
        % we can conserve a large amount of memory and significantly 
        % improve performance by storing it as a sparse array.        
        % For small images and or low k-values this may consume slightly
        % more memory, but performance isn't as much of a concern there.
        idx = sparse(clusters == i);

        % Calculating the mean of the red, green and blue layers and
        % assigning them directly to 'k_means'. This is done to avoid any
        % overhead from calling cat() or mean().
        elems = nnz(idx);
        k_means(i,1,1) = sum(red(idx))/elems;
        k_means(i,1,2) = sum(green(idx))/elems;
        k_means(i,1,3) = sum(blue(idx))/elems;
    end
end





















