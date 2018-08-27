% Test script
% There IS a lot of repeated code here, but this is because I want to keep
% things seperated as I often drop in a line or two somewhere for debugging.

close all
clc

% Should we keep using the current seed means or generate a new one?
static = false;

% Should we keep running until a NaN seed mean is encountered?
% Note: If true, this will ignore static
force_nan = true;

% Do you want to save seed_means?
save_seed = false;

% k-means algorithm paramaters
filename = 'clocktower.jpg';
k = 4;
max_loops = 100;

% ----------------------------------------------------------------------- %

if static
    clearvars -except seed_means points filename k max_loops static force_nan save_seed
else
    clearvars -except filename k max_loops static force_nan save_seed
end

% Image loading and conversion
im_array = imread(filename);
im_array = double(im_array);

% This is used instead when force_nan is true
if force_nan
    points = SelectKRandomPoints(im_array, k);
    seed_means = GetRGBValuesForPoints(im_array, points);
    [clusters, means] = KMeansRGB(im_array, seed_means, max_loops);
    while ~any(isnan(means))
        points = SelectKRandomPoints(im_array, k);
        seed_means = GetRGBValuesForPoints(im_array, points);
        [clusters, means] = KMeansRGB(im_array, seed_means, max_loops);
        means
    end   
    im_data = CreateKColourImage(clusters, means); 
else
    
    % Selecting intial seed_mean points
    if static
        points;  
    else
        %     points = [1 1; 1 2; 1 3; 1 4; 1 5] % Test with 'peter.jpg'
        points = SelectKRandomPoints(im_array, k);
    end

    % Getting the RGB values for the initial seed mean points
    if static
        seed_means
    else
        seed_means = GetRGBValuesForPoints(im_array, points);
    end

    % KMeansRGB does these two on its own.
    % clusters = AssignToClusters(im_array, seed_means)
    % new_means = UpdateMeans(im_array, k, clusters);

    % k-means algorithm
    [clusters, means] = KMeansRGB(im_array, seed_means, max_loops);

    % Generating the k-colour image
    im_data = CreateKColourImage(clusters, means);

end

% Displaying the image
subplot(1,2,1)
imshow(uint8(im_array))
subplot(1,2,2)
imshow(im_data)
 
if save_seed
    save seed_means seed_means
end




