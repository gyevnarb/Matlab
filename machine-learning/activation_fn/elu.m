function [ z ] = elu( x, alpha )
%ELU Computes the exponential linear activation of the input with
%hyperparameter alpha

z = x;
neg = x < 0;

z(neg) = alpha .* (exp(x(neg)) - 1);

end