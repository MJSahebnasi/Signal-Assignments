clc;
close all;

n = -10:10;

my_zeros = zeros(1,length(n));

% signal #1
impulse = my_zeros;
impulse(n==0) = 1;
figure, stem(n, impulse);
legend('impulse');

step = my_zeros;
step(n >= 0) = 1;
figure, stem(n, step);
legend('step');

% signal #2
A = my_zeros;
A(n >= 5) = 1;
B = zeros;
B(n >= -1) = 1;
C = my_zeros;
C(n >= 3) = 1;
C = 8*C;
figure, stem(n,A)
legend('step[n-5]')
figure, stem(n,B)
legend('step[n+1]')
figure, stem(n,C)
legend('8 * step[n-3]')
figure, stem(n,A-B+C)
legend('p2: x2[n]')

ramp = n.*step;
figure, stem(n, ramp)
legend('ramp[n]')
ramp_rev = ramp(end:-1:1);
figure, stem(n, ramp_rev)
legend('ramp[-n]')

% signal #3
figure, stem(n, 3*(ramp_rev+ramp))
legend('p2: x3[n]')

% signal #4
figure, stem(n, 5- ramp_rev - ramp)
legend('p2: x4[n]')

% part 2 :
% signal #1
x1 = 2.5*cos((pi/3)*n + 2.5);
figure, stem(n, x1)
legend('x1[n]')

% signal #2
x2 = 3*sin((4/5)*n - 1) + 3 ;
figure, stem(n, x2)
legend('x2[n]')
