function [ outputImage ] = HDRtoGray( image_name )
% convert image to grayscale
i = hdrread(image_name);
outputImage = .299*i(:,:,1) + .587*i(:,:,2) + .114*i(:,:,3);

end

