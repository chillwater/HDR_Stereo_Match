% function example_referenceForCVPR11(testimage,r,eps,thresColor,thresGrad,gamma,threshBorder,gamma_c,gamma_d,r_median,UseParallelToolbox)
function example_referenceForCVPR11(pair, value,testimage,r,eps,thresColor,thresGrad,gamma,threshBorder,gamma_c,gamma_d,r_median,UseParallelToolbox)
                                       
%===============
BaseName1='view1_slice_';
BaseName2='view5_slice_';
%===============

% Load input images and set disparity ranges
if (testimage==1)
    Il = single(imread('.\img_stereo\left.ppm')) / 255;
    Ir = single(imread('.\img_stereo\right.ppm')) / 255;
    numDisp = 15; % Maximum disparity range
elseif (testimage==2)
    Il = double(imread('.\img_stereo\teddy_left.ppm')) / 255;
    Ir = double(imread('.\img_stereo\teddy_right.ppm')) / 255;
    numDisp = 59; % Maximum disparity range
elseif (testimage==3)
    Il = double(imread('.\img_stereo\cones_left.ppm')) / 255;
    Ir = double(imread('.\img_stereo\cones_right.ppm')) / 255;
    numDisp = 59; % Maximum disparity range
elseif (testimage==4)
    Il = double(imread('.\img_stereo\venus_left.ppm')) / 255;
    Ir = double(imread('.\img_stereo\venus_right.ppm')) / 255;
    numDisp = 32; % Maximum disparity range
elseif (testimage==5)
    Il = double(hdrread('.\img_stereo\Aloe_view1_HDRShop.hdr'));
    Ir = double(hdrread('.\img_stereo\Aloe_view5_HDRShop.hdr'));
    numDisp = 90; % Maximum disparity range    
elseif ( testimage==6)
    Il = double(hdrread('.\img_stereo\Art_view1_HDRShop.hdr'));
    Ir = double(hdrread('.\img_stereo\Art_view5_HDRShop.hdr'));
    numDisp = 67; % Maximum disparity range        
elseif ( testimage==7)
    Il = double(hdrread('.\img_stereo\Bowling1_view1_HDRShop.hdr'));
    Ir = double(hdrread('.\img_stereo\Bowling1_view5_HDRShop.hdr'));
    numDisp = 97; % Maximum disparity range   
elseif ( testimage==8)
    Il = double(hdrread('.\img_stereo\Reindeer_view1_HDRShop_auto.hdr'));
    Ir = double(hdrread('.\img_stereo\Reindeer_view5_HDRShop_auto.hdr'));
    numDisp = 77; % Maximum disparity range   
elseif (testimage==9)
    Il = double(imread('.\img_stereo\Aloe_view1.png')) / 255;
    Ir = double(imread('.\img_stereo\Aloe_view5.png')) / 255;
    numDisp = 90; % Maximum disparity range    
elseif (testimage==10)
    Il = double(imread('.\img_stereo\Art_view1.png')) / 255;
    Ir = double(imread('.\img_stereo\Art_view5.png')) / 255;
    numDisp = 67; % Maximum disparity range  
elseif (testimage==11)
    Il = double(imread('.\img_stereo\Bowling1_view1.png')) / 255;
    Ir = double(imread('.\img_stereo\Bowling1_view5.png')) / 255;
    numDisp = 97; % Maximum disparity range  
elseif (testimage==12)
    Il = double(imread('.\img_stereo\Reindeer_view1.png')) / 255;
    Ir = double(imread('.\img_stereo\Reindeer_view5.png')) / 255;
    numDisp = 77; % Maximum disparity range  
elseif (testimage==13)
    Il = double(hdrread('.\img_stereo\Aloe_view1_Matlab_HDR.hdr'))/255;
    Ir = double(hdrread('.\img_stereo\Aloe_view5_Matlab_HDR.hdr'))/255;
    numDisp = 90; % Maximum disparity range    
elseif (testimage==14)
    Il = double(hdrread('Reindeer_view1_Matlab_normalized.hdr'));
    Ir = double(hdrread('Reindeer_view5_Matlab_normalized.hdr'));
    numDisp = 67; % Maximum disparity range   
elseif(testimage == 15)
    view1_file_name = strcat('view1_Original.hdr');
    view5_file_name = strcat('view5_Original.hdr');
    Il = double(hdrread(view1_file_name)./256);
    Ir = double(hdrread(view5_file_name)./256);
%     Il = double(hdrread('.\view1\view1_slice_57.hdr'));
%     Ir = double(hdrread('.\view5\view5_slice_57.hdr'));
    numDisp = 67; % Maximum disparity range   
   pair=6;%set disparity

else
   view1_file_name=strcat(BaseName1,  num2str(testimage),'.hdr');
   view5_file_name=strcat(BaseName2,  num2str(testimage),'.hdr');
   Il = double(hdrread(view1_file_name));
   Ir = double(hdrread(view5_file_name));
    
   switch pair 
       case 1
           numDisp = 160;
       case 2
           numDisp = 201;
       case 3
           numDisp = 215;
       case 4
           numDisp = 230;
   end
end
uint8(pair)
   switch uint8(pair)
       case 1
           numDisp = 160;
       case 2
           numDisp = 201;
       case 3
           numDisp = 215;
       case 4
           numDisp = 230;
   end

