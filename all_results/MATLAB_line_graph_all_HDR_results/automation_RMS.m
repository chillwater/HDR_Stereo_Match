
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);

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
	   FileNamet=strcat(subfolderList(1), '_', subsubfolderList{j}, '_RMS');
       FileName=FileNamet{1}
      % FileName='BadPixelRate';
	   matlab_createPlot_RMS;
       
       cd('..');
      
      
    %   cd('..');    
   end
  
   
   cd('..');
   cd('..');
    
end