%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Double degree in Mathematics - Computer engineering
%             Complutense university, Madrid
%   
%   Description: Script for computing PA=LU factorization of a matrix.

function [p,L,U] = PALUfactorization(A)
    % This function returns the P*A = L*U factorization of a given matrix A
    % where L and U are lower and upper matrices respectively verifying
    % L(i,i) = 1 and p is a vector of permutation of rows of the matrix A.
    dimA = size(A,1);

    % 1) Input parameters types and values are correct and consistent:
    assert(ismatrix(A),       'First parameter must be a square matrix');
    assert(dimA == size(A,2), 'First parameter must be a square matrix');

    % 2) LU factorization considering rows permutations, we also detect 
    %    when the matrix given doesn't accept this factorization.
    p = 1:dimA;

    for i=1:dimA-1
 
        % First we get the maximum at the i-th column to know if we have to
        % permutate rows.
        [m,idx] = max(abs(A(p(i:dimA),i))); idx = idx + i - 1;
        
        assert(m ~= 0, 'Matrix given is not reversible');
        
        % We permutate the rows to have the maximum at the i-th row.
        m      = p(i);
        p(i)   = p(idx);
        p(idx) = m;
        
        % We calculate the coefficients vector.
        A(p(i+1:dimA), i) = A(p(i+1:dimA),i)/A(p(i),i);
        
        % We update the values of A after the i-th step of eliminations.
        A(p(i+1:dimA), i+1:dimA) = A(p(i+1:dimA), i+1:dimA) - A(p(i+1:dimA),i)*A(p(i), i+1:dimA);
    end
    
    % 3) We obtain the explicit matrices L and U
    U = zeros(dimA);
    L = eye(dimA);
    
    for i=1:dimA
        U(i,i:dimA) = A(p(i),i:dimA);
        L(i,1:i-1)  = A(p(i),1:i-1);
    end
end