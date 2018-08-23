function points = SelectKRandomPoints(array, K)
    % SelectKRandomPoints finds K unique random points an a given array
    % Input(s):     array       = a 3D array 
    %               K           = how many random points to find
    % Output(s):    points      = a 2D array containing the subscript index of
    %                             the randomly selected elements in 'array'
    % Author: Feras Albaroudi
    
    % Generate 'K' unique random linear indexes within the range of 'array'
    indexes = randperm(numel(array(:,:,1)), K);
    
    % Convert those integers to subscript indexes
    [row, col] = ind2sub(size(array(:,:,1)), indexes);
   
    % Transpose the returned row and column indexes and concatenate them
    points = [row', col'];
    
end