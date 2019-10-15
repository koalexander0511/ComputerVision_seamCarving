function resizeStats(imgname, shrinkW,shrinkH)
    img = imread(imgname);
    [rowsize, colsize, ~] = size(img);
    energyImg = energy_img(img);
    
    imgResize = img;
    energyImgResize = energyImg;
    
    for n = 1:shrinkW
       [imgResize, energyImgResize] = decrease_width(imgResize, energyImgResize);
    end
    for n = 1:shrinkH
        [imgResize, energyImgResize] = decrease_height(imgResize, energyImgResize);
    end
    
    %subplot(2,2,1);
    imshow(img);
    %title('Original');
    pause;
    %subplot(2,2,3);
    imshow(imgResize);
    %title('Content Aware Resizing');
    pause;
    %subplot(2,2,4);
    imshow(imresize(img, [rowsize-shrinkH, colsize-shrinkW]));
    %title('Simple Resizing');
    pause;
end