function output_val = matmul(A,B)
    if size(A)(2) == size(B)(1)
        output_val = zeros(size(A)(1),size(B)(2));
        
        for i = 1:size(A)(1)
            for j = 1:size(B)(2)
                output_val(i,j) += A(i,j)*B(j);
            end
        end        
    else
        disp("not a valid multiplication");
    end
end