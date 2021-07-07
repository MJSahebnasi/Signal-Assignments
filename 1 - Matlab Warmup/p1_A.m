clc;
close all;

x = [4,3,2,1,0,1,2,3,4];

x1_A = 2*x;
x1_B = 4*(zero_padding_shift(x, 2));

% making domains equal:
x1_A = zero_padding_shift(x1_A, -2);

x1 = x1_A + x1_B;

n = -2:length(x1)-2-1;


figure, stem(n, x1)
legend('x1')

figure, stem(n, x1_A)
hold on
stem(n, x1_B)
legend('x1_A', 'x1_B')