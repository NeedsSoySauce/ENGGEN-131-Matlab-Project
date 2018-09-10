function [coloursOutput] = GetRGBValuesForPoints(imageRaw, points)
% Returns RGB values for given points of imageRaw.
% Input:    imageRaw:   3D array containing an RGB image. m rows, n
%                       columns, 3 layers (RGB)
%           points:     2D array of row and column positions. k rows, 2
%                       columns (row, column data)
% Output:   coloursOutput:  3D array of RGB values for each point. 
%                           k rows, 1 column, 3 layers (RGB)
% Author: Vincent Wong

    % Get number of points by taking the number of rows from points.
    [numberOfPoints, ~] = size(points);
    
    % Preallocate output for performance
    coloursOutput = zeros(numberOfPoints, 1, 3);
    
    % For each point, retrieve all layers at the positions given by points
    % on the ith row of points.
    for i=1:numberOfPoints
       coloursOutput(i, 1, :) = imageRaw(points(i, 1),points(i, 2),:);
    end
    
return