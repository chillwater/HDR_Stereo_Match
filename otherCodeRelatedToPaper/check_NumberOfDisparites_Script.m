
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);

for i=1:folderCount
   cd(foldersList{i})
   
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
   
    
   
   
       %=================================================check uniqueness
       % number of disparities in each ground truth
       size(unique(ground_truth))
       
       

   
  
   
   cd('..');
   cd('..');
   end    
end