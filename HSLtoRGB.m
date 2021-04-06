function RGBImage = HSLtoRGB(HSLImage)
%H Summary of this function goes here
%   Detailed explanation goes here
    [height,width, depth] = size(HSLImage);
    RGBImage = zeros(height, width, depth, 'uint8');
    for i=1:height
        for j = 1:width
            H = double(HSLImage(i,j,1)) / 255;
            S = double(HSLImage(i,j,2)) / 255;
            L = double(HSLImage(i,j,3)) / 255;
            
            R = 0;
            G = 0;
            B = 0;
            
            % If there is no saturation, its a shade of gray
            % Then R = G = B = L * 255
            if (S == 0)
                RGBImage(i,j,:) = L * 255;
            else
                if (L < 0.5)
                    temp1 = L * (1 + S);
                else
                    temp1 = L + S - (L * S); % If luminance >= 0.5
                end
                
                temp2 = 2 * L - temp1;
                
                tempRed = H + 1/3;
                tempGreen = H;
                tempBlue = H - 1/3;
                
                if (tempRed > 1) 
                    tempRed = tempRed - 1; % Sanity check
                end
                
                if (tempBlue < 0)
                    tempBlue = tempBlue + 1; % Sanity check
                end
                
                % Color tests to choose what formula to use for R, G and B.
                
                R = colorTest(tempRed, temp1, temp2);
                G = colorTest(tempGreen, temp1, temp2);
                B  = colorTest(tempBlue, temp1, temp2);
                RGBImage(i,j, 1) = uint8(R*255.0);
                RGBImage(i,j, 2) = uint8(G*255.0);
                RGBImage(i,j,3) = uint8(B*255.0);
            end

        end
    end 
end

function colorValue = colorTest(tempColor, temp1, temp2)
    if (6 * tempColor < 1) % Test 1
        colorValue = temp2 +(temp1 - temp2) * 6 * tempColor;
    elseif (2 * tempColor < 1) % Test 2
        colorValue = temp1;
    elseif (3 * tempColor < 2) % Test 3
        colorValue = temp2 + (temp1 - temp2) * (2/3 - tempColor) * 6;
    else
        colorValue = temp2; % If none passed
    end
    
end


