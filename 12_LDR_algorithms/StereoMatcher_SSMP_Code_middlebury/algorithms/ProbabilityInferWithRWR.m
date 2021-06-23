function [dispVol, dispVol1] = ProbabilityInferWithRWR(Il, Ir, numDisp, thresColor,thresGrad,gamma,threshBorder,gamma_c,gamma_d,r_median,UseParallelToolbox,nei,restart_c,sigma_c)

% Convert to grayscale
Il_g = rgb2gray(Il); 
Ir_g = rgb2gray(Ir);

% Mirror image
Il_1 = flipdim(Ir,2);
Ir_1 = flipdim(Il,2);

% Compute gradient in X-direction from grayscale images
fx_l = gradient(Il_g);
fx_r = gradient(Ir_g);
fx_l = fx_l+0.5; % To get a range of values between 0 to 1
fx_r = fx_r+0.5; % To get a range of values between 0 to 1
imwrite(fx_l,'gradTmpl.pgm');
imwrite(fx_r,'gradTmpr.pgm');
fx_l = single(imread('gradTmpl.pgm'))/255;
fx_r = single(imread('gradTmpr.pgm'))/255;
fx_l_1 = flipdim(fx_r,2);
fx_r_1 = flipdim(fx_l,2);

[m,n,c] = size(Il);

dispVol = ones(m,n,numDisp)*(threshBorder);
dispVol1 = ones(m,n,numDisp)*(threshBorder);

% Create initial cost volume 
for d=0:numDisp-1
    
    % Truncated AD of color images for current displacement
    tmp = ones(m,n,c)*threshBorder;
    tmp(:,(d+1):n,:) = Ir(:,1:n-d,:);
    p_color = abs(tmp - Il);
    p_color = sum(p_color,3)*0.333333333333;
    p_color = max(thresColor-p_color,0);
   % p_color = min(p_color, thresColor);
    
    % Truncated AD of gradient images for current displacement
    tmp = ones(m,n)*threshBorder;
    tmp(:,(d+1):n) = fx_r(:,1:n-d);
    p_grad = abs(tmp - fx_l); clear tmp;
    p_grad = max(thresGrad-p_grad,0);
   % p_grad = min(p_grad, thresGrad);
    
    p = gamma*p_color + (1-gamma)*p_grad; % Combined color and gradient

    clear p_grad p_color; 
    
    % Same for other view
    tmp1 = ones(m,n,c)*threshBorder;
    tmp1(:,(d+1):n,:) = Ir_1(:,1:n-d,:);
    p1_color = abs(tmp1 - Il_1);
    p1_color = sum(p1_color,3)*0.333333333333;
    p1_color = max(thresColor-p1_color,0);
   % p1_color = min(p1_color,thresColor);
    
    tmp1 = ones(m,n)*threshBorder;
    tmp1(:,(d+1):n) = fx_r_1(:,1:n-d);
    p1_grad = abs(tmp1 - fx_l_1); 
    p1_grad = max(thresGrad-p1_grad,0);
   % p1_grad = min(p1_grad,thresGrad);
    
    p1 = gamma*p1_color + (1-gamma)*p1_grad; % Combined color and gradient
    
    % Set value in cost volume
    dispVol(:,:,d+1) = p;
    dispVol1(:,:,d+1) = flipdim(p1,2);
end

clear p p1;

[X Y Z]=size(Il); N = X*Y; % image size

% Build graph with symmetric weight matrix W
if Z > 1,
    img = colorspace('Lab<-', Il); % convert color space
    img1 = colorspace('Lab<-', Il_1); % convert color space
end;
imgVals = reshape(img,N,Z); clear img;   
imgVals1 = reshape(img1,N,Z); clear img1;   
 
[points edges] = lattice(X,Y,nei);   
[points1 edges1] = lattice(X,Y,nei);   
clear points;  
clear points1;  
weights = makeweights(edges,imgVals,sigma_c);
weights1 = makeweights(edges1,imgVals1,sigma_c);
W = adjacency(edges,weights,N); clear edges weights; 
W1 = adjacency(edges1,weights1,N); clear edges1 weights1; 

%Smooth cost volume with RWR filtering
if (UseParallelToolbox)
    parfor d=0:numDisp-1 % use parallel for loop when using the parallel computing toolbox
        p = dispVol(:,:,d+1);
        q = RWR_filtering(W,p,X,Y,nei,restart_c,sigma_c);  
        
        p1 = dispVol1(:,:,d+1);
        p1 = flipdim(p1,2);        
        q1 = RWR_filtering(W1,p1,X,Y,nei,restart_c,sigma_c);
        
        dispVol(:,:,d+1) = q;
        dispVol1(:,:,d+1) = flipdim(q1,2);
    end
else
    for d=0:numDisp-1 % use regular for loop when not using the parallel computing toolbox
        
        p = dispVol(:,:,d+1);
        q = RWR_filtering(W,p,X,Y,nei,restart_c,sigma_c);

        
        p1 = dispVol1(:,:,d+1);
        p1 =  flipdim(p1,2);        

        q1 = RWR_filtering(W1,p1,X,Y,nei,restart_c,sigma_c);

        dispVol(:,:,d+1) = q;
        dispVol1(:,:,d+1) = flipdim(q1,2);
    end
end

beta = 3000;
 
for d=1:numDisp 
    dispVol(:,:,d) = exp(beta*dispVol(:,:,d));
    dispVol1(:,:,d) = exp(beta*dispVol1(:,:,d));
end

temp_sum=sum(dispVol, 3);
temp_sum2=sum(dispVol1, 3);

for d=1:numDisp 
    dispVol(:,:,d) = dispVol(:,:,d)./temp_sum;
    dispVol1(:,:,d) = dispVol1(:,:,d)./temp_sum2;
end



end