% This script runs a few simple tests on all the functions for the
% Matlab Project and verifies if they are functioning as expected.
% The tests have been written in a way that it should be easy to see what
% they're doing.

% Passing all the tests for a function does NOT guarantee that function
% will work correctly in all cases.

close all;
clear all;
clc;

image_data(:,:,1) = [192 192 192 192
                     192 192 66  66
                     66  66  66  66
                     65  65  65  65]; 
        
image_data(:,:,2) = [50  50  50  50
                     50  50  73  73
                     73  73  73  73
                     192 192 192 192]; 
        
image_data(:,:,3) = [135 135 135 135
                     135 135 203 203
                     203 203 203 203
                     135 135 135 135]; 

% Uncomment the following two lines to see what this image looks like
% image(uint8(image_data))
% axis equal
                 
points = [1 1; 
          2 3;
          4 3];

seed_means = cat(3, [192; 66; 65; 192], [50; 73; 192; 50], [135; 203; 135; 135]);

clusters = [1 1 1 1;
            1 1 2 2;
            2 2 2 2;
            3 3 3 3];

% Defining a new image and seed means as the previous ones will not converge
% These are used to test KMeansRGB and CreateKColourImage

image_data2 = cat(3, [63:64:255; 0 0 0 0; 0 0 0 0], ...
                     [0 0 0 0; 63:64:255; 0 0 0 0], ...
                     [0 0 0 0; 0 0 0 0; 63:64:255]);
                 
% Uncomment the following two lines to see what this image looks like
% image(uint8(image_data2))
% axis equal
                        
seed_means2 = cat(3, [191; 0; 0], [0; 255; 0], [0; 0; 127]);

clusters2 = [1 1 1 1;
             2 2 2 2;
             3 3 3 3];
        
 final_means = cat(3, [159; 0; 0], [0; 159; 0], [0; 0; 159]);
         
% ------------------------------------------> Test for SelectKRandomPoints
expected = [1 1; 1 2; 1 3; 1 4; 
            2 1; 2 2; 2 3; 2 4;
            3 1; 3 2; 3 3; 3 4;
            4 1; 4 2; 4 3; 4 4;];
                         
output = SelectKRandomPoints(image_data, 7);
[rows, cols, layers] = size(output);

disp('---> SelectKRandomPoints <---')

% Verifying the dimensions of the output.
% There should be k rows, 2 columns and 1 layer
if isequal([rows, cols, layers], [7 2 1])
    fprintf('Test 1 passed - correct output dimensions\n')
else
    fprintf(2, 'Test 1 failed - incorrect output dimensions\n')
end 

% Checking that the returned points are all within range of the image
if all(any(output(:) == [1 2 3 4], 2))
    fprintf('Test 2 passed - all points within range\n')
else
    fprintf(2, 'Test 2 failed - some or all points out of range\n')
end

% Checking that the returned points are all unique
if size(unique(output, 'rows'), 1) == 7
    fprintf('Test 3 passed - all points are unique\n')
else
    fprintf(2, 'Test 3 failed - some or all points are duplicates\n')    
end

output = SelectKRandomPoints(image_data, 16);

if isequal(sortrows(output), expected)
    fprintf('Test 4 passed - all possible points returned\n')
else
    fprintf(2, 'Test 4 failed - not all possible points returned\n')
end

% ----------------------------------------> Test for GetRGBValuesForPoints

expected = cat(3, [192; 66; 65], [50; 73; 192], [135; 203; 135]);
output = GetRGBValuesForPoints(image_data, points);
[rows, cols, layers] = size(output);

disp('---> GetRGBValuesForPoints <---')

% Verifying the dimensions of the output.
% There should be k rows, 1 column and 3 layers
if isequal([rows, cols, layers], [3 1 3])
    fprintf('Test 1 passed - correct output dimensions\n')
else
    fprintf(2, 'Test 1 failed - incorrect output dimensions\n')
end 

% Checking that the returned RGB values are correct
if isequal(output, expected)
    fprintf('Test 2 passed - correct RGB values\n')
else
    fprintf(2, 'Test 2 failed - incorrect RGB value(s)\n')       
end

% ----------------------------------------------> Test for SquaredDistance

expected = 25;
P = [0; 0; 0];
Q = [3; 4; 0];
output = SquaredDistance(P,Q);
[rows, cols, layers] = size(output);

disp('---> GetRGBValuesForPoints <---')

% Verifying the dimensions of the output.
% There should be k rows, 1 column and 3 layers
if isequal([rows, cols, layers], [1 1 1])
    fprintf('Test 1 passed - correct output dimensions\n')
else
    fprintf(2, 'Test 1 failed - incorrect output dimensions\n')
end 

% Checking 3x1x1 arrays
if isequal(output, expected)
    fprintf('Test 2 passed - correct output for 3x1x1 inputs\n')
else
    fprintf(2, 'Test 2 failed - incorrect output for 3x1x1 inputs\n')       
