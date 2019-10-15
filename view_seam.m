function view_seam(im, seam, seamDirection)
    [rowsize, colsize,~] = size(im);
    if(strcmp(seamDirection,'VERTICAL'))
        for i = 1:rowsize
           im(i,seam(i),:) = [255 0 0]; 
        end
    end
    if(strcmp(seamDirection, 'HORIZONTAL'))
        for j = 1:colsize
            im(seam(j),j,:) = [255 0 0];
        end
    end
    imshow(im)
end