clear
clc
disp('1: SelectKRandomPoints')
disp('2: GetRGBValuesForPoints')
disp('3: SquaredDistance')
disp('4: AssignToClusters')
disp('5: UpdateMeans')
disp('6: CreateKColouredImage')
option = input('Select the function you want to test: ');

C(:,:,1) = [192 227 38 208;
    65 245 66 62;
    129 140 214 237;
    178 35 65 89];
C(:,:,2) = [50 90 234 97;
    64 212 73 145;
    157 149 193 19;
    121 140 192 14];
C(:,:,3) = [135 145 41 42;
    199 120 203 154;
    238 3 79 67;
    33 86 135 167];

clusters = [1 1 3 1; 2 1 2 3; 2 3 1 1; 1 3 3 2];

switch(option)
    case 1
        % Testing SelectKRandomPoints
        A = zeros(256, 256, 3);
        B = zeros(2, 2, 3);
        K = 4;
        testOne = SelectKRandomPoints(A, K)
        K = 6;
        testTwo = SelectKRandomPoints(A, K)
        K = 4;
        twoThree = SelectKRandomPoints(B, K)
    case 2
        % Testing GetRGBValuesForPoints
        points = [1 1; 2 3; 4 3];
        Colours = GetRGBValuesForPoints(C, points)
        if (Colours(:,:,1) == [192; 66; 65] & ...
                Colours(:,:,2) == [50; 73; 192] & ...
                Colours(:,:,3) == [135; 203; 135])
            disp('Test Successful')
        else
            disp('Test Failed');
        end
    case 3
        % Testing SquaredDistance
        P = [0 0 0];
        Q = [255 255 255];
        testOne = SquaredDistance(P, Q)
        P = [0; 0; 0];
        Q = [3; 4; 0];
        testTwo = SquaredDistance(P, Q)
        Colours(:,:,1) = [192; 66; 65];
        Colours(:,:,2) = [50; 73; 192];
        Colours(:,:,3) = [135; 203; 135];
        P = Colours(1, 1, :);
        Q = Colours(3, 1, :);
        testThree = SquaredDistance(P, Q)
    case 4
        % Testing AssignToClusters
        Means(:,:,1) = [192; 66; 65];
        Means(:,:,2) = [50; 73; 192];
        Means(:,:,3) = [135 203 135];
        clustersTest = AssignToClusters(C, Means)
        if clustersTest == clusters
            disp('Test Successful')
        else
            disp('Test Failed');
        end
    case 5
        % Testing UpdateMeans
        Means = UpdateMeans(C, 3, clusters)        
        A = cat(3, [1501/7; 87.25; 68], [782/7; 77; 172], [621/7; 201.75; 83.8]);
        Means == A
        if Means == A
            disp('Test Successful')
        else
            disp('Test Failed');
        end
    case 6
        % Testing CreateKColourImage
        clusters = [1 2; 2 1];
        means(:,:,1) = [0; 255];
        means(:,:,2) = [0; 255];
        means(:,:,3) = [0; 255];
        imageData(:,:,1) = [0 255; 255 0];
        imageData(:,:,2) = [0 255; 255 0];
        imageData(:,:,3) = [0 255; 255 0];
        newImage = CreateKColourImage(clusters, means)
        if newImage(:,:,:) == [0 255; 255 0]
            disp('Test Successful')
        else
            disp('Test Failed');
        end
end