%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Calculate de derivative of sin(x) at x = 1 directly form the definition
%   to find out the cancellation problem. Compare with it's correct value.

format long;

% (sin(1+h) - sin(1))/h with h = 10^-i  i = 1,2,3,...,20
powTen = 1;

for i=1:20
    powTen = powTen/10;
    
    % We print iteration - value computed - correct value
    fprintf('Iteration %d: %.15f - %.15f\n', i, (sin(1+ powTen) - sin(1))*powTen , cos(1));
end

