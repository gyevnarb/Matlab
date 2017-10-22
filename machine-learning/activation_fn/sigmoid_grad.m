function [ z ] = sigmoid_grad( x )
%SIGMOID_GRAD Gradient of the sigmoid activation function

z = sigmoid(x) .* (1 - sigmoid(x));

end

