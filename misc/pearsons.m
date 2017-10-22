function [ corrcoef ] = pearsons( X )

[N, M] = size(X);com
muX = mean(X);
sigmaX = std(X);

quo = (X - muX) ./ sigmaX;
corrcoef = quo' * quo ./ (N - 1);

end