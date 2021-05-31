function [view1_fraction_int_array] = mantissa_expansion( array ) 
    %mantissa extraction from single type float number===========================
    three_dimension = size(array);
    array_temp = zeros(three_dimension(1), three_dimension(2), three_dimension(3),'single');
    
    for k=1:three_dimension(3)
        for m=1:three_dimension(1)
            for n=1:three_dimension(2)
             temp = bitshift(typecast(array(m,n,k),'uint32'),(9),'uint32');
             temp = bitshift(temp,(-9),'uint32');
              array_temp(m,n,k)=temp+8388608;
               % array_temp(m,n,k)=temp;
            end
        end
    end

    view1_fraction_int_array = uint64(array_temp);    
    for k=1:three_dimension(3)
        for m=1:three_dimension(1)
            for n=1:three_dimension(2)   
             view1_fraction_int_array(m,n,k) = bitshift(typecast(view1_fraction_int_array(m,n,k),'uint64'),(32+8),'uint64');
            end
        end
    end

end