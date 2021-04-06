function seamCoords = findLowestSeam(seamEnergy)
%FIND Summary of this function goes here
%   Detailed explanation goes here
[height, width] = size(seamEnergy);
[M, i] = min(seamEnergy(height, :));
seamCoords = zeros(1, height)';
seamCoords(height) = i;
for j = height:-1:2
    smallesIndex = inf;
    if (i > j && j > 1 && i < width) 
        [SM, SI] = min([seamEnergy(j-1, i-1), seamEnergy(j-1 , i), seamEnergy(j-1, i+1)]);
        smallestIndex = SI;
        if (smallestIndex == 1)
            i = i - 1;
        elseif (smallestIndex == 3)
            i = i + 1;
        end
    elseif(j > 1 && i < width && i > 0)
        [SM, SI] = min([seamEnergy(j-1, i), seamEnergy(j-1, i+1)]);
        smallestIndex = SI;
        if (smallestIndex == 3)
            i = i + 1;
        end
   elseif (i == width)
        [SM, SI] = min([seamEnergy(j-1, i-1), seamEnergy(j-1, i)]);
        smallestIndex = SI;
        if (smallestIndex == 1)
            i = i - 1;
        end
    end
    seamCoords(j - 1) = i;
end
end

