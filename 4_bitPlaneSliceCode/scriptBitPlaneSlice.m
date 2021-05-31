three_dimension=size(view1_result);
test=view1;
UseParallelToolbox = false; % Set true if you want to take advantage of the Matlab parallel computing toolbox
ParallelWorkers = 4; % How many workers should be used by the parallel computing toolbox (should be equal or less the number of available CPU cores)
%% Set up parallel computing toolbox
if (UseParallelToolbox)
    isOpen = matlabpool('size') > 0;
    if (isOpen)
        matlabpool close force local
    end
    matlabpool(ParallelWorkers)
end

BaseName='view1_slice_';
                      
parfor slice_level=45:63   %control how many bits to slice 63 means 1 bit, 62 means 2 bits ...
    test=view1;
%parfor slice_level from 63 downto 0
     for k=1:three_dimension(3)
         for m=1:three_dimension(1)
             for n=1:three_dimension(2)
%=========================================                
                answer = 0.0;    
                for i=(0+slice_level):63
                    number = i;
                    mask =cast(bitshift(1,number,'uint64'),'uint64');

                    mask_result = bitand(mask,view1_result(m,n,k));
                    if(mask_result > 0)
                        answer = answer + 2^(number-64);
                    end
                end
                test(m,n,k)=answer;
%========================================
             end
         end
     end
     FileName=[BaseName,num2str(slice_level),'.hdr']
     hdrwrite(test,FileName);
end


BaseName='view5_slice_';
parfor slice_level=45:63
    test=view1;
%parfor slice_level from 63 downto 0
     for k=1:three_dimension(3)
         for m=1:three_dimension(1)
             for n=1:three_dimension(2)
%=========================================                
                answer = 0.0;    
                for i=(0+slice_level):63
                    number = i;
                    mask =cast(bitshift(1,number,'uint64'),'uint64');

                    mask_result = bitand(mask,view5_result(m,n,k));
                    if(mask_result > 0)
                        answer = answer + 2^(number-64);
                    end
                end
                test(m,n,k)=answer;
%========================================
             end
         end
     end
     FileName=[BaseName,num2str(slice_level),'.hdr']
     hdrwrite(test,FileName);
end




%answer = 2^(-number) * cast((bitshift(view1_result(1,1,1),(-number),'uint64')),'single')

% three_dimension = size(view1_resultCopy);
% testView1 = view1_resultCopy;
% 
%     for k=1:three_dimension(3)
%         for m=1:three_dimension(1)
%             for n=1:three_dimension(2)   
%                 testView1(m,n,k) = bitshift(view1_result(m,n,k),(-61),'uint64');
%             end
%         end
%     end
%     
%     for k=1:three_dimension(3)
%         for m=1:three_dimension(1)
%             for n=1:three_dimension(2)   
%                 testView1(m,n,k)
%             end
%         end
%     end
    

