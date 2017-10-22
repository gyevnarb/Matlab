function [ z ] = elu_grad( x, alpha )
%ELU_GRAD Computes the gradient of ELU activation function

z = x;
pos = x >= 0;
z(pos) = 1;
z(~pos) = alpha .* exp(x);

end

