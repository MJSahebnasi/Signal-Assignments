clc;
close all;

% x1
n1 = -2:1:22;
x1_raw = -2:1:2;
x1 = repmat(x1_raw, 1,5);
figure, stem(n1, x1)
legend('x1[n] in 5 periods')

% x2
n2 = 0:20;
my_zeros = zeros(size(n2));

step = my_zeros;
step(n2 >= 0) = 1;

step20 = my_zeros;
step20(n2 >= 20) = 1;

figure, stem(1:63, repmat(exp(0.1*n2).*(step-step20),1,3));

% figure, stem(n2, exp(0.1*n2).*(step-step20));
legend('x2[n]')
