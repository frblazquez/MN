%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Double degree in Mathematics - Computer engineering
%             Complutense university, Madrid
%   
%   Description: Script for computing Cholesky factorization of a matrix.

function [B] = CHOLfactorization(A)
    % This function returns the unique lower matrix B verifying that A=B*B'
    % if this exists. In other cases return an error message.
    dimA = size(A,1);

    % 1) Input parameters types and values are correct and consistent:
    assert(ismatrix(A),       'First parameter must be a symetric square matrix');
    assert(dimA == size(A,2), 'First parameter must be a symetric square matrix');
    assert(issymmetric(A),    'First parameter must be a symetric square matrix');
    
    % 2) Cholesky factorization, we also detect when the matrix given doesn't
    %    accept this factorization.
    B = zeros(dimA);
    
    for i=1:dimA
        B(i,i)          = sqrt(A(i,i) - sum(B(i,1:i-1).^2));
        assert(B(i,i)~= 0, 'Matrix given is not strictly positive definite');
        B(i+1:dimA, i)  = (1/B(i,i))*((A(i,i+1:dimA)' - B(i+1:dimA,1:i-1)*(B(i,1:i-1))'));
    end
end