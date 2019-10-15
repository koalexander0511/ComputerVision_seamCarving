function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
    [rowsize, colsize] = size(cumulativeEnergyMap);
    verticalSeam = zeros(1,rowsize);
    
    %get the minimum value at the bottom of the cum energy map
    [~, verticalSeam(rowsize)] = min(cumulativeEnergyMap(rowsize, :));
    
    for i = rowsize-1:-1:1
        if(verticalSeam(i+1) == 1)
            pixSet = [...
                Inf ...
                cumulativeEnergyMap(i,verticalSeam(i+1)) ...
                cumulativeEnergyMap(i,verticalSeam(i+1)+1)];
            
        elseif(verticalSeam(i+1) == colsize)
            pixSet = [...
                cumulativeEnergyMap(i,verticalSeam(i+1)-1) ...
                cumulativeEnergyMap(i,verticalSeam(i+1)) ...
                Inf];
            
        else
            pixSet = [...
                cumulativeEnergyMap(i,verticalSeam(i+1)-1) ...
                cumulativeEnergyMap(i,verticalSeam(i+1)) ...
                cumulativeEnergyMap(i,verticalSeam(i+1)+1)];
            
        end
        
        [~, offset] = min(pixSet);
        offset = offset - 2;
        verticalSeam(i) = verticalSeam(i+1) + offset;
    end
end