function output_image = imconvolution(input_image, filter, stride, isSame, isMedian)
%IMCONVOLUTION: 2D convolution for rectangle images

input_size = size(input_image);
input_height = input_size(1);
input_width = input_size(2);
channels = input_size(3);

filter_size = size(filter);
filter_height = filter_size(1);
filter_width = filter_size(2);

padding_height = 0;
padding_width = 0;

if isSame
    % zero-padding required
    padding_height = (filter_height-1)/2;
    padding_width = (filter_width-1)/2;
    input_image = padarray(input_image, [padding_height, padding_width]);
end

output_height = floor((input_height + 2*padding_height - filter_height)/stride + 1);
output_width = floor((input_width + 2*padding_width - filter_width)/stride + 1);

output_image = uint8(zeros([output_height, output_width]));

if isMedian
    
    for plane = 1:channels
        for row = 1:input_height-filter_height+1
            for col = 1:input_width-filter_width+1
                window = input_image(row:row+filter_height-1,col:col+filter_width-1, plane);
                output_image(row, col, plane) = median(window(:));
            end
        end
    end
    
else
    
    for plane = 1:channels
        for row = 1:input_height-filter_height+1
            for col = 1:input_width-filter_width+1
                window = input_image(row:row+filter_height-1,col:col+filter_width-1, plane);
                output_image(row, col, plane) = uint8(sum(sum( double(filter) .* double(window) )));
            end
        end
    end
    
end

end

