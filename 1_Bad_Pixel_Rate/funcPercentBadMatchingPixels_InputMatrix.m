% *************************************************************************
% Title: Function-Compute Percentage of bad matching pixels
% Author: Siddhant Ahuja
% Created: May 2008
% Copyright Siddhant Ahuja, 2008
% Inputs: Computed Disparity Map (var: computedDisparityMap), Ground Truth Disparity Map (var: groundTruthDisparityMap),
% How many pixels to ignore at the border (var: borderPixelsToIgnore). For
% a 9x9 windowSize used, border pixels to ignore should be (9-1)/2 or 4
% pixels, Disparity range (var: dispRange), Threshold (var: thresh), Scale
% factor for groundtruth (var: scale)
% Outputs: Percentage Bad matching pixels (var: perBADMatch), Time taken
% (var: timeTaken)
% Example Usage of Function: [perBADMatch, timeTaken]=
% funcPercentBadMatchingPixels(dispMap,'VenusGroundTruthL2R.png',4,16,1,8)
% *************************************************************************
function [perBADMatch, timeTaken]= funcPercentBadMatchingPixels_InputMatrix(computedDisparityMap,groundTruthDisparityMap,borderPixelsToIgnore,dispRange,thresh, scale)
% Read an image using imread function, and assign it to variable
% computedDisparityMap

    

% Convert the image from uint8 to double
computedDisparityMap=double(computedDisparityMap);
% Read an image using imread function, and assign it to variable


% Convert the image from uint8 to double
groundTruthDisparityMap=double(groundTruthDisparityMap);

% Find the size (columns and rows) of the left image and assign the rows to
% variable nrComputedDisparityMap, and columns to variable ncComputedDisparityMap
[nrComputedDisparityMap,ncComputedDisparityMap] = size(computedDisparityMap);
% Find the size (columns and rows) of the image and assign the rows to
% variable nrGroundTruthDisparityMap, and columns to variable ncGroundTruthDisparityMap
[nrGroundTruthDisparityMap,ncGroundTruthDisparityMap] = size(groundTruthDisparityMap);
% Check to see if both the left and right images have same number of rows
% and columns
if(nrComputedDisparityMap==nrGroundTruthDisparityMap && ncComputedDisparityMap==ncGroundTruthDisparityMap)
else
    error('Both Computed Disparity Map and Groundtruth Disparity Map images should have the same number of rows and columns');
end
numPixels=0;
perBADMatch=0.0;
tic; % Initialize the timer to calculate the time consumed.
% Calculate Percentage Bad Matching Pixels
%for (i=borderPixelsToIgnore:1:nrComputedDisparityMap-borderPixelsToIgnore)
for (i=1:1:nrComputedDisparityMap-borderPixelsToIgnore)    
    %for(j=borderPixelsToIgnore:1:ncComputedDisparityMap-borderPixelsToIgnore-dispRange)
    for(j=borderPixelsToIgnore:1:ncComputedDisparityMap-dispRange)
        
        if(groundTruthDisparityMap(i,j)~=0.0) % Ignore Pixels with unknown disparity in the groundTruthDisparityMap
            if(abs((computedDisparityMap(i,j)*scale)-groundTruthDisparityMap(i,j))>thresh)
                perBADMatch=perBADMatch+1;
            end
            numPixels=numPixels+1;
        end
        
    end    
end
perBADMatch=perBADMatch/numPixels;
% Stop the timer to calculate the time consumed.
timeTaken=toc;