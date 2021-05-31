function [array_result] = multiply_mantissa_and_exponent( array_fraction, array_exponent ) 
    %multiply after mantissa_expansion  and float_exponent calculation===========================
    %actually just shift to align bits
    three_dimension = size(array_fraction);
    
    array_result = array_fraction;
    for k=1:three_dimension(3)
        for m=1:three_dimension(1)
            for n=1:three_dimension(2)       
                array_result(m,n,k) = bitshift(array_fraction(m,n,k),(array_exponent(m,n,k)),'uint64');
            end
        end
    end
    
    

end