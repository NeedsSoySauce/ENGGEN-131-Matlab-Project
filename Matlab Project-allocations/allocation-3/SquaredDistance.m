function [distance] = SquaredDistance(point1, point2)
% Find the squared Euclidean distance between point1 and point2.
% Input:    point1: 1x3, 3x1 or 1x1x3 array of a point in space (R, G, B).
%           point2: 1x3, 3x1 or 1x1x3 array of a point in space (R, G, B).
% Output:   distance: The squared distance between point1 and point2.
% Author: Vincent Wong

    % Take sum of the squares of the differences of each value.
    distance = (point1(1)-point2(1))^2 + (point1(2)-point2(2))^2 + ...
               (point1(3)-point2(3))^2;

end