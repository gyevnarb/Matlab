function [ z ] = softmax( x )
%SOFTMAX Applies softmax normalisastion to the given input

exp_x = exp(x - max(x));
z = exp_x ./ sum(exp_x);

end

