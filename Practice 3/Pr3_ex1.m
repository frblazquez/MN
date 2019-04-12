%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Create Matlab functions for obtaining the result of a system of linear
%   equations Ax = b where A is a square lower triangular matrix.

function x = solveLowerTriangularSystem(A, b)
    % This function returns x, the result of the system Ax = b where A is
    % a lower triangular square matrix.
    
    dimA = size(A,1);
    
    % 1) Input parameters types and values are correct and consistent:
    assert(ismatrix(A),       'First parameter must be a square matrix');
    assert(dimA == size(A,2), 'First parameter must be a square matrix');
    assert(istril(A),         'First parameter must be lower triangular matrix');
    assert(isvector(b),       'Second parameter must be a vector');
    assert(dimA == size(b,1), 'Coefficient matrix and independent term dimensions are not consistent');
    
    
    % 2) System resolution. Just one line!
    x = zeros(dimA, 1);
    
    for i=1:dimA
       x(i) = (b(i) -  A(i, 1:i-1)*x(1:i-1))/A(i,i);
    end
    
    % We calculate the solution as we would do with pencil and paper, first
    % we get the x1 term, having this, we can easily calculate x2 and so on
    
    % 2b) System resolution for upper triangular systems:
    %     x = zeros(dimA,1);
    %     
    %     for i=dimA:-1:1
    %         x(i) = (b(i) - A(i, i+1:dimA)*x(i+1:dimA))/A(i,i);
    %     end
end
