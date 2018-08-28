
A(:,:,1) = [192 227 38  208
            65  245 66  62
            129 140 214 237
            178 35  65  89]; 
        
A(:,:,2) = [50  90  234 97
            64  212 73  145
            157 149 193 19
            121 140 192 14]; 
        
A(:,:,3) = [135 145 41  42
            199 120 203 154
            238 3   79  67
            33  86  135 167]; 

points =   [1 1; 
            2 3;
            4 3];
        
Colours = cat(3, [192; 66; 65], [50; 73; 192], [135; 203; 135]);

output = GetRGBValuesForPoints(A, points);

for i = 1:size(output,1)
    if Colours(i,1,:) == output(i,1,:)
        fprintf('Test %d passed\n', i)
    else
        fprintf(2, 'Test %d failed\n', i)
        
    end
end


























