function [phi] = phi_k(y, p, t)

 % function used to compute the vector phi(t)
 % y is the output vector and p is the model complexity

    % Creation of a regressor vector phi for an AR model
    phi = -y(t-1+p:-1:t);    %using p past samples
end

