function output_Mat = kronecker(Mat_A,Mat_B)
    size_A = size(Mat_A);
    size_B = size(Mat_B);
    
    output_Mat = zeros(size_A(1)*size_B(2),size_A(1)*size_B(2));
    
    for c1 = 1:size_A(1)
        for c2 = 1:size_A(2)
            for c3 = 1:size_B(1)
                for c4 = 1:size_B(2)
                    output_Mat((c1-1)*size_B(1)+c3,(c2-1)*size_B(2)+c4) = Mat_A(c1,c2)*Mat_B(c3,c4);
                end
            end
        end
    end
end

