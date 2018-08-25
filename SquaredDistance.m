function sq_dist = SquaredDistance(P, Q)
    % SquaredDistance returns the distance between two points in 3D space
    % Input(s):     P, Q    = an array with 3 elements representing a point
    %                         in 3D space                     
    % Output(s):    sq_dist = square of the distance between points P & Q
    % Author: Feras Albaroudi
    
    % Just applying the equation from the project pdf.
    % D = (P1 - Q1)^2 + (P2 - Q2)^2 + (P3 - Q3)^2

    sq_dist = (P(1) - Q(1))^2 + (P(2) - Q(2))^2 + (P(3) - Q(3))^2;

end