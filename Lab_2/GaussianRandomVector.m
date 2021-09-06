function [ val ] = GaussianRandomVector( n )
    randomVector = randn(1,n)
    val = 0;
    for i=1:1:n
        val = val + randomVector(i);
    end
    val = val/n;
end