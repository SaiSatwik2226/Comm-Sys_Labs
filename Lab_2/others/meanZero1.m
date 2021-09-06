function new_ran_arr = meanZero1(N)
    ran_arr = randperm(N-1,N-1);
    new_ran_arr = zeros(N);
    randPos = randi(N);
    sub = -sum(ran_arr);
    j=1;
    for i = 1:N
        if randPos == i
            new_ran_arr(i) = sub;
        else
            new_ran_arr(i) = ran_arr(j);
            j=j+1;
        end
    end
end