function newImage = removeSeam(img, seamIndices)
%REMOVESEAM Remove seam in image
%   Remove seam in image and move pixels to left
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

