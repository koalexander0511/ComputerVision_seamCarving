function energyImg = energy_img(img)
    gray = rgb2gray(img);
    xfilter = [-1,1];
    yfilter = [-1,1].';
    dx = imfilter(double(gray), xfilter);
    dy = imfilter(double(gray), yfilter);
    
    energyImg = sqrt(dx.^2 + dy.^2);
end