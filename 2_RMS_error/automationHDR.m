%change borderPixelsToIgnore,dispRange  before using
fid=fopen('RMS_border_208_results.txt','w');

%for value=63:(-1):45
for value=45:45
    %BaseName1=strcat('disparity_',num2str(value),'.png');        
    BaseName1=strcat('disparity_', num2str(value),'_l_post.png');  %ssmp    
    
        %function [rmsError, timeTaken]= funcRMSError(computedDisparityMap,groundTruthDisparityMap,borderPixelsToIgnore,dispRange, scale)    
    result=funcRMSError(BaseName1,'disp1.png',208,201,1);

    fprintf(fid,'%f\n', result(1));
    
end

fclose(fid);