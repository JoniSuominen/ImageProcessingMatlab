function newImage = removeSeam(img, seamIndices)
%REMOVESEAM Summary of this function goes here
%   Detailed explanation goes here
    [height, width, depth] = size(img);
    newImage = ones(height ,width-1 ,3, 'uint8');
    for i=1:height
        val = seamIndices(i);
        newImage(i, 1:val - 1, :) = img(i, 1:val - 1, :);
        if val+1<width
            newImage(i, val:end, :) = img(i, (val+1):end, :);
        end
    end
end

