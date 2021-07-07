clc;
close all;

% A: mean filter
mean_filter_3 = repmat(1/9,3,3);
mean_filter_5 = repmat(1/25,5,5);
mean_filter_7 = repmat(1/49,7,7);

rectangle_input_image_1 = imread('input1.jpg');
imshow(rectangle_input_image_1);
title('input1');

output_mean_3 = imconvolution(rectangle_input_image_1, mean_filter_3,1, 1, 0);
figure, imshow(output_mean_3);
title('output1 - 3*3 mean filter');

output_mean_5 = imconvolution(rectangle_input_image_1, mean_filter_5,1, 1, 0);
figure, imshow(output_mean_5);
title('output1 - 5*5 mean filter');

output_mean_7 = imconvolution(rectangle_input_image_1, mean_filter_7,1, 1, 0);
figure, imshow(output_mean_7);
title('output1 - 7*7 mean filter');

% B: Median Filter
output_median_3 = imconvolution(rectangle_input_image_1, zeros([3,3]),1, 1, 1);
figure, imshow(output_median_3);
title('output2 - 3*3 median filter');

output_median_5 = imconvolution(rectangle_input_image_1, zeros([5,5]),1, 1, 1);
figure, imshow(output_median_5);
title('output2 - 5*5 median filter');

output_median_7 = imconvolution(rectangle_input_image_1, zeros([7,7]),1, 1, 1);
figure, imshow(output_median_7);
title('output2 - 7*7 median filter');

% C: Gausian Filter
gausian_filter = (1/16)*[1,2,1;2,4,2;1,2,1];
output_gausian_3 = imconvolution(rectangle_input_image_1, gausian_filter,1, 1, 0);
figure, imshow(output_gausian_3);
title('output3 - 3*3 gausian filter');
