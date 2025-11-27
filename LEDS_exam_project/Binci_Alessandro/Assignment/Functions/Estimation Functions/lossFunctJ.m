function [J] = lossFunctJ(y, theta)

% lossFunctJ is the function used to compute the cost function J of theta


    n = length(theta);   
    N = length(y) - n;   
    H = -hankelMatrix(y, n); % Hankel matrix of y

    % Computing of the cost function
    y_t = y(n+1:end);         % Align y
    err = y_t - H*theta;      %Defining the error       
    J =  (1/N)*(err' * err);  %1/N used to better behaviour   

end
