function [ z ] = sigmoid( x )
%SIGMOID Computes the sigmoid activation of the input

z = 1 ./ (1 + exp(-x));

end

