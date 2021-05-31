function [array_exponent_int_array] = exponent_extraction( array ) 
    %exponent extraction from single type float number===========================

    three_dimension = size(array);
    array_exponent = zeros(three_dimension(1), three_dimension(2), three_dimension(3),'single');
    
    for k=1:three_dimension(3)
        for m=1:three_dimension(1)
            for n=1:three_dimension(2)                
             temp = bitshift(typecast(array(m,n,k),'uint32'),(-23),'uint32');
             array_exponent(m,n,k)=temp;

            end
        end
    end


    array_exponent_int_array = int32(array_exponent);

    for k=1:three_dimension(3)
        for m=1:three_dimension(1)
            for n=1:three_dimension(2)                
             array_exponent_int_array(m,n,k)= array_exponent_int_array(m,n,k)-127 + 1 ;
             %above +1 for the ieee 754 format 1 left of the decimal
            end
        end
    end


end