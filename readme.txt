contents in this folder:

1. Bad_Pixel_Rate	->	Calculates bad pixel rate
2. Root Mean Square Error->	Calculates RMS
3. HDR_LDR_backup	->	HDR Bit-plane slicing results of pairs used in thesis
4. bitPlaneSliceCode	->	bit plane slice HDR stereo pairs
5. filter_code		->	modified CostFilter(Name in middlebury stereo evaluation list) for HDR, and LDR original code(slightly modified)
6. filter_code_results	->	contains CostFilter results for HDR (including bit-plane slicing)and LDR disparity results
7. semiglob_results	->	contains SemiGlob(Name in middlebury stereo evaluation list) results for HDR (including bit-plane slicing)and LDR disparity results
8. semiGlobal_code	->	script for semi-global stereo matching (Matlab script) for HDR, and LDR script
9. ssmp_code		->	modified SSMP(Name in middlebury stereo evaluation list) code for HDR, and LDR original code(slightly modified)
10.ssmp_results		->	contains SSMP results for HDR (including bit-plane slicing)and LDR disparity results
12.LDR_algorithms       ->      original algorithms from original authors
13.Generate_HDR_script  ->      Used to generate HDR images using matlab (script)

all_results             ->      results are all logged into excel files, used in matlab to create line graphs and figures
                                MATLAB line graph (script and saved png, eps files)
                                table for latex 
extra_stereo_pairs_results ->   2 stereo pairs generated using only 2 exposures specially

INT_HDR_script          ->      script used to save hdr images into 16-bit png files

