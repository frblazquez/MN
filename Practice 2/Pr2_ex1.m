%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Check the correctness of the product of matrixes by blocks in a
%   particular case.

M = [1 2 3 4; 9 3 7 4; 1 1 4 2; 0 1 3 6];
N = [1 3 5 7; 2 4 6 8; 0 1 5 0; 0 1 9 2];

M11 = M([1 2], [1 2]);  %       ( M11 | M12 )
M12 = M([1 2], [3 4]);  %   M = (-----|-----)
M21 = M([3 4], [1 2]);  %       ( M21 | M22 )
M22 = M([3 4], [3 4]);  %

N11 = N([1 2], [1 2]);  %       ( N11 | N12 )
N12 = N([1 2], [3 4]);  %   N = (-----|-----)
N21 = N([3 4], [1 2]);  %       ( N21 | N22 )
N22 = N([3 4], [3 4]);  %

R1 = M*N;           % Direct product
R2 = zeros(4,4);    % Product by blocks
R2([1 2], [1 2]) = M11*N11 + M12*N21;
R2([1 2], [3 4]) = M11*N12 + M12*N22;
R2([3 4], [1 2]) = M21*N11 + M22*N21;
R2([3 4], [3 4]) = M21*N12 + M22*N22;

disp(R1);
disp(R2);
