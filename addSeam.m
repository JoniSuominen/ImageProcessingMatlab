function newImage = addSeam(img, seamIndices)
%REMOVESEAM Add seam to image
%   Add seam to image by moving pixels to right 
    [height, width, depth] = size(img);
    newImage = ones(height ,width+1,3, 'uint8');
    for i=1:height
        val = seamIndices(i);
        newImage(i, 1:val, :) = img(i, 1:val, :);
        newImage(i, val+1, :) = img(i, val, :);
        if val+1<width
            newImage(i, val+2:end, :) = img(i, (val+1):end, :);
        end
    end
end

