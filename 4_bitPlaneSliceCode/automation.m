view1=hdrread('view1_Normalized.hdr');
view5=hdrread('view5_Normalized.hdr');
view1_exponent=exponent_extraction(view1);
view5_exponent=exponent_extraction(view5);
view1_mantissa = mantissa_expansion(view1);
view5_mantissa = mantissa_expansion(view5);
view1_result=multiply_mantissa_and_exponent(view1_mantissa,view1_exponent);
view5_result=multiply_mantissa_and_exponent(view5_mantissa,view5_exponent);
