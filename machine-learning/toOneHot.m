function [ Y ] = toOneHot( y, num_labels )
%TOONEHOT Converts a given target vector of at most num_labels distinct
%labels into a one-hot encoded vector Y, where Y(i, k) = y(i) == k, where k
%is the kth label

m = length(y);
Y = ones(m,num_labels);

for i = 1:m
    for k = 1:num_labels
       Y(i,k) = y(i)==k; 
    end
end

end

