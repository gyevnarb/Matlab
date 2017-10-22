function total = addBy( A, B, R )
%ADDBY Summary of this function goes here
%   Detailed explanation goes here

C = A * B;
total = sum(C(R == 1));

end

