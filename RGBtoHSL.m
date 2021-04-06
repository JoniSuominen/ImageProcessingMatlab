function HSLImage = RGBtoHSL(rgbImage)
%RGBTOHSL2 Summary of this function goes here
%   Detailed explanation goes here
    [height,width, depth] = size(rgbImage);
    HSLImage = zeros(height, width, depth);
    for i=1:height
        for j = 1:width
            % Normalize into range 0-1.
            r = double(rgbImage(i,j,1)) / 255; 
            g = double(rgbImage(i,j,2)) / 255;
            b = double(rgbImage(i,j,3)) / 255;
            
            H = 0.0; % Default no hue
            S = 0.0; % Default no saturation
            L = 0.0; % Default no luminance

            maxColor = max([r; g; b]);
            minColor = min([r; g; b]);
            
            L = (maxColor + minColor)/2; % Luminance is min+max/2
            
            % Saturation depends on luminance
            if (L <= 0.5)
                S = (maxColor - minColor) / (maxColor + minColor);
            else
                S = (maxColor - minColor)/(2.0-maxColor-minColor);
            end
            
            % Hue formula depends on what is the max color
            if (r == maxColor) 
                H = (g-b)/(maxColor-minColor);
            elseif (g == maxColor) 
                H = 2.0 + (b-r)/(maxColor-minColor);
            elseif (b == maxColor)
                H = 4.0 + (r-g)/(maxColor-minColor);
            end
            
            H = H / 6; % Hue needs to be normalized into 0-1 range
            
            if (H < 0)
                H = H +1;
            end
            
            HSLImage(i,j, 1) = uint8(H*255.0);
            HSLImage(i,j, 2) = uint8(S*255.0);
            HSLImage(i,j,3) = uint8(L*255.0);
        end
    end

end

