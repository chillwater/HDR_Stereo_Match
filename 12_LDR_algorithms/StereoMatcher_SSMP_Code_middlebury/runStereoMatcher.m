% Matlab demo code accompanying the TIP paper v1.0 (2013-12-30)
% Contributed by Bumsub Ham (mimo@yonsei.ac.kr)
%clc;
%clear all;

%addpath 'algorithms'  <=remember to add manually

UseParallelToolbox = true; % Set true if you want to take advantage of the Matlab parallel computing toolbox
ParallelWorkers = 4; % How many workers should be used by the parallel computing toolbox (should be equal or less the number of available CPU cores)
%% Set up parallel computing toolbox
if (UseParallelToolbox)
    isOpen = matlabpool('size') > 0;
    if (isOpen)
        matlabpool close force local
    end
    matlabpool(ParallelWorkers)
end
%% Img name, search range and scaling parameter
only_name = 'tsukuba';
numDisp = double(disparity_max); % Maximum disparity range (16 for tsukuba, 20 for venus and 60 for teddy and cones)   <=must be float for algorithm to work
scale = 1; %scaling parameter (16 for tsukuba, 8 for venus and 4 for teddy and cones)
%%
img_name_l = ['view1.png'];
img_name_r = ['view5.png'];
result_name_l = ['disparity_pre_l.png'];
result_name_r = ['disparity_pre_r.png'];
result_name_final_l = ['disparity_l_post.png'];
result_name_finar_r = ['disparity_r_post.png'];
%% Parameters
%% initial cost and post procesing 
%% please refer Rhemann's paper [C. Rhemann, A. Hosni, M. Bleyer, C. Rother, M. Gelautz, Fast Cost-Volume Filtering for Visual Correspondence and Beyond, CVPR11]
thresColor = 15/255;    % \sigma_1 in eq. (12)
thresGrad = 2/255;      % \sigma_2 in eq. (12)
gamma = 0.11;           % (1- \Lamda) in eq. (12)
threshBorder = 3/255;   % some threshold for border pixels
gamma_c = 0.2;         % Post Processing
gamma_d = 9;            % Post Processing
r_median = 19;          % filter kernel of weighted median has size r_median \times r_median
%% RWR aggregation parameter
nei= 0 ;                 % 0: 4-neighbor 1: 8-neighbor
restart_c = 0.003 ;      % Restarting Probability
sigma_c = 50;            % parameter in eq. (4)
%% input image
img_l = double(imread(img_name_l))/255 ;
img_r = double(imread(img_name_r))/255 ;
[m,n,c] = size(img_l);
%% Compute probability map for middlebury test images
st=clock;
[Prob_l, Prob_r] = ProbabilityInferWithRWR(img_l, img_r, numDisp, thresColor,thresGrad,gamma,threshBorder,gamma_c,gamma_d,r_median,UseParallelToolbox,nei,restart_c,sigma_c);                            

fprintf(' took %.2f second\n',etime(clock,st));
% Winner take all label selection 
[unused,labels_l] = max(Prob_l,[],3);
[unused,labels_r] = max(Prob_r,[],3);
clear unused;

%% Left-right consistency check
% for left image
Y = repmat((1:m)', [1 n]);
X = repmat(1:n, [m 1]) - (labels_l-1);
X(X<1) = 1;
indices = sub2ind([m,n],Y,X);
final_labels_l = labels_l;
final_labels_l(abs(labels_l - labels_r(indices))>=1) = -1;
% for right image
Y = repmat((1:m)', [1 n]);
X = repmat(1:n, [m 1]) + (labels_r-1);
X(X>n) = n;
indices = sub2ind([m,n],Y,X);
final_labels_r = labels_r;
final_labels_r(abs(labels_r - labels_l(indices))>=1) = -1;
%% Occlusion map
occPix_l = zeros(m,n);
occPix_l(final_labels_l<0) = 255;

occPix_r = zeros(m,n);
occPix_r(final_labels_r<0) = 255;
%% Fill and filter (post-process) pixels that fail the consistency check
final_labels_l = fillPixelsReference(img_l, final_labels_l, gamma_c, gamma_d, r_median, numDisp);
final_labels_l =  medfilt2(final_labels_l,[5 5]);

final_labels_r = fillPixelsReference(img_r, final_labels_r, gamma_c, gamma_d, r_median, numDisp);
final_labels_r =  medfilt2(final_labels_r,[5 5]);

%% Save disparity map
imwrite(uint8((labels_l-1)*double(scale)),result_name_l );
imwrite(uint8((labels_r-1)*double(scale)),result_name_r );
imwrite(uint8((final_labels_l-1)*double(scale)),result_name_final_l );
imwrite(uint8((final_labels_r-1)*double(scale)),result_name_finar_r );
%{
figure(1);
imagesc(uint8((labels_l-1)*double(scale)));title('Left disparity');
figure(2);
imagesc(uint8((labels_r-1)*double(scale)));title('Right disparity');
figure(3);
imagesc(uint8((final_labels_l-1)*double(scale)));title('Left disparity w/ post processing');
figure(4);
imagesc(uint8((final_labels_r-1)*double(scale)));title('Right disparity w/ post processing');

%}