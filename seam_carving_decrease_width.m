pragueImg = imread("inputSeamCarvingPrague.jpg");
energyPrague = energy_img(pragueImg);
for n = 1:100
    [pragueImg, energyPrague] = decrease_width(pragueImg, energyPrague);
end
imwrite(pragueImg, "outputReduceWidthPrague.png");

mallImg = imread("inputSeamCarvingMall.jpg");
energyMall = energy_img(mallImg);
for n = 1:100
    [mallImg, energyMall] = decrease_width(mallImg, energyMall);
end
imwrite(mallImg, "outputReduceWidthMall.png")