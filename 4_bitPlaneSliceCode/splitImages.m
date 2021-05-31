dimensions=size(cat_hdr);
view5_float=zeros(370,463,3,'single')
view1_float=zeros(370,463,3,'single')

for k=1:dimensions(3)
    for m=1:dimensions(1)
       for n=1:dimensions(2)
          if(n > 463)
             view5_float(m,(n-463),k)=cat_hdr(m,n,k); 
          else
              view1_float(m,n,k)=cat_hdr(m,n,k);
          end

       end
    end
    
end