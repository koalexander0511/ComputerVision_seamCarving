
%problem 3
img = imread("inputSeamCarvingPrague.jpg");
energyImg = energy_img(img);
imagesc(energyImg);
colormap gray;
pause;

colormap('default');
cmemV = cumulative_min_energy_map(energyImg, 'VERTICAL');
imagesc(cmemV);
pause;

cmemH = cumulative_min_energy_map(energyImg, 'HORIZONTAL');
imagesc(cmemH);
pause;

%problem 4
seamH = find_horizontal_seam(cmemH);
seamV = find_vertical_seam(cmemV);

view_seam(img, seamH, 'HORIZONTAL');
pause;
view_seam(img, seamV, 'VERTICAL');
pause;

%problem6
%resizeStats("img1.jpg", 400, 600);
%pause;
resizeStats("img2.jpg", 200, 400);
%pause;
%resizeStats("img3.jpg", 100, 300);
