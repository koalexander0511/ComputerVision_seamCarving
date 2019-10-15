function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
    [rowsize, colsize] = size(cumulativeEnergyMap);
    horizontalSeam = zeros(1,colsize);
    
    %get the minimum value at the bottom of the cum energy map
    [~, horizontalSeam(colsize)] = min(cumulativeEnergyMap(:, colsize));
    
    for i = colsize-1:-1:1
       if(horizontalSeam(i+1) == 1)
           pixSet = [...
                Inf ...
                cumulativeEnergyMap(horizontalSeam(i+1),i) ...
                cumulativeEnergyMap(horizontalSeam(i+1)+1,i)];
       elseif(horizontalSeam(i+1) == rowsize)
           pixSet = [...
                cumulativeEnergyMap(horizontalSeam(i+1)-1,i) ...
                cumulativeEnergyMap(horizontalSeam(i+1),i) ...
                Inf];
       else
           pixSet = [...
                cumulativeEnergyMap(horizontalSeam(i+1)-1,i) ...
                cumulativeEnergyMap(horizontalSeam(i+1),i) ...
                cumulativeEnergyMap(horizontalSeam(i+1)+1,i)];
       end
       [~, offset] = min(pixSet);
       offset = offset - 2;
       horizontalSeam(i) = horizontalSeam(i+1) + offset;
    end
    
end