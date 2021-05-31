
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);
%view1Files = {'Exp0/view1.png', 'Exp1/view1.png', 'Exp2/view1.png'};
%view5Files = {'Exp0/view5.png', 'Exp1/view5.png', 'Exp2/view5.png'};
for i=1:folderCount
   cd(foldersList{i})
   
   subfolderList=ListSubfolders('.');
   cd(subfolderList{1});
   subfolderList{1}
   subsubfolderList=ListSubfolders('.');
   status=fopen('disp1.png');
   if status > 1
   %get max disparity and min disparity from ground truth
   ground_truth=imread('disp1.png');    
   disparity_min=min(min(ground_truth));   %min disparity
   disparity_max=max(max(ground_truth));   %max disparity
   disparity_max
   for j=1:numel(subsubfolderList)   % different illuminations
       
       cd(subsubfolderList{j});
       %====hdr files
       cd('Exp0');
       runStereoMatcher;
       cd('..');
       cd('Exp1');
       runStereoMatcher;
       cd('..');
       cd('Exp2');
       runStereoMatcher;
       cd('..');
    
       
       
       cd('..');
       %bit plane stereo matching use
       
       %{
       st=clock;
       cd(subfolderList{j});
       %cd('Illum1');
       cd('bit_plane_slice_stereo');
       runStereoMatcher;
       cd('..');
       cd('..');
       fprintf('%s  took %.2f second\n', subsubfolderList{j},etime(clock,st));       
       %}
       %{
       % set elapsed time
       st=clock;
       %==========3 illuminations
       % exposure 0
       cd('Exp0');
           %convert images to grayscale
           view1=rgb2gray(imread('view1.png'));
           view5=rgb2gray(imread('view5.png'));

           %compute disparity map
           disparityMap = disparity(view1,view5,'DisparityRange', [disparity_min, ceil((disparity_max-disparity_min)/16)*16]);
           marker_idx = (disparityMap == disparity_min);
           disparityMap(marker_idx) = min(disparityMap(~marker_idx));
           imwrite(uint8(disparityMap),'semiGlob_result.png');
       cd('..');
       fprintf('Exp0 took %.2f second\n',etime(clock,st));
       st=clock;
       % exposure 1
       cd('Exp1');
           %convert images to grayscale
           view1=rgb2gray(imread('view1.png'));
           view5=rgb2gray(imread('view5.png'));

           %compute disparity map
           disparityMap = disparity(view1,view5,'DisparityRange', [disparity_min, ceil((disparity_max-disparity_min)/16)*16]);
           marker_idx = (disparityMap == disparity_min);
           disparityMap(marker_idx) = min(disparityMap(~marker_idx));
           imwrite(uint8(disparityMap),'semiGlob_result.png');
       cd('..');
       fprintf('Exp1 took %.2f second\n',etime(clock,st));
       st=clock;       
       % exposure 2
       cd('Exp2');
           %convert images to grayscale
           view1=rgb2gray(imread('view1.png'));
           view5=rgb2gray(imread('view5.png'));

           %compute disparity map
           disparityMap = disparity(view1,view5,'DisparityRange', [disparity_min, ceil((disparity_max-disparity_min)/16)*16]);
           marker_idx = (disparityMap == disparity_min);
           disparityMap(marker_idx) = min(disparityMap(~marker_idx));
           imwrite(uint8(disparityMap),'semiGlob_result.png');
       cd('..');
       fprintf('Exp2 took %.2f second\n',etime(clock,st));       
%}
       

    %   cd('..');    
   end
   else
     test = 'No Ground truth of this stereo pair'
   end
  
   
   cd('..');
   cd('..');
    
end