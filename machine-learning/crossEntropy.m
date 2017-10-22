function [ J ] = crossEntropy( Y, yhat )
%CROSSENTROPY Calculates cross entropy between arguments
%1. one-hot encoded target matrix or binary target (0 or 1)
%2. calculated membership probabilities

[m, n] = size(Y);

if n == 1
    J = -1 ./ m .* (Y' * log(yhat) + (1 - Y)' * log(1 - yhat));
else
    J = -1 ./ m .* sum(sum(Y .* log(yhat)));
end

end

