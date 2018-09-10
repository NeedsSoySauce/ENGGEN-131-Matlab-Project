function [positions] = SelectKRandomPoints(imageRaw, points)
% Return 'points' amount of unique uniformally distributed random points
% for a given RGB image array.
% Input:    imageRaw:   3D array containing an RGB image. m rows, n
%                       columns, 3 layers (RGB)
%           points:     Number of unique points to generate
% Output:   positions:  2D array of rows and columns of randomly generated
%                       points. 'points' rows, 2 columns (row and column
%                       index)
% Author: Vincent Wong

    [rows, columns, ~] = size(imageRaw);
    
    % Return 'points' amounts of unique, uniformally distributed randomly
    % generated list of indexes for imageRaw, through the shuffling of a
    % 1:rows*columns array. Sourced from 'help randperm'.
    randPoints = randperm(rows*columns, points);
    
    % Calculate the row and column index from the list of linear indicies
    % for imageRaw. Extracted from "ind2sub".
    % Row algorithm: Take modulus between each linear index and rows,
    % then add 1 as rows count from 1.
    % Col algorithm: Take difference of current linear index and the row
    % index. Divide by number of rows to find column index. Add 1 as
    % columns count from 1.
    rowIndex = mod(randPoints-1,rows)+1;
    colIndex = (randPoints-rowIndex)/rows + 1;
    
    % Shape output array as column 1 of row indicies and column 2 of column
    % indicies
    positions = [rowIndex;colIndex]';
    
return