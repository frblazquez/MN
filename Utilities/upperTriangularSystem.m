%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Double degree in Mathematics - Computer engineering
%             Complutense university, Madrid
%   
%   Description: 
%   Script for computing the solution of a given system of linear equations
%   of the type Ux = b where U is an upper triangular matrix reversible.

function [x] = upperTriangularSystem(U, b)
    % This function returns the solution for the system Ux=b where U is an
    % upper triangular matrix reversible.
    dimU = size(U,1);

    % 1) Input parameters types and values are correct and consistent:
    assert(ismatrix(U),       'First parameter must be a square upper triangular matrix');
    assert(dimU == size(U,2), 'First parameter must be a square upper triangular matrix');
    assert(size(b,1) == dimU, 'Matrix and independent term dimensions are not equals');
    assert(size(b,2) == 1,    'Second parameter must be a column vector');
    
    % 2) We find the solution of the system by a stepped algorithm:
    x = zeros(dimU,1);
    
    for i=dimU:-1:1
        if(U(i,i) == 0) error('Matrix U given is not reversible'); end
        
        x(i) = (b(i) - U(i,i+1:dimU)*x(i+1:dimU))/U(i,i);
    end
end