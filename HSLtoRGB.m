function RGBImage = HSLtoRGB(HSLImage)
%H Summary of this function goes here
%   Detailed explanation goes here
    [height,width, depth] = size(HSLImage);
    RGBImage = zeros(height, width, depth, 'uint8');
    
    for i=1:height
        for j = 1:width
            h = double(HSLImage(i,j,1)) / 256.0;
            s = double(HSLImage(i,j,2)) / 256.0;
            l = double(HSLImage(i,j,3)) / 256.0;
            r = 0;
            g = 0;
            b = 0;
            
            if (s == 0)
                r = l; g = l; b = l;
            else 
                if (l < 0.5) 
                    temp2 = l .* (1+s);
                else 
                    temp2 = (l + s) - (l .* s);
                end
                temp1 = 2 * l - temp2;
                tempr  = h + 1.0 / 3.0;
                if (tempr >1)
                    tempr = tempr - 1;
                end
                tempg = h;
                tempb = h - 1.0  / 3.0;
                if (tempb < 0)
                    tempb = tempb + 1;
                end


                if (tempr < 1.0 / 6.0)
                    r = temp1 + (temp2 - temp1) * 6.0 * tempr;
                elseif (tempr < 0.5)
                    r = temp2;
                elseif (tempr < 2.0 /3.0)
                    r = temp1 + (temp2 - temp1) * ((2.0 / 3.0) - tempr) * 6.0;
                else
                    r = temp1;
                end

                if (tempg < 1.0 / 6.0)
                    g = temp1 + (temp2 - temp1) * 6.0 * tempg;
                elseif (tempg < 0.5)
                    g = temp2;
                elseif (tempg < 2.0 /3.0)
                    g = temp1 + (temp2 - temp1) * ((2.0 / 3.0) - tempg) * 6.0;
                else
                    g = temp1;
                end

                if (tempb < 1.0 / 6.0)
                    b = temp1 + (temp2 - temp1) * 6.0 * tempb;
                elseif (tempb < 0.5)
                    b = temp2;
                elseif (tempb < 2.0 /3.0)
                    b = temp1 + (temp2 - temp1) * ((2.0 / 3.0) - tempb) * 6.0;
                else
                    b = temp1;
                end

            end

            RGBImage(i,j, 1) = uint8(r.*255.0);
            RGBImage(i,j, 2) = uint8(g.*255.0);
            RGBImage(i,j,3) = uint8(b.*255.0);

        end
    end
    
    
    
end

