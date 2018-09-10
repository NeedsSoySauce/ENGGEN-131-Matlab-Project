% Test script
% There IS a lot of repeated code here, but this is because I want to keep
% things seperated as I often drop in a line or two somewhere for debugging.

close all
clear
clc

% Should we keep using the current seed means or generate a new one?
static = false;

% Should we keep running until a NaN seed mean is encountered?
% Note: If true, this will ignore static
force_nan = false;

% Do you want to save seed_means?
save_seed = false;

% Do you want to display the converted image?
show_image = true;

% What datatype do you want to use? (optional)
typename = 'double';

% k-means algorithm paramaters
filename = 'clocktower.jpg';
k = 10;
max_loops = 200;

% ----------------------------------------------------------------------- %

if static
    clearvars -except seed_means points filename k max_loops static force_nan save_seed show_image typename
else
    clearvars -except filename k max_loops static force_nan save_seed show_image typename
end

% Image loading and conversion
im_array = imread(filename);
im_array = double(im_array);

profile on

% This is used instead when force_nan is true
if force_nan
    points = SelectKRandomPoints(im_array, k);
    seed_means = GetRGBValuesForPoints(im_array, points);
    [clusters, means] = KMeansRGB(im_array, seed_means, max_loops, typename);
    while ~any(isnan(means))
        points = SelectKRandomPoints(im_array, k);
        seed_means = GetRGBValuesForPoints(im_array, points);
        [clusters, means] = KMeansRGB(im_array, seed_means, max_loops, typename);
        means
    end   
    im_data = CreateKColourImage(clusters, means); 
else
    
    % Selecting intial seed_mean points
    if static
        points;
    else
        points = SelectKRandomPoints(im_array, k);
    end

    % Getting the RGB values for the initial seed mean points
    if static
        seed_means;
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

profile off

% Displaying the image
if show_image
    figure;
    subplot(1,2,1)
    imshow(uint8(im_array))
    title('Original image')
    subplot(1,2,2)
    imshow(im_data)
    title([num2str(k) ' colour image']) 
end

if save_seed
    save seed_means seed_means
end

% 2.6 w/o tri


