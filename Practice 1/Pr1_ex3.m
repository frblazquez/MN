%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Determinate the maximum and minimum positive normal number working in
%   simple precission. Calculate also the minimum and maximum subonormal
%   number in this precission.

format long;

% a) Maximum normal number in simple precission:
%    0 11111110 11111111111111111111111

maxNormalSimple = 0;

for i=104:127
    maxNormalSimple = maxNormalSimple + 2^(i);
end

disp('Maximum simple normal number = ');
disp(maxNormalSimple);

% b) Minimum normal number in simple precission:
%    0 00000001 00000000000000000000000

disp('Minimum simple normal number = ');
disp(2^(-126));

% c) Maximum subnormal number in simple precission:
%    0 00000000 11111111111111111111111

maxSubnormalSimple = 0;

for i=127:149
    maxSubnormalSimple = maxSubnormalSimple + 2^(-i);
end

disp('Maximum simple subnormal number = ');
disp(maxSubnormalSimple);

% d) Minimum subnormal number in simple precission:
%    0 00000000 00000000000000000000001

disp('Minimum simple subnormal number = ');
disp(2^(-149));

% Correctness can be checked at https://en.wikipedia.org/wiki/Double-precision_floating-point_format
