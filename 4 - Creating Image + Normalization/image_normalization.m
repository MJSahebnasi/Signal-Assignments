clc
close all

% original matrix
matrix = [1 2 0 1 0; 0 0 5 2 7; 3 2 2 2 3; 4 5 6 6 7; 0 3 1 2 4];

% displaying original image
imagesc(matrix)
colormap(gray)
title('original image')
set(gca,'XTick',[], 'YTick', [])


% A: displaying 3 bit-planes
planes = zeros([5,5,3]);
for i = 1:3
   % converting to binary
   planes(:,:,i) = fix((rem(matrix,(2^(3-i+1))))/(2^(3-i)));
   
   figure, imagesc(planes(:,:,i));
   title(sprintf('plane %d', i))
   colormap(gray)
   set(gca,'XTick',[], 'YTick', [])
end
planes

% B: min-max normalization
max_val = max(matrix(:));
min_val = min(matrix(:));
normalized_matrix = (matrix-min_val)/max_val

figure, imagesc(normalized_matrix)
colormap(gray)
title('normalized image')
set(gca,'XTick',[], 'YTick', [])

% C: z-score normalization
standard_deviation = std2(matrix);
mean_val = mean2(matrix);
zscore_normalized_matrix = (matrix-mean_val)/standard_deviation

figure, imagesc(zscore_normalized_matrix )
colormap(gray)
title('z-score normalized image')
set(gca,'XTick',[], 'YTick', [])

