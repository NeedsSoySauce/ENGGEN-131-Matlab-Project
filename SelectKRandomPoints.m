function points = SelectKRandomPoints(array, k)
    % SelectKRandomPoints returns k unique random points in a given array
    % Input(s):     array       = an 1D, 2D or 3D array
    %               k           = how many random points to find
    % Output(s):    points      = a 2D array containing the subscript index of
    %                             the randomly selected elements in 'array'
    % Author: Feras Albaroudi
    
    % Generate 'K' unique random linear indexes within the range of 'array'
    indexes = randperm(numel(array(:,:,1)), k);
    
    % Convert those integers to subscript indexes
    [row, col] = ind2sub(size(array(:,:,1)), indexes);
   
    % Convert the returned row vectors to column vectors and concatenate them
    points = [row', col'];
    
end