function seamEnergy = SeamCarves(Gmag)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [height, width] = size(Gmag);
    seamEnergy = zeros(height, width); % Compute energy at each pixel
    
    % The algorithm at each pixel looks at each upper pixel to find the
    % most optimal energy path it can take. Whichever upper pixel has the
    % most effecient route thus far, has the cleanest path to current pixel
    for j = 1:height
        for i = 1: width
            if (j == 1)
                 % At the first row, there is not upper pixels to look at
                 % for energy
                seamEnergy(j, i) = Gmag(j, i);
            else
               smallest = inf;
               if (i > 1 && j > 1 && i < width)
                   smallest = min([seamEnergy(j-1, i-1), seamEnergy(j-1 , i), seamEnergy(j-1, i+1)]);
               elseif (j > 1 && i < width)
                   smallest = min([seamEnergy(j-1, i), seamEnergy(j-1, i+1)]);
               elseif (i == width)
                   smallest = min([seamEnergy(j-1, i-1), seamEnergy(j-1, i)]);
               end
               seamEnergy(j, i) =  Gmag(j,i) + smallest;
            end
        end   
    end
end

