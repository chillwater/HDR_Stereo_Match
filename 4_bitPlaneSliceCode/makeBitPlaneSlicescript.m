
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);



for i=1:folderCount
   cd(foldersList{i});
   
   subfolderList=ListSubfolders('.');
   cd(subfolderList{1});
   subfolderList{1}
   
   subsubfolderList=ListSubfolders('.');
   subsubfolderSize=size(subsubfolderList);
   subsubfolderCount=subsubfolderSize(1); %illumination_count
   
   
   for j=1:subsubfolderCount   % 3 illuminations
       cd(subsubfolderList{j});
       % set elapsed time
       st=clock;
       %prep files for bit plane slicing
       view1=(hdrread('view1_Original.hdr')./256);
       view5=(hdrread('view5_Original.hdr')./256);
       
       mkdir('bit_plane_slice_stereo');
       cd('bit_plane_slice_stereo');       
       
       view1_exponent=exponent_extraction(view1);
       view5_exponent=exponent_extraction(view5);
       view1_mantissa = mantissa_expansion(view1);
       view5_mantissa = mantissa_expansion(view5);
       view1_result=multiply_mantissa_and_exponent(view1_mantissa,view1_exponent);
       view5_result=multiply_mantissa_and_exponent(view5_mantissa,view5_exponent);
       
       scriptBitPlaneSlice;  %modify this script "scriptBitPlaneSlice.m" to control how many slices to make         
                             %look for this line to modify----- parfor
                             %slice_level=45:63-----
       %print elapsed time
       fprintf(' took %.2f second\n',etime(clock,st));
       
       cd('..');
       cd('..');    
   end
   
  
   
   cd('..');
   cd('..');
    
end