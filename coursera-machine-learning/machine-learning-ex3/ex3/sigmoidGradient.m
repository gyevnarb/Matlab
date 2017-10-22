function grad = sigmoidGradient(x)
%SIGMOIDGRADIENT Summary of this function goes here
%   Detailed explanation goes here

grad = sigmoid(x).*(1-sigmoid(x));

end

