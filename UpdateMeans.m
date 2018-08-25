function means = UpdateMeans(im_array, k, clusters)
    % UpdateMeans returns the mean RGB values for each of 'k' clusters
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               k           = scalar specifying how many clusters there are      
    %               clusters    = a 2D array corresponding to 'im_array' 
    %                             representing the cluster each pixel is assigned to            
    % Output(s):    means       = a 3D array containing the mean RGB values
    %                             for each cluster
    % Author: Feras Albaroudi

    % Split the image into its RGB layers as we can't index into a
    % temporary array
    red = im_array(:,:,1);
    green = im_array(:,:,2);
    blue = im_array(:,:,3);
    
    % Preallocate space for rgb_mean
    means = zeros(k, 1, 3);
    
    % We don't want to waste our time calculating the mean for clusters
    % with no points in them, so only add unique values from nearest_mean
    % to our loop variable. This also avoids a division by zero when
    % calculating the means, which would return NaN.
    
    % unique() is used as we only want to loop through clusters that have 
    % points inside of them. 
    % The mean RGB values for each cluster will be the mean of the red,
    % green and blue layers concatenated together
    for i = unique(clusters)'
        means(i,1,:) = cat(3, mean(red(clusters == i)), ...
                              mean(green(clusters == i)), ...
                              mean(blue(clusters == i)));
    end
end

