function [ C ] = matmul( A,B )
    [m,n]=size(A);    
    [k,l]=size(B);    
    if(n~=k)        
        C=[];        
        disp('Error, not able to multiply matrices');        
        return    
    end
    C= A*B;
end