clear;
clc;
seeds = [127,270;132,449;150,484;184,491;70,347;84,344;201,35;74,115;193,433;100,400];

pic = imread('clocktower.jpg');
max_its = 500;

pic=double(pic);

for k = [10, 4]
    points = seeds(1:k, :);
    t = 0;
    for i = 1:10
        tic;
        clusts = GetRGBValuesForPoints(pic, points);
        [assign, clusts] = KMeansRGB(pic, clusts, max_its);
        k_pic = CreateKColourImage(assign, clusts);
        t = t + toc;
    end
    disp(['image took an average ' num2str(t/10) 's to process with k=' num2str(k) ', over 10 trials']);
end