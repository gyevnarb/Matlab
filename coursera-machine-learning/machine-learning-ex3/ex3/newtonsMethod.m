function theta = newtonsMethod(X, y, initialTheta)
%NEWTONSMETHOD This function uses Newton's method to maximize the logistics
%regression maximum-likelihood function

% Some useful constants
m = size(X, 1);
n = size(X, 2);

theta = initialTheta;
hessian = zeros(n, n);

h = sigmoid(X * theta);
J = (-y' * log(h) - (1 - y)' * log(1 - h)) ./ m;
grad_J = X' * (h - y) ./ m;
for i = 1:m
    x = X(i,:)';
    hessian = hessian + sigmoidGradient(theta' * x) .* (x * x');
end
hessian = hessian ./ m;

iter = 0;
while (J > 1e-04 && iter < 3)
    fprintf('Current error: %f\n', J);
    theta = theta - hessian \ grad_J;
    iter = iter + 1;
end

    
end

