clc;
close all;

% A:
board = ones(128);
board(1:2:end,1:2:end) = 0;
board(2:2:end,2:2:end) = 0;

imshow(board,'InitialMagnification',400);
title('A: checkerboard implementation')

% B:
color256 = 0:255;
color256 = repmat(color256,256,1);

figure, image(color256)
colormap(jet(256))
title('B: color intensity')

% C:
rand_rgb = randi(255, 128, 128, 3);
rand_rgb = rand_rgb - 1;

figure, image(uint8(rand_rgb));
title('C: random RGB');

% D:
shapes_rgb = ones(256, 256, 3);

% empty black square, color[0 0 0]
shapes_rgb(10,10:30, 1:3) = 0;
shapes_rgb(30,10:30, 1:3) = 0;
shapes_rgb(11:29,10, 1:3) = 0;
shapes_rgb(11:29,30, 1:3) = 0;

% empty yellow circle, color[255 255 0]
r = 10;
cntr_x = 50;
cntr_y = 50;
theta = 0:pi/200:2*pi;
X = round(cos(theta) * r) + cntr_x;
Y = round(sin(theta) * r) + cntr_y;
for i = 1:length(X)
    shapes_rgb(Y(i),X(i),3) = 0;
end

% full red circle, color[255 0 0]
r = 5;
cntr_x = 80;
cntr_y = 80;
theta = 0:pi/100:2*pi;
X = round(cos(theta) * r) + cntr_x;
Y = round(sin(theta) * r) + cntr_y;
for i = 1:length(X)
    shapes_rgb(min(cntr_y,Y(i)):max(cntr_y,Y(i)),min(cntr_x,X(i)):max(cntr_x,X(i)),2:3) = 0;
end

shapes_rgb = shapes_rgb * 255;
figure, image(uint8(shapes_rgb));
title('D: RGB of shapes');

% E:
matrix = ones([110, 240]);

% small 'L'
matrix(1:40,20:30) = ~matrix(1:40,20:30);
matrix(30:40,31:50) = ~matrix(30:40,31:50);

% big 'L'
matrix(1:100,120:160) = ~matrix(1:100,120:160);
matrix(60:100,161:220) = ~matrix(60:100,161:220);
matrix(1:79,131:149) = ~matrix(1:79,131:149); %white square

% diamond
matrix(70:90,40:50) = ~matrix(70:90,40:50);
matrix(60:100,51:60) = ~matrix(60:100,51:60);
matrix(50:70,61:80) = ~matrix(50:70,61:80);
matrix(90:110,61:80) = ~matrix(90:110,61:80);
matrix(60:100,81:90) = ~matrix(60:100,81:90);
matrix(70:90,91:100) = ~matrix(70:90,91:100);

%
matrix(20:30,231:240) = ~matrix(20:30,231:240);
matrix(50:60,231:240) = ~matrix(50:60,231:240);
matrix(80:90,231:240) = ~matrix(80:90,231:240);

%
matrix(10:20,181:190) = ~matrix(10:20,181:190);
matrix(30:40,181:190) = ~matrix(30:40,181:190);
matrix(20:30,191:200) = ~matrix(20:30,191:200);
matrix(10:20,201:210) = ~matrix(10:20,201:210);
matrix(30:40,201:210) = ~matrix(30:40,201:210);


figure, imagesc(matrix)
title('E: grid')
colormap(gray)
grid on







