clc;
close all;

n = -12:0.5:8;
% according to n:
x_n_raw = [4,0,3,0,2,0,1,0,0,0,1,0,2,0,3,0,4];
x_2n_raw = [4,3,2,1,0,1,2,3,4];

x = zero_padding_shift(x_n_raw, n(1)*(-1)*2);
figure, stem(n, x);
legend('x')


x_rev = zero_padding_shift(x_n_raw(end:-1:1), n(1)*(-1)*2 - (length(x_n_raw)-1));
x_rev = zero_padding_shift(x_rev, (-1)*n(end)*2);
figure, stem(n, x_rev);
legend('x[-n] or x_r_e_v')


x2_A = 2*x_rev;
figure, stem(n, x2_A);
legend('x2_A')

x2_B = zero_padding_shift(x_2n_raw, (-1)*n(1)*2);
x2_B = zero_padding_shift(x2_B , (-1)*(n(end)*2-length(x_2n_raw)+1));
figure, stem(n, x2_B);
legend('x2_B')

x2_C = circshift(x_rev, [0,-4*2]);
figure, stem(n, x2_C);
legend('x2_C')

x2 = x2_A + x2_B.*x2_C;
figure, stem(n, x2);
legend('x2')
