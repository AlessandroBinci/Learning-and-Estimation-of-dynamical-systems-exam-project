function [yhat, post] = softmaxFunct(X, Theta, classes)

% softmaxFunct — posterior probabilities (softmax) and predicted class (LDA/linear)

    % X : feature matrix
    X = double(X);
    classes = classes(:);

    Phi = [X, ones(size(X,1),1)];             
    Z   = Phi * Theta.';                            % computation of z thrugh Theta, which is the parameter matrix [beta0 beta] for each class

    % computation of stable softmax over classes
    Zs   = Z - max(Z,[],2);                         % numerical stabilization
    expZ = exp(Zs);
    post = expZ ./ sum(expZ,2);                     % posterior probabilities P(C_k | x)

    %decision: argmax_k post_k(x)
    [~, idx] = max(post, [], 2);
    yhat = classes(idx);                            % predicted labels (argmax over classes)
end
