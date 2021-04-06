



function seamCoords = findLowestSeam(seamEnergy)
% find the smallest energy containing seam from gradient matrix
%   Detailed explanation goes here
    [height, width] = size(seamEnergy);
    [M, i] = min(seamEnergy(height, :));
    seamCoords = zeros(1, height)';
    seamCoords(height) = i;

    for j = height:-1:2
        if (i > 1 && i < width) 
            [SM, SI] = min([seamEnergy(j-1, i-1), seamEnergy(j-1 , i), seamEnergy(j-1, i+1)]); % If we can pick from all three nodes above
            if (SI == 1)
                i = i - 1;
            elseif (SI == 3)
                i = i + 1;
            end
        elseif(i == 1)
            [SM, SI] = min([seamEnergy(j-1, i), seamEnergy(j-1, i+1)]); % if on first column of a row
            if (SI == 2)
                i = i + 1;
            end
       elseif (i == width)
            [SM, SI] = min([seamEnergy(j-1, i-1), seamEnergy(j-1, i)]); % if on last column - which upper pixel neighbour contains least energy
            if (SI == 1)
                i = i - 1;
            end
        end
        seamCoords(j - 1) = i;
    end
end
