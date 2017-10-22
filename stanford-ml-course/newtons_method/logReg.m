function [ theta ] = logReg( X, y, initTheta, iterMax )
%LOGREG Runs logistic regression using Newton's Method on the given design
%matrix X, with feature vector y and initial parameters initTheta. Returns
%fit values of the parameters theta

m = size(X,1);
n= size(X,2);

theta = initTheta;

for i = 1:iterMax
    margin = y .* (X * theta);
    J = 1 ./ m .* sum(log(1 + exp(-margin)));
    fprintf('Current error: %f\n', J);
    grad = -1 ./ m .* X' * (sigm(-margin) .* y);
    hessian = 1 ./ m * X' * diag(sigmGrad(-margin)) * X;
    theta = theta - hessian \ grad;
end

end

function g = sigm(z)
    g = 1 ./ (1 + exp(-z));
end

function g = sigmGrad(z)
    g = sigm(z) .* sigm(1 - z);
end