end

P = [0, 0, 0];
Q = [3, 4, 0];
output = SquaredDistance(P,Q);

% Checking 1x3x1 arrays
if isequal(output, expected)
    fprintf('Test 3 passed - correct output for 1x3x1 inputs\n')
else
    fprintf(2, 'Test 3 failed - incorrect output for 1x3x1 inputs\n')       
end

P = cat(3, 0, 0, 0);
Q = cat(3, 3, 4, 0);
output = SquaredDistance(P,Q);

% Checking 1x1x3 arrays
if isequal(output, expected)
    fprintf('Test 4 passed - correct output for 1x1x3 inputs\n')
else
    fprintf(2, 'Test 4 failed - incorrect output for 1x1x3 inputs\n')       
end

% ---------------------------------------------> Test for AssignToClusters

expected = [1 1 1 1;
            1 1 2 2;
            2 2 2 2;
            3 3 3 3];
        
output = AssignToClusters(image_data, seed_means);
[rows, cols, layers] = size(output);

disp('---> AssignToClusters <---')

% Verifying the dimensions of the output.
% There should be M rows, N columns and 1 layer
if isequal([rows, cols, layers], [4 4 1])
    fprintf('Test 1 passed - correct output dimensions\n')
else
    fprintf(2, 'Test 1 failed - incorrect output dimensions\n')
end 

% Checking the assigned clusters
if isequal(output, expected)
    fprintf('Test 2 passed - correct cluster assignments\n')
else
    fprintf(2, 'Test 2 failed - incorrect cluster assignment(s)\n')       
end

% --------------------------------------------------> Test for UpdateMeans

expected = cat(3, [192; 66; 65; NaN], [50; 73; 192; NaN], [135; 203; 135; NaN]);
        
output = UpdateMeans(image_data, 4, clusters);
[rows, cols, layers] = size(output);

disp('---> UpdateMeans <---')

% Verifying the dimensions of the output.
% There should be k rows, 1 column and 3 layer
if isequal([rows, cols, layers], [4 1 3])
    fprintf('Test 1 passed - correct output dimensions\n')
else
    fprintf(2, 'Test 1 failed - incorrect output dimensions\n')
end 

% Checking the assigned clusters
if isequaln(output, expected)
    fprintf('Test 2 passed - correct mean values\n')
else
    fprintf(2, 'Test 2 failed - incorrect mean value(s)\n')       
end

% ----------------------------------------------------> Test for KMeansRGB

disp('---> KMeansRGB <---')

expected1 = clusters2;

expected2 = final_means;

[output1, output2] = KMeansRGB(image_data2, seed_means2, 100);
[rows, cols, layers] = size(output1);

% Verifying the dimensions of the outputs.
% There should be M rows, N columns and 1 layer
if isequal([rows, cols, layers], [3 4 1])
    fprintf('Test 1 passed - correct cluster dimensions\n')
else
    fprintf(2, 'Test 1 failed - incorrect cluster dimensions\n')
end 

[rows, cols, layers] = size(output2);

% There should be k rows, 1 column and 3 layers
if isequal([rows, cols, layers], [3 1 3])
    fprintf('Test 2 passed - correct mean dimensions\n')
else
    fprintf(2, 'Test 2 failed - incorrect mean dimensions\n')
end 

% Checking the final assigned clusters
if isequal(output1, expected1)
    fprintf('Test 3 passed - correct cluster assignments\n')
else
    fprintf(2, 'Test 3 failed - incorrect cluster assignment(s)\n')       
end

% Checking the final calculated means
if isequal(output1, expected1)
    fprintf('Test 4 passed - correct mean values\n')
else
    fprintf(2, 'Test 4 failed - incorrect mean value(s)(s)\n')       
end

% -------------------------------------------> Test for CreateKColourImage

expected = cat(3, [159 159 159 159; 0 0 0 0; 0 0 0 0], ...
                  [0 0 0 0; 159 159 159 159; 0 0 0 0], ...
                  [0 0 0 0; 0 0 0 0; 159 159 159 159]);

output = CreateKColourImage(clusters2, final_means);
[rows, cols, layers] = size(output);

disp('---> CreateKColourImage <---')

% Verifying the dimensions of the output.
% There should be k rows, 1 column and 3 layer
if isequal([rows, cols, layers], [3 4 3])
    fprintf('Test 1 passed - correct output dimensions\n')
else
    fprintf(2, 'Test 1 failed - incorrect output dimensions\n')
end 

% Checking the data type of the output
if isa(output, 'uint8')
    fprintf('Test 2 passed - output is uint8\n')
else
    fprintf(2, 'Test 2 failed - output is not uint8\n')       
end

% Checking the value of the final output
if isequal(output, expected)
    fprintf('Test 3 passed - correct output image\n')
else
    fprintf(2, 'Test 3 failed - incorrect output image\n')       
end


































