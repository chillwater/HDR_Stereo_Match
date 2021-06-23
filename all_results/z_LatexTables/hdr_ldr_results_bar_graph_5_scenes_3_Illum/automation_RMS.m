
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
 
   
       
   cd('CostFilter'); % change into CostFilter directory
	    BarTitle=strcat(subfolderList(1),' - CostFilter')
        %set file name
	    FileNamet=strcat(subfolderList(1), '_CostFilter_RMS');
        FileName=FileNamet{1}
        display_legend = 0; %dont display legend
	    matlab_createBar_RMS;       %run script to create plot
   cd('..');
   cd('SemiGlob'); % change into SemiGlob directory
	    BarTitle=strcat(subfolderList(1),' - SemiGlob')
        %set file name
	    FileNamet=strcat(subfolderList(1), '_SemiGlob_RMS');
        FileName=FileNamet{1}
        display_legend = 0; %dont display legend
	    matlab_createBar_RMS;                     %run script to create plot
   cd('..');
   cd('SSMP'); % change into SSMP directory
	    BarTitle=strcat(subfolderList(1),' -SSMP')
        %set file name
	    FileNamet=strcat(subfolderList(1), '_SSMP_RMS');
        FileName=FileNamet{1}
        display_legend = 0; %dont display legend
	    matlab_createBar_RMS;              %run script to create plot
       
   cd('..');
  
   
   cd('..');
   cd('..');
    
end