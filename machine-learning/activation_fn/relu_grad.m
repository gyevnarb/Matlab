function [ z ] = relu_grad( x )
%RELU_GRAD Computes the gradient of the ReLU activation function

z = x;
pos = x > 0;
z(pos) = 1;
z(~pos) = 0;

end

