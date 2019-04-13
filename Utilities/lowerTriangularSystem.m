%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Double degree in Mathematics - Computer engineering
%             Complutense university, Madrid
%   
%   Description: 
%   Script for computing the solution of a given system of linear equations
%   of the type Lx = b where L is a lower triangular matrix reversible.

function [x] = lowerTriangularSystem(L, b)
    % This function returns the solution for the system Lx=b where L is a
    % lower triangular matrix reversible.
    dimL = size(L,1);

    % 1) Input parameters types and values are correct and consistent:
    assert(ismatrix(L),       'First parameter must be a square lower triangular matrix');
    assert(dimL == size(L,2), 'First parameter must be a square lower triangular matrix');
    assert(size(b,1) == dimL, 'Matrix and independent term dimensions are not equals');
    assert(size(b,2) == 1,    'Second parameter must be a column vector');
    
    % 2) We find the solution of the system by a stepped algorithm:
    x = zeros(dimL,1);
    
    for i=1:dimL
        if(L(i,i) == 0) error('Matrix L given is not reversible'); end
        
        x(i) = (b(i) - L(i,1:i-1)*x(1:i-1))/L(i,i);
    end
end