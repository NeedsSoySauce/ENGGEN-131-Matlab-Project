function rgb_means = UpdateMeans(im_array, k, nearest_mean)
    % UpdateMeans returns the RGB values for a cluster of points from a
    % given image
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               k           = single value specifying how many clusters
    %                             there are
    % Output(s):    rgb_means   = a 3D array containing the mean RGB values
    %                             for each cluster
    % Author: Feras Albaroudi

    % Split the image into its RGB layers as we can't index into a
    % temporary array
    red = im_array(:,:,1);
    green = im_array(:,:,2);
    blue = im_array(:,:,3);
    
    % Preallocate space for rgb_mean
    rgb_means = zeros(k, 1, 3);
    
    % We don't want to waste our time calculating the mean for clusters
    % with no points in them, so only add unique values from nearest_mean
    % to our loop variable. 
    % vals has to be transposed as we need a row vector in order to loop
    % through it with 'for' 
    
    vals = unique(nearest_mean)';
    
    % The mean RGB values for each cluster will be the mean of the red,
    % green and blue layers concatenated together
    for i = vals
        rgb_means(i, 1, 1:3) = cat(3, mean(red(nearest_mean == i)), ...
                                      mean(green(nearest_mean == i)), ...
                                      mean(blue(nearest_mean == i)));
    end
end

