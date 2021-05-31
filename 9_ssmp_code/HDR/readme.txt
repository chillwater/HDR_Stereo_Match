Matlab demo code accompanying the TIP paper v1.0 (2013-12-30)

Contributed by Bumsub Ham (mimo@yonsei.ac.kr)

It is based on the code written by Christoph Rhemann for the fast cost volume filtering. 
[C. Rhemann, A. Hosni, M. Bleyer, C. Rother, M. Gelautz, Fast Cost-Volume Filtering for Visual Correspondence and Beyond, CVPR11]

Notes:
* The code is provided for academic use only. Use of the code in any commercial or industrial related activities is prohibited. 
* If you use our code, please cite the paper 
[B. Ham, D. Min, C. Oh, M. N. Do, and K. Sohn, Probability-Based Rendering for View Synthesis, IEEE Trans. on Image Process., 2014.]

This code uses some graph functions in the Graph Analysis Toolbox (http://eslab.bu.edu/software/graphanalysis/) and weighted median filter in the fast cost volume filtering.

Usage: Run "runStereoMatcher.m" in MATLAB 
(You can choose a test image by changing the 'only_name'. Note that 'numDisp' and 'scale' should be properly set for preventing the local minima.)

If you have any questions, please contact: Bumsub Ham (mimo@yonsei.ac.kr).