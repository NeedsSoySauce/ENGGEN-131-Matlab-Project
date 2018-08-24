function [clusters, rgb_means] = KMeansRGB(im_array, seed_means, max_loops)
    % KMeansRGB groups the points in an image into k clusters using the
    % k-means algorithm
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               seed_means  = initial mean RGB values to initialise
    %                             k-means algorithm
    %               max_loops   = the maximum number of iterations to
    %                             perform if convergence is not reached
    % Output(s):    group       = a 2D array specifying which cluster each
    %                             pixel in im_array belongs to    
    %               rgb_means   = a 3D array containing the mean RGB values
    %                             for each cluster
    % Author: Feras Albaroudi
    
    k = length(seed_means(:,:,1));
    
    % Initial setup for k-means algorithm
    rgb_means = seed_means;
    
    for i = 1:max_loops       
        prev_rgb_means = uint8(rgb_means);
        
        % Assign pixels in im_array to clusters based on the current
        % rgb_means
        clusters = AssignToClusters(im_array, rgb_means);
        
        % Update rgb_means to reflect the current cluster(s)
        rgb_means = UpdateMeans(im_array, k, clusters);
        
        % If rgb_means is the same as prev_rgb_means we have converged       
        % The easiest way to compare the two arrays is to just convert them
        % to uint8's as that's how the image data will be formatted anyway.
        if uint8(rgb_means) == prev_rgb_means
            fprintf(2, 'converged\n')
            return
        end
        
    end
    
    % if we get here output an error message
    fprintf(2, 'did not converge\n')
    
end

