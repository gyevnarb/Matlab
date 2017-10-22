function [ z ] = batchNormalize( X, gamma, beta )
%BATCHNORMALIZE Applies batch normalisation to a neural net layer
% X is the design matrix of the mini-batch to be normalised
% gamma and beta a parameters of the network to be learned

epsilon = 1e-07;

mu_B = mean(X);
sigma_B = std(X) .^ 2;
X_hat = (X - mu_B) ./ sqrt(sigma_B + epsilon);
z = gamma .* X_hat + beta;

end

