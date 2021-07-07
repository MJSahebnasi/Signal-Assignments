clc
close all

image = imread('cameraman.jpg');
figure, imshow(image)
title('original')

% 2 level:
thresh = multithresh(image,2-1);
values = [thresh 255];

image_lvl_2 = imquantize(image, thresh, values);
figure, imshow(image_lvl_2)
title('2 level quantized')

% 16 levels:
thresh = multithresh(image,16-1);
values = [thresh 255];

image_lvl_16 = imquantize(image, thresh, values);
figure, imshow(image_lvl_16)
title('16 level quantized')

% 128 levels:
lvl_128 = 256/128:256/128:256-256/128;
values = uint8([lvl_128 255]);

image_lvl_128 = imquantize(image, lvl_128, values);
figure, imshow(image_lvl_128)

title('128 level quantized')
