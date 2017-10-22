function [ all_theta ] = oneVsAllNewton(X, y, num_labels)
%ONEVSALLNEWTON Summary of this function goes here
%   Detailed explanation goes here

% Some useful variables
m = size(X, 1);
n = size(X, 2);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

for k = 1:num_labels
   
     % Set Initial theta
     initial_theta = zeros(n + 1, 1);
     
     % Run fmincg to obtain the optimal theta
     % This function will return theta and the cost 
     [theta] = newtonsMethod(X, y, initial_theta);
     
     all_theta(k,:) = theta;
             
end

end

