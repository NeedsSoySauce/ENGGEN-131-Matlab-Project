function rgb_values = GetRGBValuesForPoints(im_array, points)
    % GetRGBValuesForPoints returns the RGB values for a list of points
    % in an image
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               points      = a 2D array of k rows and 2 columns
    %                             containing the points to retrieve the
    %                             RGB values from
    % Output(s):    rgb_values  = a 3D array containing RGB values from
    %                             im_array corresponding to the points
    %                             in pos_array
    % Author: Feras Albaroudi
    
    % Convert subscript indexes to linear indexing so we can quickly
    % extract the points we care about from each layer
    indexes = sub2ind(size(im_array(:,:,1)), points(:,1), points(:,2));
    
    % Seperate im_array into each of its 3 colours and then pull out the
    % colours at the indexes we care about
    red = im_array(:,:,1);
    green = im_array(:,:,2);
    blue = im_array(:,:,3);
    
    red = red(indexes);
    green = green(indexes);
    blue = blue(indexes);
    
    % Recombine the RGB arrays into layers
    rgb_values = cat(3, red, green, blue);
    
end