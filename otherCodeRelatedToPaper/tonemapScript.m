
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);



for i=1:folderCount     %folder level with "Aloe-2views-3illum-3exp"
   cd(foldersList{i});
   
   subfolderList=ListSubfolders('.');
   cd(subfolderList{1});
   subfolderList{1}
   
   subsubfolderList=ListSubfolders('.');
   subsubfolderSize=size(subsubfolderList);
   subsubfolderCount=subsubfolderSize(1); %illumination_count
   
   
   for j=1:subsubfolderCount   % j illuminations
       cd(subsubfolderList{j});
      
       %read hdr files and multiply by 2 (shift bits of data from hdr)
       view1=(hdrread('view1_Original.hdr'));
       view5=(hdrread('view5_Original.hdr'));
        
       view1_tonemap=tonemap(view1);
       view5_tonemap=tonemap(view5);
       
       imwrite(view1_tonemap,'view1_tonemap.png');
       imwrite(view5_tonemap,'view5_tonemap.png');
       cd('..');    
   end
   
  
   
   cd('..');
   cd('..');
    
end