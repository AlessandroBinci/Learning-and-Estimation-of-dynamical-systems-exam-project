function W = whiteTest(y,resid,n)

%function which implements the Whiteness test on the residuals for the validation of the model 

m = 25;                                                 %number of samples for which we perform the test (it can be variable but it might be better if is not too high)
alpha = 0.05;                                           %we choose it arbitrarly, but generally the value chosen is 0.05
resid = resid(:) - mean(resid(:));
N = numel(resid);
[acf,lags,bounds] = autocorr(resid,"NumLags",m);        %autocorrelation function already normalized by econometric toolbox                                 
m_fail = 0;                                             %variable to count the number of failed tests


%performing the Gaussian test
for i = 2:m+1                                           %we start from lag 1 instead of 0
    if abs(acf(i)) > 1.96/sqrt(N)                       %computation of the formula for gaussian test and alpha = 0.05
        m_fail = m_fail + 1;
    end
end

%performing the Anderson test
if m_fail/m <= alpha
    fprintf('Accept H0: the model is accepted and the signal is white\n');
else
    fprintf('Reject H0: the model is rejected');
end

%plot of the autocorrelation function already implemented in the function
lags = (0:1:m);
figure();
ax = plot(lags(1:m+1),acf);
grid on;
xlabel("Delay [\tau]");
ylabel("r_e[\tau]");
title("Whiteness Test");