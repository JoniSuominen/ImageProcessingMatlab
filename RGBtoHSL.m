function HSLImage = RGBtoHSL(rgbImage)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [height,width, depth] = size(rgbImage);
    HSLImage = zeros(height, width, depth);
    for i=1:height
        for j = 1:width
            r = double(rgbImage(i,j,1)) / 256.0;
            g = double(rgbImage(i,j,2)) / 256.0;
            b = double(rgbImage(i,j,3)) / 256.0;


            maxColor = max([r; g; b]);
            minColor = min([r; g; b]);
            
            
            h = 0.0;
            s = 0.0;
            l = 0.0;
            
            if (minColor == maxColor)
                 l = maxColor;
            else
                l = (minColor + maxColor) ./ 2;
                if (l < 0.5)
                    s = (maxColor - minColor) ./ (maxColor + minColor);
                else
                    s = (maxColor - minColor) ./ (2.0 - maxColor - minColor);
                end

                if r == maxColor
                    h = (g - b) ./ (maxColor - minColor);
                elseif (g == maxColor)
                        h = 2.0 + (b - r) / (maxColor - minColor);
                else
                    h = 4.0 + (r - g) ./ (maxColor - minColor);
                end

                h = h ./ 6;
                if (h < 0)
                    h = h + 1;
                end

            end
 
            HSLImage(i,j, 1) = uint8(h.*255.0);
            HSLImage(i,j, 2) = uint8(s.*255.0);
            HSLImage(i,j,3) = uint8(l.*255.0);
        end
    end
    
end

