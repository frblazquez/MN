%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Knowing that Matlab works in double precission and knowing the standar
%   IEEE 754-1985 for double representation calculate epsilon value.


%   Epsilon representation:
%   We have defined the machine epsilon as the distance among 1 and the 
%   smallest machine number smaller than 1. Then:
%   
%   1  ~ 0 01111111111 0000000000000000000000000000000000000000000000000000
%   1- ~ 0 01111111110 1111111111111111111111111111111111111111111111111111
%   1- = 1/2*(1 + 1/2 + 1/4 + ... + 1/2^53)
%
%   So to compute their difference:

smaller1 = 0; mediumPow = 1;

for i = 1:53
    mediumPow = mediumPow/2;
    smaller1  = smaller1 + mediumPow;
end

format long;    %For visualizating more precise numbers

disp('The machine epsilon is:  '); disp(eps());
disp('The epsilon computed is: '); disp(1 - smaller1);

% Is there a single difference, for Matlab, the machine epsilon is the 
% distance between numer one and the smallest greater number. However, we
% have defined the machine epsilo as this distance divided by two.

