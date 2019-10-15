pragueImg = imread("inputSeamCarvingPrague.jpg");
energyPrague = energy_img(pragueImg);
for n = 1:50
    [pragueImg, energyPrague] = decrease_height(pragueImg, energyPrague);
end
imwrite(pragueImg, "outputReduceHeightPrague.png");