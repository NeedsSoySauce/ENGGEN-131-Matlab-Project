% This script is used to randomly select a list of k pixels from the
% picture.
% Inputs: A : Selected points from a 3D Array.
%         k : Number of points that is randomly selected
% Output: Points: a single output contains k rows and two columns,
% representing k numbers of randomly selected points
% Author : Northern

function [Points] = SelectKRandomPoints(A,k)

% find the total rows and cols of the image
[rows,cols,~] = size(A);
i = 1;
% Set the points k rows 2 cols full of zeros
Points = zeros(k,2);
count = 0;

% loop through all the k points and return k number of points
while i < k*100
    if i == 1
        % store the first point
        Points(i, 1:2) = [randi(rows), randi(cols)];
        m = 1;
    else
        % store the next(second) points to Points1
        Points1 = [randi(rows), randi(cols)];
        
        for j = 1:m
            % check if the points are the same
            if Points1(1)==Points(j,1) && Points1(2)==Points(j,2)
                count = 1;
            end
        end
        
        % store the random point in Points array if the point is unique
        if count == 0
            m = m+1;
            Points(m, 1:2) = Points1;
        end
    end
    
    i = i+1;
    count = 0;
    
    % break out the while loop when k rows of random points are generated
    if m == k
        break;
    end
    
end
