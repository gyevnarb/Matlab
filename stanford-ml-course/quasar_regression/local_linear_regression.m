function yhat = local_linear_regression(x, y, tau)
% LOCAL_LINEAR_REGRESSION Performs a local linear regression to smooth the
% given input signal.
%
% yhat = local_linear_regression(x, y, tau) takes as input the vectors x
% and y, both of the same dimension. Then, at each point x in the given
% vector, fits a local linear regression using the features (1, x) at that 
% point, with weights given by
%
% w^i(x) = exp(-(x - x^i)^2 / (2 * tau^2))

if (length(x) ~= length(y))
    error('Length of x (%d) not same as y (%d)', length(x), length(y));
end

n = length(x);

X = [ones(n, 1), x];
yhat = zeros(n, 1);

for i = 1:n
    w = exp(-(x - x(i)).^2 / (2 * tau^2));
    XwX = X' * ([w, w] .* X);
    XtWy = X' * (w .* y);
    theta = XwX \ XtWy;
    yhat(i) = [1 x(i)] * theta;  
end

end

