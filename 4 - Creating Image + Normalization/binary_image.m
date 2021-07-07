clc
close all

% generating primary image

matrix = zeros([11, 24]);

matrix(1:4,3) = ~matrix(1:4,3);
matrix(4,4:5) = ~matrix(4,4:5);

matrix(1:10,13:16) = ~matrix(1:10,13:16);
matrix(7:10,17:22) = ~matrix(7:10,17:22);

matrix(8:9,5) = ~matrix(8:9,5);
matrix(7:10,6) = ~matrix(7:10,6);
matrix(6:7,7) = ~matrix(6:7,7);
matrix(10:11,7) = ~matrix(10:11,7);
matrix(6:7,8) = ~matrix(6:7,8);
matrix(10:11,8) = ~matrix(10:11,8);
matrix(8:9,10) = ~matrix(8:9,10);
matrix(7:10,9) = ~matrix(7:10,9);

matrix = ~matrix;

figure, imagesc(matrix)
colormap(gray)
grid on

% A: keeping smaller 'L'
matrixA = matrix;

matrixA(5:end,:) = matrixA(5:end,:) | 1;
matrixA(1:4,6:end) = matrixA(1:4,6:end) | 1;

figure, imagesc(matrixA)
colormap(gray)
grid on

% B: filling the diamond
matrixB = matrix;

matrixB(8:9,7:8) = ~matrixB(8:9,7:8);

figure, imagesc(matrixB)
colormap(gray)
grid on

% C: removing smaller 'L' and the diamond, splitting bigger 'L'
matrixC = matrix;
% removing:
matrixC(:,1:11) = matrixC(:,1:11) | 1;
% splitting:
% removing the 4x4 square
matrixC(7:10,13:16) = ~matrixC(7:10,13:16);
% drawing the 4x4 square some where else
matrixC(8:11,12:15) = ~matrixC(8:11,12:15);

figure, imagesc(matrixC)
colormap(gray)
grid on
