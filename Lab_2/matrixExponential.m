function [out] = matrixExponential(A)
	out = A;
	temp_A = A;
	for i=2:1:10
        temp_A = matmul(temp_A,A);
		out = out + temp_A/factorial(i);
	end
end