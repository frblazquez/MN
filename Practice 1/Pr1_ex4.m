%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Determinate the maximum and minimum positive normal number working in
%   double precission. Calculate also the minimum and maximum subonormal
%   number in this precission.

format long;

% a) Maximum normal number in double precission:
%    0 11111111110 1111111111111111111111111111111111111111111111111111

maxNormalDouble = 0;

for i=971:1023
    maxNormalDouble = maxNormalDouble + 2^(i);
end

disp('Maximum double normal number = ');
disp(maxNormalDouble);

disp('Matlab realmax = ');
disp(realmax);

disp('Difference = ');  % To check if it's exactly or almost zero
disp(maxNormalDouble - realmax);

% b) Minimum normal number in simple precission:
%    0 00000000001 0000000000000000000000000000000000000000000000000000
minNormalDouble = 2^(-1022);

disp('Minimum double normal number = ');
disp(minNormalDouble);

disp('Matlab realmin = ');
disp(realmin);

disp('Difference = ');  % To check if it's exactly or almost zero
disp(minNormalDouble - realmin);

% c) Maximum subnormal number in simple precission:
%    0 00000000000 1111111111111111111111111111111111111111111111111111

maxSubnormalDouble = 0;

for i=1023:1075
    maxSubnormalDouble = maxSubnormalDouble + 2^(-i);
end

disp('Maximum double subnormal number = ');
disp(maxSubnormalDouble);

% d) Minimum subnormal number in simple precission:
%    0 00000000000 0000000000000000000000000000000000000000000000000001

disp('Minimum simple normal number = ');
disp(2^(-1074));

% Correctness can be checked at https://en.wikipedia.org/wiki/Double-precision_floating-point_format