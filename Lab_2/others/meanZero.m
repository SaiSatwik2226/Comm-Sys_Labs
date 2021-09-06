function y_new = meanZero(N)
    ran_arr = randperm(N,N);
    
    % Find out which indexes represent positive ran_arr.
    indexesAbove = ran_arr > 0;
    
    % Find out which indexes represent negative ran_arr.
    indexesBelow = ran_arr < 0;
    
    yAbove = ran_arr(indexesAbove);
    yBelow = ran_arr(indexesBelow);
    
    % Get sums above and below zero.
    sumOfYAbove = sum(yAbove);
    sumOfYBelow = sum(yBelow);
    
    % Multiply yAbove by factor a to make them less than the positive ran_arr.
    % Subtract b from yBelow to make it less than negative ran_arr.
    % To get a mean of zero, you must have
    % a * sumOfYAbove + (sumOfYBelow - b) = 0
    % a * sumOfYAbove = b - sumOfYBelow
    % So arbitrarily pick any a, say, a = 0.5 or whatever you want.
    % Then determine b:
    % b = a * sumOfYAbove + sumOfYBelow
    
    a = 0.5;
    b = a * sumOfYAbove + sumOfYBelow;
    
    % Now construct new vectors
    yNew = ran_arr; % Initialize.
    yNew(indexesAbove) = a * yNew(indexesAbove);
    yNew(indexesBelow) = yNew(indexesBelow) - b;
    
    % Show new yMean in command window.
    disp(yNew);
    
    % Show (prove) that the new mean is zero:
    newMean = mean(yNew);
    disp(newMean);
   
end