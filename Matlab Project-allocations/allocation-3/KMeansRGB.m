function [clusterIndex, meanColours] = KMeansRGB(imageRaw, seed, maxIterations)
% Run k image algorithm by cycling AssignToClusters and UpdateMeans until
% convergence is achieved.
% Input:    imageRaw:   3D array containing an RGB image. m rows, n
%                       columns, 3 layers (RGB)
%           seed:       3D array containing the randomly generated seed
%                       means. k rows, 1 column, 3 layers (RGB).
%           maxIterations:  The maximum number of iterations to run before
%                           it is assumed that convergence was not
%                           achieved.
% Output:   clusterIndex:   2D array of last used cluster index. m rows, n
%                           columns
%           meanColours:    3D array with the last mean colour data. k
%                           rows, 1 columns and 3 layers (RGB).
% Author: Vincent Wong

    % Get initial cluster index with seed means
    clusterIndex = AssignToClusters(imageRaw, seed);
    
    % Get k, number of colours as r
    [r, ~, ~] = size(seed);
    
    previousMean = zeros(1, 3);
    meanColours = seed;
    iterations = 0;
    
    % While either max iterations has not been reached or the updated mean
    % is not equal to the previous mean, then update the means and assign
    % new clusters with the new means until convergence is achieved.
    
    while ~isequal(meanColours, previousMean) && iterations < maxIterations
        previousMean = meanColours;
        meanColours = UpdateMeans(imageRaw, r, clusterIndex);
        iterations = iterations + 1;
        
        % If the new updated means are equal to the previous means,
        % (convergence has been achieved), or the maximum iterations has
        % been achieved, then exit the while loop and skip the next cluster
        % assignment.
        if (previousMean == meanColours)
            break 
        elseif iterations == maxIterations
            break
        end
        clusterIndex = AssignToClusters(imageRaw, meanColours);
    end
    
    % If convergence was not achieved before the max iterations, then
    % display a message - function will means of the last iteration.
    
    if (iterations == maxIterations)
        disp(['Maximum number of iterations reached before ' ... 
              'convergence was achieved']);
    end

return