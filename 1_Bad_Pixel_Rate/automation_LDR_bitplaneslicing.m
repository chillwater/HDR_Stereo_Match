fid=fopen('bad_pixel_border_208_results.txt','w');
%cd('bit_plane_slice_stereo');

%for value=45:63
%     BaseName1=strcat('Reindeer_Matlab_Normalized_slice_',num2str(value),'_disparity_l_post.png');
    %BaseName1=strcat('disparity_',num2str(value),'.png');        
    %BaseName1=strcat('disparity_', num2str(value),'_l_post.png');  %ssmp
    %BaseName1='disparity.png';  %for LDR FilterCode
    %BaseName1='disparity_l_post.png'; %for SSMP LDR
    BaseName1='semiGlob_result.png';  %for LDR FilterCode
    %function [perBADMatch, timeTaken]= funcPercentBadMatchingPixels(computedDisparityMap,groundTruthDisparityMap,borderPixelsToIgnore,dispRange,thresh, scale)
    result=funcPercentBadMatchingPixels(BaseName1,'disp1.png',168,176,1,1);
                                                          %,borderPixelsToIgnore,dispRange,
    fprintf(fid,'%f\n', result(1));
    
%end

fclose(fid);