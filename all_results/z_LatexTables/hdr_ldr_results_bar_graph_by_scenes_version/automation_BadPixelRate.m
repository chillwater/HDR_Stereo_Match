
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);
%view1Files = {'Exp0/view1.png', 'Exp1/view1.png', 'Exp2/view1.png'};
%view5Files = {'Exp0/view5.png', 'Exp1/view5.png', 'Exp2/view5.png'};
for i=1:folderCount   %scenes folders  (ex.Aloe-2views-3illum-3exp)
   cd(foldersList{i})   %change directory into the above folder
   
   subfolderList=ListSubfolders('.');
   
   cd(subfolderList{1});  %(ex. Aloe)
   
   subfolderList{1}
   subsubfolderList=ListSubfolders('.');  %Get Illum1 Illum2 Illum3 etc..
 
   for j=1:numel(subsubfolderList)   % different illuminations
       
       cd(subsubfolderList{j});
       %run script to create plot
		BarTitle=strcat(subfolderList(1),' - ', subsubfolderList{j})
	   FileNamet=strcat(subfolderList(1), '_', subsubfolderList{j}, '_BadPixelRate');
       FileName=FileNamet{1}
      % FileName='BadPixelRate';
	   matlab_createBar_BadPixelRate;
       
       cd('..');
      
      
    %   cd('..');    
   end
  
   
   cd('..');
   cd('..');
    
end