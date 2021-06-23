
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);
view1Files = {'Exp0/view1.png', 'Exp1/view1.png', 'Exp2/view1.png'};
view5Files = {'Exp0/view5.png', 'Exp1/view5.png', 'Exp2/view5.png'};
for i=1:folderCount
   cd(foldersList{i});
   
   subfolderList=ListSubfolders('.');
   cd(subfolderList{1});
   max(max(imread('disp1.png')))
   

   
  
   
   cd('..');
   cd('..');
    
end