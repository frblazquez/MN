%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Compute the first one hundred terms of the sequence given to check that
%   error propagation processes increasi making the values computed not to
%   converge to the sucession limit.

format long;

% x0 = 1
% x1 = 1/7
% 
% xn+1 = (22/7)*xn - (3/7)*xn-1

x0 = 1;
x1 = 1/7;

for i=1:100
   x2 = (22/7)*x1 - (3/7)*x0;
   x0 = x1;
   x1 = x2;
   
   fprintf('Iteration %d: %.15f\n', i,x2);
end