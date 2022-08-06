myFolder = 'C:\Users\AFZAL AMANULLAH\OneDrive\Documents\MATLAB\Rice Control 3\Amp';
i=imread('Amplitude_0001.bmp');
img = rescale(i);
img(randperm(numel(img), round(numel(img)/100))) = NaN;
figure;
imshow(img,[])


%% labeling
label = zeros(size(img), 'uint8');
label(~isfinite(img)) = 0;
label(img < 0.1) = 1;
label(img >= 0.1 & img < 0.2) = 2;
label(img >= 0.2 & img < 0.3) = 3;
label(img >= 0.3 & img < 0.4) = 4;
label(img >= 0.4 & img < 0.5) = 5;
label(img >= 0.5 & img < 0.6) = 6;
label(img >= 0.6 & img < 0.7) = 7;
label(img >= 0.7 & img < 0.8) = 8;
label(img >= 0.8 & img < 0.9) = 9;
label(img>=0.9 & img <= 1) = 10;
label( img > 1) = 11;

%% make colormap
map = [0 0 0
    0 0 0
    0 0 0
    0 0 0
    0 0 0
    0.05 0.05 0.05
    0.2 0.2 0.2
    0.4 0.4 0.4
    0.6 0.6 0.6
    0.8 0.8 0.8
    .9 .9 0.9
    1 1 1
    ];

%% converting to rgb image
rgb = ind2rgb(label, map);
figure;
imshow(rgb,[]);
title('Our Colormap');