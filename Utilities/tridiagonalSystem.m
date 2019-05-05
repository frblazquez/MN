%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Double degree in Mathematics - Computer engineering
%             Complutense university, Madrid
%   
%   Description: 
%   Script for calculating the solution of a system of linear equations
%   Ax=d where A is a tridiagonal matrix reversible.

%     Sample of a tridiagonal matrix:
%
%     (b1 c1                          )
%     (a2 b2 c2                       )
% A = (   a3 b3 c3 ...                )
%     (                 an-1 bn-1 cn-1)
%     (                      an   bn  )

function [x] = tridiagonalSystem(a,b,c,d)
    % This function returns the unique solution x for a system of linear
    % equations Ax=d where A is an inversible tridiagonal matrix.
    dimA = size(b,2);

    % 1) Input parameters types and values are correct and consistent:
    assert(isvector(a),       'First parameter must be the lower diagonal vector');
    assert(isvector(b),       'Second parameter must be the main diagonal vector');
    assert(isvector(c),       'Third parameter must be the upper diagonal vector');
    assert(dimA-1==size(a,2), 'Lower and main diagonal dimension must differ in one unit');
    assert(dimA-1==size(c,2), 'Upper and main diagonal dimension must differ in one unit');
    assert(dimA==size(d,1),   'Matrix and independent term dimension are not consistent');
    
    % 2) We calculate mk and gk:
    m = zeros(1, dimA); m(1) = b(1);
    g = zeros(1, dimA); g(1) = d(1)/m(1);
    
    for k=2:dimA
       m(k) = b(k) - (c(k-1)/m(k-1))*a(k-1);
       assert(m(k)~= 0, 'A main minor of the matrix has null determinant');
       g(k) = (d(k) - g(k-1)*a(k-1))/m(k);
    end
    
    % 3) We calculate x:
    x = zeros(dimA, 1); x(dimA) = g(dimA);
    
    for k=dimA-1:-1:1
        x(k) = g(k) - c(k)*x(k+1)/m(k);
    end
end