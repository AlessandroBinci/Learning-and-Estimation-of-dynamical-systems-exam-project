function [theta] = leastSquare(y,p)
    
% function used to obtain the first estimate of theta using the Least Square Estimate
% y is the output vector containing the first N_batch samples
    N = length(y)-p;
    H = -hankelMatrix(y,p);             %Hankel matrix with negative sign
    y_t = y(p+1:N+p);                   % y delayed by p steps
    theta = (H'*H) \ (H'* y_t);         % Batch Estimator (we'll not use inv/pinv functions because of the command of the exercise)

end

