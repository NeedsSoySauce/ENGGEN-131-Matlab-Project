function [clusters, means] = KMeansRGB(im_array, seed_means, max_loops)
    % KMeansRGB groups the points in an image into k clusters using the
    % k-means algorithm
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               seed_means  = initial mean RGB values to initialise
    %                             the k-means algorithm
    %               max_loops   = the maximum number of iterations to
    %                             perform if convergence is not reached
    % Output(s):    clusters    = a 2D array specifying which cluster each
    %                             pixel in im_array belongs to    
    %               means       = a 3D array containing the mean RGB values
    %                             for each cluster
    % Author: Feras Albaroudi

    % We don't need the additional precision of a double, so conserve
    % memory and speed up vectorized operations by converting to a single
    im_array = single(im_array);
    seed_means = single(seed_means);
    
    % Number of clusters is needed to call UpdateMeans() and is equal to 
    % how many rows there are in seed_means
    k = size(seed_means, 1);
    
    % Initial setup for k-means algorithm
    means = seed_means;
    
    for i = 1:max_loops       
        prev_means = means;
        
        % Assign pixels in im_array to clusters based on the current means
        clusters = AssignToClusters(im_array, means);
        
        % Update means to reflect the current cluster(s)
        means = UpdateMeans(im_array, k, clusters);
        
        % If means is exactly the same as prev_means we have converged.       
        if means==prev_means
            return
        end        
    end
    
    % If we get here, the k-means algorithm did not converge
    fprintf(2, 'Maximum number of iterations reached before convergence was achieved\n')
    
end

