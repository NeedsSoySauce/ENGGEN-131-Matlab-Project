function [clusters, k_means] = KMeansRGB(im_array, seed_means, max_loops)
    % KMeansRGB groups the points in an image into k clusters using the
    % k-means algorithm
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               seed_means  = initial mean RGB values to initialise
    %                             the k-means algorithm
    %               max_loops   = the maximum number of iterations to
    %                             perform if convergence is not reached
    % Output(s):    clusters    = a 2D array corresponding to 'im_array' 
    %                             representing the cluster each pixel is 
    %                             assigned to  
    %               k_means     = a 3D array of k rows, 1 column and 3
    %                             layers containing the RGB values for
    %                             each of 'k' means
    % Author: Feras Albaroudi

    % Number of clusters is needed to call UpdateMeans() and is equal to 
    % how many rows there are in seed_means
    k = size(seed_means, 1);
    
    % Initial setup for k-means algorithm
    k_means = seed_means;
    
    for i = 1:max_loops       
        prev_means = k_means;
        
        % Assign pixels in im_array to clusters based on the current means
        clusters = AssignToClusters(im_array, k_means);
        
        % Update means to reflect the current cluster(s)
        k_means = UpdateMeans(im_array, k, clusters);
        
        % If means is exactly the same as prev_means we have converged.       
        if isequal(k_means, prev_means)
            return
        end        
    end
    
    % If we get here, the k-means algorithm did not converge
    fprintf(2, 'Maximum number of iterations reached before convergence was achieved\n')
    
end

