%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Write a specific program for calculating the product of a given lower
%   triangular matrix and a vector and a lower triangular matrix with a 
%   lower triangular matrix.

A = [1 2 3; 0 5 6; 0 0 9];
v = [1; 1; 1];

rows = size(A,1); n = rows;
cols = size(A,2);

if(rows ~= cols)    error('Matrix given is not square'); end
if(n ~= size(v,1))  error('Multiplication is not defined, wrong dimensions'); end

result = zeros(n,1);

for i=1:n
    result(i) = A(i, i:n)*v(i:n);
end

disp(result);
