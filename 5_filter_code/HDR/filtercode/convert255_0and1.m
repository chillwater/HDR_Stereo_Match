dimensions=size(view5);
view5_modified=view5;
for k=1:dimensions(3)
    for m=1:dimensions(1)
       for n=1:dimensions(2)
           view5_modified(m,n,k)=view5(m,n,k)/255;
       end
    end
    
end