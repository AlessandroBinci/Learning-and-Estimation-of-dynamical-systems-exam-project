function [S] = initS_0(y, n)

% function used to compute the first values of the matrix S(t) using the
% function phi. y in this case is the vector of output containing the
% first N0 samples

    y = y(:);
    N0 = length(y) - n;
    S = zeros(n, n);

    for i = 1:N0
        phi_vect = phi_k(y, n, i);          %populating the phi vector from the function phi_k
        S = S + phi_vect * phi_vect';       %computing S(t)
    end
end