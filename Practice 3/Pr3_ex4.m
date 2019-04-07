%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Implement a function for obtaining the LU factorization of a given
%   matrix.

function [L,U] = LUfactorization(A)
%     % This function returns the unique lower and upper matrices verifying
%     % A=L*U and L(i,i) = 1.
    
    dimA = size(A,1);

    % 1) Input parameters types and values are correct and consistent:
    %assert(ismatrix(A),       'First parameter must be a square matrix');
    %assert(dimA == size(A,2), 'First parameter must be a square matrix');

    % 2) LU factorization, we also detect when the matrix given doesn't 
    % accept this factorization.

    for i=1:dimA-1         
        % We calculate the coefficients vector.
        A(i+1:dimA, i) = A(i+1:dimA,i)/A(i,i);
        
        % We update the values of A after the i-th step of eliminations.
        A(i+1:dimA, i+1:dimA) = A(i+1:dimA, i+1:dimA) - A(i+1:dimA,i)*A(i, i+1:dimA);
    end
    
    U = triu(A);
    L = tril(A);      for i=1:dimA L(i,i)=1; end
end

%--------------------------------------------------------------------------
% function [L,U] = LUfactorization(A)
%     % This function returns the unique lower and upper matrices verifying
%     % A=L*U and L(i,i) = 1.
%     
%     dimA = size(A,1);
% 
%     % 1) Input parameters types and values are correct and consistent:
%     assert(ismatrix(A),       'First parameter must be a square matrix');
%     assert(dimA == size(A,2), 'First parameter must be a square matrix');
% 
%     % 2) LU factorization, we also detect when the matrix given doesn't
%     %    accept this factorization.
%     
%     L = eye(dimA);
%     U = zeros(dimA);
% 
%     for i=1:dimA-1 
%         U(i,i:dimA) = A(i,i:dimA) - L(i,1:i-1)*U(1:i-1,i:dimA);
%         assert(U(i,i) ~= 0, 'Matrix given doesn´t accept LU factorization');
%         L(i+1:dimA,i) = (1/U(i,i))*(A(i+1:dimA,i) - L(i+1:dimA,1:i-1)*U(1:i-1,i));
%     end
% end

%--------------------------------------------------------------------------
% function [LU] = LUfactorization(A)
%     % This function returns x, the result of the system Ax = b where A is
%     % a lower triangular square matrix.
%     
%     dimA = size(A,1);
%     
%     % 1) Input parameters types and values are correct and consistent:
%     %assert(ismatrix(A),       'First parameter must be a square matrix');
%     %assert(dimA == size(A,2), 'First parameter must be a square matrix');
% 
%     % 2) LU factorization, we also detect when the matrix given doesn't
%     %    accept this factorization.
%     
%     for j=1:dimA
%         assert(A(j,j) ~= 0, 'Matrix given doesnt accept LU factorization');
%         
%         for i=j+1:dimA
%             if(A(i,j) ~= 0)
%                 A(i,j) = A(i,j)/A(j,j);
%                 A(i,j+1:dimA) = A(i,j+1:dimA) - A(i,j)*A(j,j+1:dimA);
%             end
%         end
%         
%     end
%     
%     LU = A;
% end
%--------------------------------------------------------------------------
