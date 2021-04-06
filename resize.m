function [newImage, originalImage] = resize(img, vertical, horizontal)
%RESIZE Summary of this function goes here
%   Detailed explanation goes here
    originalImage = img;
    newImage = img;
    
    [height, width, depth] = size(img);
    x = width - horizontal; % Horizontal pixels to remove
    y = height - vertical; % Vertical pixels to remove
    
    
    for i=1:abs(x)
        gray = rgb2gray(newImage); % Transform image to grayscale
        [Gmag, Gdir] = imgradient(gray, 'Sobel'); % Gradient with Sobel filter
        seamEnergies = SeamCarves(Gmag); % Find all seam energies
        seamCoords = findLowestSeam(seamEnergies); % Find seam with least energy
        originalImage = displaySeams(originalImage, seamCoords, false); % Draw removed seam with red on top of image
        if (x > 0)
            newImage = removeSeam(newImage, seamCoords); % Remove seams
        else
            newImage = addSeam(newImage, seamCoords); % Add seams
        end
    end
    originalImage = permute(originalImage, [2 1 3]);
    newImage = permute(newImage, [2 1 3]);
    
    for i=1:abs(y)
        gray = rgb2gray(newImage); % Transform image to grayscale
        [Gmag, Gdir] = imgradient(gray, 'Sobel'); % Gradient with Sobel filter
        seamEnergies = SeamCarves(Gmag); % Find all seam energies
        seamCoords = findLowestSeam(seamEnergies); % Find seam with least energy
        originalImage = displaySeams(originalImage, seamCoords, false); % Draw removed seam with red on top of image
        if (y > 0)
            newImage = removeSeam(newImage, seamCoords); % Remove seams
        else
            newImage = addSeam(newImage, seamCoords); % Add seams
        end
    end
    
    originalImage = permute(originalImage, [2 1 3]);
    newImage = permute(newImage, [2 1 3]);
    
end

