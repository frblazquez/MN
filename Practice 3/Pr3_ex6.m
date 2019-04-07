%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Implement a function for obtaining the solution of a system Ax=d where
%   A is a tridiagonal matrix.

%   Sample of a tridiagonal matrix:
%
%     (b1 c1                          )
%     (a2 b2 c2                       )
% A = (   a3 b3 c3 ...                )
%     (                 an-1 bn-1 cn-1)
%     (                      an   bn  )

function [x] = tridiagonalSystem(A,d)
    % This function returns the unique solution x for a system of linear
    % equations Ax=d where A is an inversible tridiagonal matrix.
    
    dimA = size(A,1);

    % 1) Input parameters types and values are correct and consistent:
    assert(ismatrix(A),       'First parameter must be a square matrix');
    assert(dimA == size(A,2), 'First parameter must be a square matrix');
    
    % 2) We calculate mk and gk:
    m = zeros(1, dimA); m(1) = A(1,1);
    g = zeros(1, dimA); g(1) = d(1)/m(1);
    
    for i=2:dimA
       m(i) = A(i,i) - (A(i-1,i)/m(i-1))*A(i,i-1);
       g(i) = (d(i) - g(i-1)*A(i,i-1))/m(i);
    end
    
    % 3) We calculate x:
    x = zeros(dimA, 1); x(dimA) = g(dimA);
    
    for i=dimA-1:-1:1
        x(i) = g(i) - A(i,i+1)*x(i+1)/m(i);
    end
end