myFolder = 'C:\Users\AFZAL AMANULLAH\OneDrive\Documents\MATLAB\Rice PVC 500_2\Amp';


filePattern = fullfile(myFolder, '*.bmp');
filenames = dir(filePattern);
count = 0;
for k = 1 : length(filenames)
  thisFileName = filenames(k).name;
  if exist(thisFileName, 'file')
    thisImage = double(imread(thisFileName));
    if k == 1
      sumImage = thisImage;
    else
      sumImage = sumImage + thisImage;
    end
    count = count + 1;
  end
end

meanImage = sumImage / 100;

Standardimage = stdfilt(meanImage);
img = rescale(Standardimage);
img(randperm(numel(img), round(numel(img)/100))) = NaN;
figure;
imshow(img,[]);
title('Original Image');
%% labeling
label = zeros(size(img), 'uint8');
label(~isfinite(img)) = 0;
label(img < 0.02) = 1;
label(img >= 0.02 & img < 0.04) = 3;
label(img >= 0.04 & img < 0.06) = 4;
label(img >= 0.06 & img < 0.08) = 5;
label(img >= 0.08 & img < 0.1) = 6;
label(img >= 0.1 & img < 0.12) = 7;
label(img >= 0.12 & img < 0.14) = 8;
label(img >= 0.14 & img < 0.16) = 9;
label(img >= 0.16 & img < 0.18) = 10;
label(img>=0.18 & img <= 0.2) = 11;
label( img > 0.2) = 12;
figure;
imshow(label,[]);
title('Default Colormap');
 colormap(hsv);
%% make colormap
map = [0 0.9 0
    0 0.9 0
    0 0.9 0
    0 0.9 0
    0 0.9 0
    0 0.9 0
    0 0.9 0
    0 0 0.2
    0 0 0.2
    0 0 0.2
    0 0 0.2
    0 0 0.2
    ];

%% converting to rgb image
rgb = ind2rgb(label, map);
figure;
imshow(rgb,[]);
title('Our Colormap');