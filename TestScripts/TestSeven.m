% Test all the seven specified functions for the 2018 matlab project
% To use this script requires a small amount of setup (see below).
%
% 
% Author: Peter Bier
%
% Setup:
% You will need to add the TestScripts directory to the
% matlab path so that Matlab can find the test scripts and test data files
% To do this from within Matlab right click on the directory
% called TestScripts and choose add to path, "Selected folders and subfolders").
% Adding a directory to the Matlab path allows Matlab to locate anything
% in that directory.  This allows you to keep your test scripts separate
% from the directory your code is stored in.
% This script assumes that you will change into a working directory
% that contains the code you want to test.
% Once setup is complete you can test code by typing TestSeven from
% within your working directory.  You can also test individual functions
% using the appropriate test script, e.g. calling TestSquaredDistance will
% test the SquaredDistance function.
%
% Note that if a function name is mispelled you can still use
% scripts to test them, just specify the function name 
% used as an optional argument (e.g. if the SquaredDistance function is 
% named incorrectly with a lower case "s", you could test it by typing:
% TestSquaredDistance('squaredDistance')
% Of course you should also correct your function names!

clear
clc
% set up list of functions to mark
functionsList = {'SelectKRandomPoints', 'GetRGBValuesForPoints', ... 
    'SquaredDistance','AssignToClusters', 'UpdateMeans', 'KMeansRGB', ...
    'CreateKColourImage'};



divider='=======================================================';
totalMark = 0;
% Call the test function for each listed function, e.g. TestSquaredDistance
for i=1:length(functionsList)
    mark(i) = feval(['Test' functionsList{i}],functionsList{i});
    totalMark = totalMark + mark(i);
    input('Hit enter to continue');
    disp(divider);
end

disp(['Your total functionality mark for these 3 functions is ' num2str(totalMark) '/24'])


