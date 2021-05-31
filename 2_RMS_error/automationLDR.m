%change borderPixelsToIgnore,dispRange  before using
dispRange=215;
borderPixelsToIgnore=208;
%BaseName1=strcat('disparity.png');  %filterCode  
%BaseName1=strcat('semiGlob_result.png');  %MATLAB semi-glob
BaseName1=strcat('disparity_l_post.png');  %SSMP
cd('Exp0');
    outputFileName=strcat('RMS_border_', num2str(borderPixelsToIgnore),'_results.txt');
    fid=fopen(outputFileName,'w');

        %BaseName1=strcat('disparity_',num2str(value),'.png');        
       

            %function [rmsError, timeTaken]= funcRMSError(computedDisparityMap,groundTruthDisparityMap,borderPixelsToIgnore,dispRange, scale)    
        result=funcRMSError(BaseName1,'disp1.png',borderPixelsToIgnore,dispRange,1);

        fprintf(fid,'%f\n', result(1));   
    fclose(fid);

cd('..');
cd('Exp1');
    outputFileName=strcat('RMS_border_', num2str(borderPixelsToIgnore),'_results.txt');
    fid=fopen(outputFileName,'w');

        %BaseName1=strcat('disparity_',num2str(value),'.png');        
        

            %function [rmsError, timeTaken]= funcRMSError(computedDisparityMap,groundTruthDisparityMap,borderPixelsToIgnore,dispRange, scale)    
        result=funcRMSError(BaseName1,'disp1.png',borderPixelsToIgnore,dispRange,1);

        fprintf(fid,'%f\n', result(1));   
    fclose(fid);

cd('..');

cd('Exp2');
    outputFileName=strcat('RMS_border_', num2str(borderPixelsToIgnore),'_results.txt');
    fid=fopen(outputFileName,'w');

        %BaseName1=strcat('disparity_',num2str(value),'.png');                
            %function [rmsError, timeTaken]= funcRMSError(computedDisparityMap,groundTruthDisparityMap,borderPixelsToIgnore,dispRange, scale)    
        result=funcRMSError(BaseName1,'disp1.png',borderPixelsToIgnore,dispRange,1);

        fprintf(fid,'%f\n', result(1));   
    fclose(fid);

cd('..');



