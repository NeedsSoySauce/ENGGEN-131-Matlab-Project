% function which calculates the square of the distance between two points
% in 3D space.
% inputs
%   P = array containing three elements representing a point in 3D space.
%   Q = array containing three elements representing another point in 3D 
%       space.
% output
%   D = single squared value
% author = Ahmed Al-azi

function [D] = SquaredDistance(P,Q)
P = double(P);
Q = double(Q);
% calculates square by taking first, second and third point of each point
% and returning a single value.
D = (P(1)-Q(1))^2 + (P(2)-Q(2))^2 + (P(3)-Q(3))^2;

end