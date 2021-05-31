function [ outputImage ] = HDRtoGray_matrix( image_matrix )
% convert image to grayscale
outputImage = .299*image_matrix(:,:,1) + .587*image_matrix(:,:,2) + .114*image_matrix(:,:,3);

end

