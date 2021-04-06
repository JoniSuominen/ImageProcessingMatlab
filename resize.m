function [newImage, originalImage] = resize(img, horizontal, vertical)
%RESIZE Summary of this function goes here
%   Detailed explanation goes here
    originalImage = img;
    newImage = img;
    
    [height, width, depth] = size(img);
    x = width - horizontal;
    y = height - vertical;
    
    
    for i=1:abs(x)
        gray = rgb2gray(newImage);
        [Gmag, Gdir] = imgradient(gray, 'prewitt');
        seamEnergies = SeamCarves(Gmag);
        seamCoords = findLowestSeam(seamEnergies);
        originalImage = displaySeams(originalImage, seamCoords, false);
        if (x > 0)
            newImage = removeSeam(newImage, seamCoords);
        else
            newImage = addSeam(newImage, seamCoords);
        end
    end
    originalImage = permute(originalImage, [2 1 3]);
    newImage = permute(newImage, [2 1 3]);
    
    for i=1:abs(y)
        gray = rgb2gray(newImage);
        [Gmag, Gdir] = imgradient(gray, 'prewitt');
        seamEnergies = SeamCarves(Gmag);
        seamCoords = findLowestSeam(seamEnergies);
        originalImage = displaySeams(originalImage, seamCoords, false);
        if (y > 0)
            newImage = removeSeam(newImage, seamCoords);
        else
            newImage = addSeam(newImage, seamCoords);
        end
    end
    
    originalImage = permute(originalImage, [2 1 3]);
    newImage = permute(newImage, [2 1 3]);
    
end

