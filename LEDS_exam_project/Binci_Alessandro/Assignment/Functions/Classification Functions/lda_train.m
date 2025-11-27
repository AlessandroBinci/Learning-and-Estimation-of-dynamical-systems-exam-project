function model = lda_train(X, y)

% LDA (with same covariances): estimation of mu_k, Sigma, Sigma^{-1}, prior.


X = double(X);
y = y(:);
[classes, ~, g] = unique(y);     % g = 1..K
[N, D] = size(X);
K = numel(classes);

% computing of means
mu = zeros(K, D);
nk = zeros(K, 1);
for k = 1:K
    Ik = (g == k);
    nk(k)   = sum(Ik);
    mu(k,:) = mean(X(Ik,:), 1);
end

% Computing of covariance
S = zeros(D, D);
for k = 1:K
    Xk = X(g==k,:) - mu(k,:);
    S  = S + (Xk.' * Xk);
end
S = S / (N - K);

% Inverse of covariance (without inv/pinv)
Sinv = S \ eye(D);

% Prior probabilities
prior = nk / N;

% Output
model.classes = classes;   
model.mu      = mu;        
model.S       = S;         
model.Sinv    = Sinv;      
model.prior   = prior;     
end