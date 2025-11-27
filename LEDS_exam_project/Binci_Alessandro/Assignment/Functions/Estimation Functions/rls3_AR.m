function [theta] = rls3_AR(y, p, N_batch)
% RLS III for AR(p) with Matrix Inversion Lemma:
% 1) S(t)^{-1} = S(t-1)^{-1} - S(t-1)^{-1} φ φ^T S(t-1)^{-1} / (1 + φ^T S(t-1)^{-1} φ)
% 2) K(t) = S(t)^{-1} φ(t)
% 3) ε(t) = y(t+p) - φ^T(t) θ̂ (t-1)
% 4) θ̂ (t) = θ̂ (t-1) + K(t) ε(t)

    y = y(:);
    N = length(y) - p;              % number of available φ

    % initialization of N-batch
    y0    = y(1 : N_batch + p);     
    theta = leastSquare(y0, p);     % θ̂ (N_batch)
    S     = initS_0(y0, p);         % S(N_batch) = sum_{k=1..N_batch} φ(k)φ^T(k) using initS_O function
    Sinv  = S \ eye(p);             % S(N_batch)^{-1}  (no inv/pinv as requested from the command of the exercise)

    % RLS III algorithm
    for t = p + 1 : N
        phi = phi_k(y, p, t);                      % φ(t)

        % (1) update S^{-1}(t)
        v    = Sinv * phi;                         % S(t-1)^{-1} φ(t)
        denom = 1 + (phi' * v);                    % (1 + φ^T S(t-1)^{-1} φ)
        Sinv  = Sinv - (v * v') / denom;           % S(t)^{-1}

        % (2) K(t) = S(t)^{-1} φ(t)
        K = Sinv * phi;

        % (3) ε(t) = y(t+p) - φ^T(t) θ̂ (t-1)
        eps = y(t + p) - (phi' * theta);           % ε(t) con θ̂ (t-1)

        % (4) θ̂ (t) = θ̂ (t-1) + K(t) ε(t)
        theta = theta + K * eps;
    end
end