numDisp=double(numDisp);


% Convert to grayscale
%Il_g = rgb2gray(Il);
%Ir_g = rgb2gray(Ir);
 Il_g = HDRtoGray(view1_file_name);
 Ir_g = HDRtoGray(view5_file_name);

% Mirror image
Il_1 = flipdim(Ir,2);
Ir_1 = flipdim(Il,2);

% Compute gradient in X-direction from grayscale images
fx_l = gradient(Il_g);
fx_r = gradient(Ir_g);
fx_l = fx_l+0.5; % To get a range of values between 0 to 1
fx_r = fx_r+0.5; % To get a range of values between 0 to 1
imwrite(fx_l,strcat(num2str(testimage),'_gradTmpl.pgm'));
imwrite(fx_r,strcat(num2str(testimage),'_gradTmpr.pgm'));
% fx_l = single(imread(strcat(num2str(testimage),'_gradTmpl.pgm')))/255;
% fx_r = single(imread(strcat(num2str(testimage),'_gradTmpr.pgm')))/255;
fx_l = single(imread(strcat(num2str(testimage),'_gradTmpl.pgm')));
fx_r = single(imread(strcat(num2str(testimage),'_gradTmpr.pgm')));
fx_l_1 = flipdim(fx_r,2);
fx_r_1 = flipdim(fx_l,2);

[m,n,c] = size(Il);

dispVol = ones(m,n,numDisp)*(threshBorder);
dispVol1 = ones(m,n,numDisp)*(threshBorder);

% Create initial cost volume (eq. (5) in the paper)
for d=1:numDisp
    
    % Truncated SAD of color images for current displacement
    tmp = ones(m,n,c)*threshBorder;
    tmp(:,(d+1):n,:) = Ir(:,1:n-d,:);
    p_color = abs(tmp - Il);
    p_color = sum(p_color,3)*0.333333333333;
    p_color = min(p_color,thresColor);
    
    % Truncated SAD of gradient images for current displacement
    tmp = ones(m,n)*threshBorder;
    tmp(:,(d+1):n) = fx_r(:,1:n-d);
    p_grad = abs(tmp - fx_l);
    p_grad = min(p_grad,thresGrad);
    
    p = gamma*p_color + (1-gamma)*p_grad; % Combined color and gradient
    
    % Same for other view
    tmp1 = ones(m,n,c)*threshBorder;
    tmp1(:,(d+1):n,:) = Ir_1(:,1:n-d,:);
    p1_color = abs(tmp1 - Il_1);
    p1_color = sum(p1_color,3)*0.333333333333;
    p1_color = min(p1_color,thresColor);
    
    tmp1 = ones(m,n)*threshBorder;
    tmp1(:,(d+1):n) = fx_r_1(:,1:n-d);
    p1_grad = abs(tmp1 - fx_l_1);
    p1_grad = min(p1_grad,thresGrad);
    
    p1 = gamma*p1_color + (1-gamma)*p1_grad; % Combined color and gradient
    
    % Set value in cost volume
    dispVol(:,:,d) = p;
    dispVol1(:,:,d) = flipdim(p1,2);
end

% Smooth cost volume with guided filter (using eq. (1) with weights in (4))
if (UseParallelToolbox)
    parfor d=1:numDisp % use parallel for loop when using the parallel computing toolbox
        p = dispVol(:,:,d);
        p1 = dispVol1(:,:,d);
        
        q = guidedfilter_color(Il, double(p), r, eps);
        p1 =  flipdim(p1,2);
        q1 = guidedfilter_color(Il_1, double(p1), r, eps);
        
        dispVol(:,:,d) = q;
        dispVol1(:,:,d) = flipdim(q1,2);
    end
else
    for d=1:numDisp % use regular for loop when not using the parallel computing toolbox
        p = dispVol(:,:,d);
        p1 = dispVol1(:,:,d);
        
        q = guidedfilter_color(Il, double(p), r, eps);
        p1 =  flipdim(p1,2);
        q1 = guidedfilter_color(Il_1, double(p1), r, eps);
        
        dispVol(:,:,d) = q;
        dispVol1(:,:,d) = flipdim(q1,2);
    end
end

% Winner take all label selection (eq. (2))
[unused,labels_left] = min(dispVol,[],3);
[unused,labels_right] = min(dispVol1,[],3);

% Left-right consistency check
Y = repmat((1:m)', [1 n]);
X = repmat(1:n, [m 1]) - labels_left;
X(X<1) = 1;
indices = sub2ind([m,n],Y,X);

final_labels = labels_left;
final_labels(abs(labels_left - labels_right(indices))>=1) = -1;

% Fill and filter (post-process) pixels that fail the consistency check
inputLabels = final_labels;
final_labels = fillPixelsReference(Il, inputLabels, gamma_c, gamma_d, r_median, numDisp);

% Show final disparity map

%figure, imagesc(final_labels)
%figure, imagesc(final_labels)
% K = mat2gray(final_labels);
% imshow(K)

disparity_file_name = strcat('disparity_',  num2str(value),'.png');
imwrite(uint8(final_labels), disparity_file_name);

%imwrite(K,'disparity_sliced_57.png')

end