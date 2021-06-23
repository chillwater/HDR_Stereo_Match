
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
 
   for j=1:numel(subsubfolderList)   % different illuminations
       
       cd(subsubfolderList{j});
       %run script to create plot
		PlotTitle=strcat(subfolderList(1),' - ', subsubfolderList{j});
	   FileNamet=strcat(subfolderList(1), '_', subsubfolderList{j}, '_BadPixelRate');
       FileName=FileNamet{1}
      % FileName='BadPixelRate';
	   matlab_createPlot_BadPixelRate;
       
       cd('..');
      
      
    %   cd('..');    
   end
  
   
   cd('..');
   cd('..');
    
end