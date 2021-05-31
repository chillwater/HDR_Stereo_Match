
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);
view1Files = {'Exp0/view1.png', 'Exp1/view1.png', 'Exp2/view1.png'};
view5Files = {'Exp0/view5.png', 'Exp1/view5.png', 'Exp2/view5.png'};
for i=1:folderCount
   cd(foldersList{i});
   
   subfolderList=ListSubfolders('.');
   cd(subfolderList{1});
   subfolderList{1}
   subsubfolderList=ListSubfolders('.'); %Illumination Folders
   
   subsubfolderSize=size(subsubfolderList); %Illumination folder count
   subsubfolderCount=subsubfolderSize(1); % Ilumination folder real count
   status=fopen('disp1.png');
   if status > 1
   %get max disparity and min disparity from ground truth
   ground_truth=imread('disp1.png');
   disparity_min=min(min(ground_truth));
   disparity_max=max(max(ground_truth));
   
    
   
   for j=1:subsubfolderCount   % 3 illuminations
       cd(subsubfolderList{j});
       % set elapsed time
       
       %==========3 illuminations
       % exposure 0
     
       %{
           st=clock;
           %convert images to grayscale
           view1=rgb2gray(imread('view1_INThdr.png'));
           view5=rgb2gray(imread('view5_INThdr.png'));

           %compute disparity map
           disparityMap = disparity(view1,view5,'DisparityRange', [disparity_min, ceil((disparity_max-disparity_min)/16)*16]);
           marker_idx = (disparityMap == disparity_min);
           disparityMap(marker_idx) = min(disparityMap(~marker_idx));
           imwrite(uint8(disparityMap),'semiGlob_result.png');
       
       fprintf('Took %.2f second\n',etime(clock,st));     
      %}
        %=============================================================================================
        st=clock;
        %convert images to grayscale
        view1=rgb2gray(imread('view1_INThdr_times_1.png'));
        view5=rgb2gray(imread('view5_INThdr_times_1.png'));

        %compute disparity map
        disparityMap = disparity(view1,view5,'DisparityRange', [disparity_min, ceil((disparity_max-disparity_min)/16)*16]);
        marker_idx = (disparityMap == disparity_min);
        disparityMap(marker_idx) = min(disparityMap(~marker_idx));
        imwrite(uint8(disparityMap),'semiGlob_result_times_1.png');
        fprintf('Took %.2f second\n',etime(clock,st));        
        %==============================================================================================
        %=============================================================================================
        st=clock;
        %convert images to grayscale
        view1=rgb2gray(imread('view1_INThdr_times_2.png'));
        view5=rgb2gray(imread('view5_INThdr_times_2.png'));

        %compute disparity map
        disparityMap = disparity(view1,view5,'DisparityRange', [disparity_min, ceil((disparity_max-disparity_min)/16)*16]);
        marker_idx = (disparityMap == disparity_min);
        disparityMap(marker_idx) = min(disparityMap(~marker_idx));
        imwrite(uint8(disparityMap),'semiGlob_result_times_2.png');
        fprintf('Took %.2f second\n',etime(clock,st));        
        %==============================================================================================
        %=============================================================================================
        st=clock;
        %convert images to grayscale
        view1=rgb2gray(imread('view1_INThdr_times_4.png'));
        view5=rgb2gray(imread('view5_INThdr_times_4.png'));

        %compute disparity map
        disparityMap = disparity(view1,view5,'DisparityRange', [disparity_min, ceil((disparity_max-disparity_min)/16)*16]);
        marker_idx = (disparityMap == disparity_min);
        disparityMap(marker_idx) = min(disparityMap(~marker_idx));
        imwrite(uint8(disparityMap),'semiGlob_result_times_4.png');
        fprintf('Took %.2f second\n',etime(clock,st));        
        %==============================================================================================        
        %=============================================================================================
        st=clock;
        %convert images to grayscale
        view1=rgb2gray(imread('view1_INThdr_times_256.png'));
        view5=rgb2gray(imread('view5_INThdr_times_256.png'));

        %compute disparity map
        disparityMap = disparity(view1,view5,'DisparityRange', [disparity_min, ceil((disparity_max-disparity_min)/16)*16]);
        marker_idx = (disparityMap == disparity_min);
        disparityMap(marker_idx) = min(disparityMap(~marker_idx));
        imwrite(uint8(disparityMap),'semiGlob_result_times_256.png');
        fprintf('Took %.2f second\n',etime(clock,st));        
        %==============================================================================================                  
        

       

       cd('..');    
   end
   else
     test = 'No Ground truth of this stereo pair'
   end
  
   
   cd('..');
   cd('..');
    
end