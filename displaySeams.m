function editedImage = displaySeams(img, seamIndices, horizontal)
%DISPLAYSEAMS Summary of this function goes here
%   Detailed explanation goes here
    editedImage = img;
    for i=1:length(seamIndices)
        
        if horizontal == false
            editedImage(i, seamIndices(i), 1) = 255;
            editedImage(i, seamIndices(i), 2) = 0;
            editedImage(i, seamIndices(i), 3) = 0;
        else
            editedImage(seamIndices(i), i, 1) = 255;
            editedImage(seamIndices(i), i, 2) = 0;
            editedImage(seamIndices(i), i, 3) = 0;
        end
    end
end

