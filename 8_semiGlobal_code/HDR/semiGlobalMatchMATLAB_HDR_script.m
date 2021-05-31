
foldersList=ListSubfolders('.');
folderSize=size(foldersList);
folderCount=folderSize(1);
view1Files = {'Exp0/view1.png', 'Exp1/view1.png', 'Exp2/view1.png'};
view5Files = {'Exp0/view5.png', 'Exp1/view5.png', 'Exp2/view5.png'};
for i=1:folderCount %different scene folders
   cd(foldersList{i});
   
   % go into sub-folder(into real scene directory
   subfolderList=ListSubfolders('.');
   cd(subfolderList{1});
  
       subfolderList{1} % for output to console purposes only- outputs scene name
       
       subsubfolderList=ListSubfolders('.');
       status=fopen('disp1.png');
       if status > 1
       %get max disparity and min disparity from ground truth
       ground_truth=imread('disp1.png');
       disparity_min=min(min(ground_truth));
       disparity_max=max(max(ground_truth));
        illumFoldersList=ListSubfolders('.');
        illumfolderSize=size(illumFoldersList);
        illumfolderCount=illumfolderSize(1);
       for j=1:illumfolderCount   % 3 illuminations
           cd(subsubfolderList{j});
           cd('bit_plane_slice_stereo');

            %================================================================================
           %convert images to grayscale
           BaseName1='view1_slice_';
           BaseName5='view5_slice_';
           for images=45:45  %control how many stereo pairs is needed to use  
               FileName1=[BaseName1,num2str(images),'.hdr'];
               FileName5=[BaseName5,num2str(images),'.hdr'];
               
               view1=HDRtoGray(FileName1);
               view5=HDRtoGray(FileName5);
               st=clock;
               %compute disparity map
               disparityMap = disparity(view1,view5,'DisparityRange', [disparity_min, ceil((disparity_max-disparity_min)/16)*16]);
               marker_idx = (disparityMap == disparity_min);
               disparityMap(marker_idx) = min(disparityMap(~marker_idx));
               fprintf('Took %.2f second\n',etime(clock,st));
               imwrite(uint8(disparityMap), strcat('disparity_',num2str(images),'.png'));            
               
           end
            %================================================================================
           cd('..');
           cd('..');    
       end
       else
         test = 'No Ground truth of this stereo pair'
       end
  
   
   cd('..');
   
   cd('..');
    
end