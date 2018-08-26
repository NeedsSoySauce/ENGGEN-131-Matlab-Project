function points = SelectKRandomPoints(array, k)
    % SelectKRandomPoints returns the row-column index of k unique random 
    % points from a given array
    % Input(s):     array       = a 1D, 2D or 3D array
    %               k           = how many unique random points to find
    % Output(s):    points      = a 2D array containing the subscript index of
    %                             the randomly selected elements in 'array'
    % Author: Feras Albaroudi
    
    % Generate 'k' unique random linear indexes within the range of 'array'
    indexes = randperm(numel(array(:,:,1)), k);
    
    % Convert those linear indexes to subscript indexes
    [row, col] = ind2sub(size(array(:,:,1)), indexes);
   
    % Format row and col into a single 2D array with k rows and 2 columns
    points = [row', col'];
    
end