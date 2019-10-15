function [reducedColorImg, reducedEnergyImg] = decrease_width(im, energyImg)
    [rowsize, colsize, ~] = size(im);
    reducedColorImg = uint8(zeros(rowsize, colsize-1, 3));
    reducedEnergyImg = zeros(rowsize, colsize-1);
    
    cumulativeEnergyMap = cumulative_min_energy_map(energyImg, 'VERTICAL');
    seam = find_vertical_seam(cumulativeEnergyMap);
    for i = 1 : rowsize
        if(seam(i) == 1)
            reducedColorImg(i,:,:) = im(i, 2:colsize, :);
            reducedEnergyImg(i,:) = energyImg(i,2:colsize);
            
        elseif(seam(i) == colsize)
            reducedColorImg(i,:,:) = im(i, 1:colsize-1, :);
            reducedEnergyImg(i,:) = energyImg(i, 1:colsize-1);
            
        else
            reducedColorImg(i,:,:) = [im(i,1:seam(i)-1,:) im(i,seam(i)+1:colsize,:)];
            reducedEnergyImg(i,:) = [energyImg(i,1:seam(i)-1) energyImg(i,seam(i)+1:colsize)];
        end
    end
    
end