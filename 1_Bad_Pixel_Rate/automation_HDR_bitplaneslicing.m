fid=fopen('bad_pixel_border_208_results.txt','w');
%cd('bit_plane_slice_stereo');

for value=45:63  %control how many bits to bit plane slice, 63 means preserving only 2^(-1)  62 mean preserving 2^(-1)+2^(-2)  ...
%     BaseName1=strcat('Reindeer_Matlab_Normalized_slice_',num2str(value),'_disparity_l_post.png');
    %BaseName1=strcat('disparity_',num2str(value),'.png');  %costfilter SGM
    
    BaseName1=strcat('disparity_', num2str(value),'_l_post.png');  %ssmp
    %function [perBADMatch, timeTaken]= funcPercentBadMatchingPixels(computedDisparityMap,groundTruthDisparityMap,borderPixelsToIgnore,dispRange,thresh, scale)
    result=funcPercentBadMatchingPixels(BaseName1,'disp1.png',208,201,1,1);
    fprintf(fid,'%f\n', result(1));
    
end

fclose(fid);