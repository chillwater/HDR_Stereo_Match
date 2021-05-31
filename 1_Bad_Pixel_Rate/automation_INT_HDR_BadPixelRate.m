
foldersList=ListSubfolders('.');

folderSize=size(foldersList);
folderCount=folderSize(1);
view1Files = {'Exp0/view1.png', 'Exp1/view1.png', 'Exp2/view1.png'};
view5Files = {'Exp0/view5.png', 'Exp1/view5.png', 'Exp2/view5.png'};
for i=1:folderCount
   cd(foldersList{i});
   
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
   
    
   
   for j=1:subsubfolderCount   %  illuminations
       cd(subsubfolderList{j});
       % set elapsed time
       st=clock;
                            
           % set border pixels to ignore
           switch i
               case 1
                   borderPixelsToIgnore_Int=207;
               case 2
                   borderPixelsToIgnore_Int=143;
               case 3
                   borderPixelsToIgnore_Int=160;
               case 4
                   borderPixelsToIgnore_Int=208;
               case 5
                   borderPixelsToIgnore_Int=192;
               case 6
                   borderPixelsToIgnore_Int=160;    
               case 7
                   borderPixelsToIgnore_Int=208;
               case 8                  
                   borderPixelsToIgnore_Int=176;
               case 9
                   borderPixelsToIgnore_Int=176;
               case 10
                   borderPixelsToIgnore_Int=208;
           end 
                  
           fid=fopen('bad_pixel_border_results_times_1.txt','w');
         computed_Disparty= imread('semiGlob_result_times_1.png');
         result=funcPercentBadMatchingPixels_InputMatrix(computed_Disparty,ground_truth, double(borderPixelsToIgnore_Int),double(disparity_max),1,1);
                                                          %,borderPixelsToIgnore,dispRange,
        fprintf(fid,'%f\n', result(1));            
       fprintf('Took %.2f second\n',etime(clock,st));     

           fid=fopen('bad_pixel_border_results_times_2.txt','w');
         computed_Disparty= imread('semiGlob_result_times_2.png');
         result=funcPercentBadMatchingPixels_InputMatrix(computed_Disparty,ground_truth, double(borderPixelsToIgnore_Int),double(disparity_max),1,1);
                                                          %,borderPixelsToIgnore,dispRange,
        fprintf(fid,'%f\n', result(1));            
       fprintf('Took %.2f second\n',etime(clock,st));            
           fid=fopen('bad_pixel_border_results_times_4.txt','w');
         computed_Disparty= imread('semiGlob_result_times_4.png');
         result=funcPercentBadMatchingPixels_InputMatrix(computed_Disparty,ground_truth, double(borderPixelsToIgnore_Int),double(disparity_max),1,1);
                                                          %,borderPixelsToIgnore,dispRange,
        fprintf(fid,'%f\n', result(1));            
       fprintf('Took %.2f second\n',etime(clock,st));            
        fprintf(fid,'%f\n', result(1));            
       fprintf('Took %.2f second\n',etime(clock,st));        
       
           fid=fopen('bad_pixel_border_results_times_256.txt','w');
         computed_Disparty= imread('semiGlob_result_times_256.png');
         result=funcPercentBadMatchingPixels_InputMatrix(computed_Disparty,ground_truth, double(borderPixelsToIgnore_Int),double(disparity_max),1,1);
                                                          %,borderPixelsToIgnore,dispRange,
        fprintf(fid,'%f\n', result(1));            
       
       cd('..');    
   end
   else
     test = 'No Ground truth of this stereo pair'
   end
  
   
   cd('..');
   cd('..');
    
end