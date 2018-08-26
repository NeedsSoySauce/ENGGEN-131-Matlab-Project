%clear
imageName = 'Peter.jpg';
A = imread(imageName);
A = double(A);
K = 16;
maxIterations = 1000;
% figure(1)
% imshow(A)
% title(['Original image: ' imageName]);
%k = input('How many colours do you want to use? (enter a small number):');
tic;
points = SelectKRandomPoints(A, K);
seedMeans = GetRGBValuesForPoints(A, points);
[clusters, means] = KMeansRGB(A,seedMeans,maxIterations);
newImage = CreateKColourImage(clusters,means);
toc;
disp([num2str(10/toc) ' iterations per second']);
figure(2)
imshow(newImage);
title([num2str(K) ' colour version of ' imageName ])
