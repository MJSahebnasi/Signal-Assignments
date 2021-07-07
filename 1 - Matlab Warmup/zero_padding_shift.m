function x_shifted = zero_padding_shift(x, value)
% negative value: shift to left

if(value > 0)
    x_shifted = [zeros([1, value]) x];
end

if(value < 0)
    x_shifted = [x zeros([1, (-1)*value])];
end
