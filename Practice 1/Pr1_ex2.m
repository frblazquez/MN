%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Compute simple operations in order to check the correctness of the 
%   results. Detect whether rounding is done or not.

format long;

% first we display 1 to compare
disp('1 = '); disp(1);

% a) 1 + 2^-52  => Not equal to 1
disp('1 + 2^-52 = '); disp(1 + 2^(-52));

% b) 1 + 2^-53  => Equal to 1
disp('1 + 2^-53 = '); disp(1 + 2^(-53));

% c) 1 - 2^-53  => Not equal to 1
disp('1 + 2^-53 = '); disp(1 - 2^(-53));

% b) 1 + 2^-54  => Equal to 1
disp('1 + 2^-54 = '); disp(1 - 2^(-54));

