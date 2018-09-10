function squaredDistance = SquaredDistance(P,Q)
% This script is used to calculate the squared distance between two points
% in the 3D space.
% Input:  P = an array containing three elements representing a point in 3D
% space
%         Q = another array containing three elements representing a
% different point in 3D space
% Output : squaredDistance = the square of the distance between the two
% points (P & Q) in the 3D space(A single output).
% Author : Northern

% Assign P1 to be the first element in the first array.
P1 = P(1);
% Assign P2 to be the second element in the first array.
P2 = P(2);
% Assign P3 to be the third element in the first array.
P3 = P(3);


% Assign Q1 to be the first element in the second array.
Q1 = Q(1);
% Assign Q2 to be the second element in the second array.
Q2 = Q(2);
% Assign Q3 to be the third element in the second array.
Q3 = Q(3);

% Calculate the squared distance between two 3D space points
squaredDistance = (P1 - Q1).^2 + (P2 - Q2).^2 + (P3 - Q3).^2;

end