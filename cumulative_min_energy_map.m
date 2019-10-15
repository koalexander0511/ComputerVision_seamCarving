function cumulativeEnergyMap = cumulative_min_energy_map(energyImg, seamDirection)
    [rowsize, colsize] = size(energyImg);
    cumulativeEnergyMap = zeros(rowsize,colsize); %initialize matrix
    
    %creating vertical cum energy map
    if(strcmp(seamDirection, "VERTICAL"))
        cumulativeEnergyMap(1,:) = energyImg(1,:);
        for i = 2:rowsize
            for j = 1:colsize
                if(j == 1) % edge case: left edge
                    prevPixels = [cumulativeEnergyMap(i-1,j), cumulativeEnergyMap(i-1,j+1)];
                elseif(j == colsize) % edge case: right edge
                    prevPixels = [cumulativeEnergyMap(i-1,j-1), cumulativeEnergyMap(i-1,j)];
                else % general case
                    prevPixels = [cumulativeEnergyMap(i-1,j-1), cumulativeEnergyMap(i-1,j), cumulativeEnergyMap(i-1,j+1)];
                end
                cumulativeEnergyMap(i,j) = energyImg(i,j) + min(prevPixels);
            end
        end
    end
    %creating horizontal cum energy map
    if(strcmp(seamDirection, 'HORIZONTAL'))
        cumulativeEnergyMap(:,1) = energyImg(:,1);
        for j = 2:colsize
            for i = 1:rowsize
                if(i == 1) % edge case: top edge
                    prevPixels = [cumulativeEnergyMap(i,j-1), cumulativeEnergyMap(i+1,j-1)];
                elseif(i == rowsize) % edge case: bottom edge
                    prevPixels = [cumulativeEnergyMap(i-1,j-1), cumulativeEnergyMap(i,j-1)];
                else % general case
                    prevPixels = [cumulativeEnergyMap(i-1,j-1), cumulativeEnergyMap(i,j-1), cumulativeEnergyMap(i+1,j-1)];
                end
                cumulativeEnergyMap(i,j) = energyImg(i,j) + min(prevPixels);
            end
        end
    end
end