function nearest_mean = AssignToClusters(im_array, mean_vals)
    % AssignToClusters assigns each pixel in an image to a cluster based on
    % which mean that pixel is closest to
    % Input(s):     im_array        = a 3D array containing an images RGB values
    %               mean_vals       = a 3D array containing the RGB values for
    %                                 each of 'k' means
    % Output(s):    nearest_mean    = a 2D array corresponding to 'im_array' 
    %                                 representing the closest mean in 'mean_vals'                             
    % Author: Feras Albaroudi

    [rows, cols, ~] = size(im_array);
    
    % For each pixel call SquaredDistance on it for each value in mean_vals
    % and add it onto a new layer

%     for i = 1:rows
%         for j = 1:cols
%             im_array(i,j,:)
%         end
%     end
    
    min(im_array(1:end, 1:end, :))

    
end

