function imgEq = imageHistogramEq(img)

  % Prepare image
  img = im2uint8(img);
  cres = size(img, 3);

  imgEq = img;
  for c = 1 : cres
    imgC = img(:,:,c);
    imgEqC = histeq(imgC);
    imgEq(:,:,c) = imgEqC;
  end
end
