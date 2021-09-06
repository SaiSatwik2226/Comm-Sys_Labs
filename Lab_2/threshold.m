function n = threshold(a,thres)
    n=0;
    while power(a,n) > thres
        n = n+1;
    end
end