function rotatedImage = rotate(image, angle)
%ROTATE Rotate given image by specified angle
%   Rotates given image by applying three shear transformations
    [height, width, depth] = size(image) ;
    oldXMidPoint = round(width / 2); % move origin to middle of image
    oldYMidPoint = round(height / 2); % move origin to middle of image

    theta = round(deg2rad(angle),2); % images acts funny around 180 degrees with high precision

    % Calculate size after rotation

    newHeight = round(abs(height * cos(theta))  +  abs(width * sin(theta)));% Height after rotation
    newWidth = round(abs(width * cos(theta))  +  abs(height * sin(theta))); % Width after rotation

    newXMidPoint = round(newWidth / 2); % New origin of image
    newYMidPoint = round(newHeight / 2); % New origin of image
    
    shear1 = [1 -tan(theta/2); 0 1];
    shear2 = [1 0; sin(theta) 1];
    shear3 = [1 -tan(theta/2); 0 1];

    rotatedImage = zeros(newHeight, newWidth, depth, 'uint8'); % New Image size
    for i =1:height
        for j=1:width
            x = (-oldXMidPoint) + j;
            y = (-oldYMidPoint) + i;

            transform = round(shear3*[x;y]); % Apply first shear
            transform = round(shear2*transform); % Apply second shear
            transform = round(shear1*transform); % Apply third shear

            newX = newXMidPoint + transform(1); % Get new x position
            newY = newYMidPoint + transform(2); % Get new y position

            if (newY > 0 && newX > 0)
                rotatedImage(newY, newX,:) = image(i,j,:);
            end
        end
    end

end

