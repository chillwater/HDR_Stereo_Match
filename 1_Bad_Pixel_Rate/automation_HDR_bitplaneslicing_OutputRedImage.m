%fid=fopen('bad_pixel_border_166_results.txt','w');
%fid=fopen('test.txt','w');
%cd('bit_plane_slice_stereo');

for value=45:45
%     BaseName1=strcat('Reindeer_Matlab_Normalized_slice_',num2str(value),'_disparity_l_post.png');
    %BaseName1=strcat('disparity_',num2str(value),'.png');        
    %BaseName1=strcat('disparity_', num2str(value),'_l_post.png');  %ssmp
   % BaseName1=strcat('semiGlob_result.png');       
   BaseName1='Midd1_Illum2_HDR_SSMP.png';
   
    %function [perBADMatch, timeTaken]= funcPercentBadMatchingPixels(computedDisparityMap,groundTruthDisparityMap,borderPixelsToIgnore,dispRange,thresh, scale)
    result=funcPercentBadMatchingPixels_OutputRedImage(BaseName1,'disp1.png',215,208,1,1);
   imshow(result);
    imwrite(result,'Midd1_Illum2_HDR_SSMP_result.png');
  %  fprintf(fid,'%f\n', result(1));
    
end

%fclose(fid);