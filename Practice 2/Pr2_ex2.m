%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Check the correctness of the following properties in a particular case.

format long;

A = [1 2 3 4; 9 3 7 4; 1 1 4 2; 0 1 3 6];
B = [1 3 5 7; 2 4 6 8; 0 1 5 0; 0 1 9 2];
lambda = 2;

% a) det(AB) = det(BA) = det(A)*det(B)

fprintf('Det(AB)       = %f\n',   det(A*B));
fprintf('Det(BA)       = %f\n',   det(B*A));
fprintf('Det(A)*Det(B) = %f\n\n', det(A)*det(B));

% b) det(lambda*A) = lambda^n * det(A)

fprintf('Det(A)        = %f\n',  det(A));
fprintf('lambda        = %f\n',  lambda);
fprintf('Det(lambda*A) = %f\n',  det(lambda*A));
fprintf('Det(l*a)/l^n  = %f\n\n',det(lambda*A)/lambda^(size(A,1)));

% c) det(A*) = conj(det(A))

fprintf('Det(A*)     = %f\n',  det(A'));
fprintf('conj(Det(A))= %f\n\n',  conj(det(A)));

% d) det(A) = product of eigenvalues of A matrix

fprintf('Det(A)                 = %f\n',  det(A));
fprintf('Product of eigenvalues = %f\n',  prod(eig(A)));

