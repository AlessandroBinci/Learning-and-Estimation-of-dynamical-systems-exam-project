function [errorRates, overallErr] = errRate(Y, Y_hat, classes)

% function which computes the errorRates for each class and the overallErr, so the total error rate over all samples

    classes = classes(:);
    K = numel(classes);
    errorRates = zeros(K,1);
    totErrors = 0;
    N = numel(Y);

    for i = 1:K
        idx = (Y == classes(i));
        nCount  = sum(idx);                                %count how many elements for each class i
        nErrors = sum(Y_hat(idx) ~= classes(i));           %sum of errors on class i
        errorRates(i) = nErrors / nCount;                  %compute the rate
        totErrors = totErrors + nErrors;                   %compute total errors
    end

    overallErr = totErrors / N;                            %compute the mean of error rates over all classes
end
