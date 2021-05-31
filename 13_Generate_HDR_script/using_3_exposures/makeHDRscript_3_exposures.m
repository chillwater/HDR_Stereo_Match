
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);
view1Files = {'Exp0/view1.png', 'Exp1/view1.png', 'Exp2/view1.png'};
view5Files = {'Exp0/view5.png', 'Exp1/view5.png', 'Exp2/view5.png'};
for i=1:folderCount
   cd(foldersList{i});
   
   subfolderList=ListSubfolders('.');
   cd(subfolderList{1})
   
   subsubfolderList=ListSubfolders('.');
   for j=1:3   % 3 illuminations
       cd(subsubfolderList{j});
       
       expTimes= [str2num(fileread('Exp0/exposure_ms.txt')), str2num(fileread('Exp1/exposure_ms.txt')),str2num(fileread('Exp2/exposure_ms.txt'))];
       %create hdr images
       hdrView1 = makehdr(view1Files, 'RelativeExposure', expTimes ./ expTimes(1));
       hdrView5 = makehdr(view5Files, 'RelativeExposure', expTimes ./ expTimes(1));
       hdrView1_normalized = hdrView1 ./255;
       hdrView5_normalized = hdrView5 ./255;
       % output hdr images
       hdrwrite(hdrView1, 'view1_Original.hdr');
       hdrwrite(hdrView5, 'view5_Original.hdr');
       
       hdrwrite(hdrView1_normalized, 'view1_Normalized.hdr');
       hdrwrite(hdrView5_normalized, 'view5_Normalized.hdr');
     
       cd('..');    
   end
   
  
   
   cd('..');
   cd('..');
    
end