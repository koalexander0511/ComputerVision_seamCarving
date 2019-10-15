function [reducedColorImg, reducedEnergyImg] = decrease_height(im, energyImg)
    [rowsize, colsize, ~] = size(im);
    reducedColorImg = uint8(zeros(rowsize-1, colsize, 3));
    reducedEnergyImg = zeros(rowsize-1, colsize);
    
    cumulativeEnergyMap = cumulative_min_energy_map(energyImg, 'HORIZONTAL');
    seam = find_horizontal_seam(cumulativeEnergyMap);
    for j = 1 : colsize
        if(seam(j) == 1)
            reducedColorImg(:,j,:) = im(2:rowsize, j, :);
            reducedEnergyImg(:,j) = energyImg(2:rowsize,j);
            
        elseif(seam(j) == rowsize)
            reducedColorImg(:,j,:) = im(1:rowsize-1, j, :);
            reducedEnergyImg(:,j) = energyImg(1:rowsize-1, j);
            
        else
            reducedColorImg(:,j,:) = [im(1:seam(j)-1,j,:); im(seam(j)+1:rowsize,j,:)];
            reducedEnergyImg(:,j) = [energyImg(1:seam(j)-1,j); energyImg(seam(j)+1:rowsize,j)];
        end
    end
    
end