
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
       % set elapsed time
       %==========================================================
       %read hdr files and multiply by 2 (shift bits of data from hdr)
       view1_times_2=(hdrread('view1_Original.hdr'));
       view5_times_2=(hdrread('view5_Original.hdr'));
       
       %convert double to uint8, truncating other bits
       view1_INT_times_2 = uint8(view1_times_2);
       view5_INT_times_2 = uint8(view5_times_2);
       
       %save created INT_HDR file
       imwrite(view1_INT_times_2,'view1_INThdr_times_1.png');
       imwrite(view5_INT_times_2,'view5_INThdr_times_1.png');
       %==========================================================
       
       
       %==========================================================
       %read hdr files and multiply by 2 (shift bits of data from hdr)
       view1_times_2=(hdrread('view1_Original.hdr')*2);
       view5_times_2=(hdrread('view5_Original.hdr')*2);
       
       %convert double to uint8, truncating other bits
       view1_INT_times_2 = uint8(view1_times_2);
       view5_INT_times_2 = uint8(view5_times_2);
       
       %save created INT_HDR file
       imwrite(view1_INT_times_2,'view1_INThdr_times_2.png');
       imwrite(view5_INT_times_2,'view5_INThdr_times_2.png');
       %==========================================================

       %==========================================================
       %read hdr files and multiply by 2 (shift bits of data from hdr)
       view1_times_2=(hdrread('view1_Original.hdr')*4);
       view5_times_2=(hdrread('view5_Original.hdr')*4);
       
       %convert double to uint8, truncating other bits
       view1_INT_times_2 = uint8(view1_times_2);
       view5_INT_times_2 = uint8(view5_times_2);
       
       %save created INT_HDR file
       imwrite(view1_INT_times_2,'view1_INThdr_times_4.png');
       imwrite(view5_INT_times_2,'view5_INThdr_times_4.png');
       %==========================================================       
       %==========================================================
       %read hdr files and multiply by 2 (shift bits of data from hdr)
       view1_times_2=(hdrread('view1_Original.hdr')*256);
       view5_times_2=(hdrread('view5_Original.hdr')*256);
       
       
       view1_INT_times_2 = uint16(view1_times_2);
       view5_INT_times_2 = uint16(view5_times_2);
       
       %save created INT_HDR file
       imwrite(view1_INT_times_2,'view1_INThdr_times_256.png');
       imwrite(view5_INT_times_2,'view5_INThdr_times_256.png');
       %==========================================================          
       cd('..');    
   end
   
  
   
   cd('..');
   cd('..');
    
end