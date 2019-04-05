%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Alternative way to calculate the machine epsilon. We are going to
%   divide one by two while 1 + term is distinct than 1.

format long;


eps = 1;

while(1 + eps ~= 1)
    eps = eps/2;
end

disp('Epsilon computed = '); disp(eps);
disp('Matlab epsilon = ');   disp(eps());
disp('Difference = ');       disp(eps - eps());