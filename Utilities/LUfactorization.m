%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Double degree in Mathematics - Computer engineering
%             Complutense university, Madrid
%   
%   Description: Script for computing LU factorization of a given matrix.

function [L,U] = LUfactorization(A)
    % This function returns the unique lower and upper matrices verifying
    % A=L*U and L(i,i) = 1.
    
    dimA = size(A,1);

    % 1) Input parameters types and values are correct and consistent:
    assert(ismatrix(A),       'First parameter must be a square matrix');
    assert(dimA == size(A,2), 'First parameter must be a square matrix');

    % 2) LU factorization, we also detect when the matrix given doesn't
    %    accept this factorization.
    
    L = eye(dimA);
    U = zeros(dimA);

    for i=1:dimA 
        U(i,i:dimA) = A(i,i:dimA) - L(i,1:i-1)*U(1:i-1,i:dimA);
        assert(U(i,i) ~= 0, 'Matrix given doesn´t accept LU factorization');
        L(i+1:dimA,i) = (1/U(i,i))*(A(i+1:dimA,i) - L(i+1:dimA,1:i-1)*U(1:i-1,i));
    end
end