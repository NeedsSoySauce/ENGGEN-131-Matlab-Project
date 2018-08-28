function clusters = AssignToClustersAlt(im_array, means)
    % AssignToClusters assigns each pixel in an image to a cluster based on
    % which mean that pixel is closest to
    % Input(s):     im_array    = a 3D array containing 3 layers
    %               means       = a 3D array containing the RGB values for
    %                             each of 'k' means
    % Output(s):    clusters    = a 2D array corresponding to 'im_array' 
    %                             representing the closest mean in 'means'                             
    % Author: Feras Albaroudi
    
    im_array = double(im_array);
    means = double(means);
    
    % Split im_array into its layers  
    x = im_array(:,:,1);
    y = im_array(:,:,2);
    z = im_array(:,:,3);
    
    % All the layers must have the same number of elements by nature
    elems = numel(x);
    
    % Reshape x, y and z into column vectors
    
    x = reshape(x, [elems, 1]);
    y = reshape(y, [elems, 1]);
    z = reshape(z, [elems, 1]);
    
    tri = delaunayTriangulation(means(:,:,1), means(:,:,2), means(:,:,3));
    
    % Find the ne
    nearest = nearestNeighbor(tri,x,y,z);
    
    % Find the coords of the nearest neighber to each pixel in im_array
    coords = tri.Points(nearest,:);
    
    % Convert the z, y, z coords into 3 layers and then find the lowest
    % match in means to get their cluster number
    coords = cat(3, coords(:,1), coords(:,2), coords(:,3));
    
    
    % Find the first match in means where coords(i,1,:) is equal
    for i = 1:size(coords,1)
        clusterz(i) = find(means(:,1,:)==coords(i,1,:),1);
    end

    [rows, cols, ~] = size(im_array);
    
    clusters = reshape(clusterz, [rows, cols]);
    
end



