%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Create a program for computing successive powers of a given matrix 
%   after checking that ||1, ||Inf or ||Frobeniöus of that matrix is
%   smaller than one, so the iterative schema converges.

A = [0.5 0.9 0.6; 0 0 0.3; 0.2 0 0];
rows = size(A,1);
cols = size(A,2);
n    = rows;

if(rows ~= cols) error('Matix given is not a square matrix.'); end

% From Pr2_ex3, we first calculate the norms of this matrix:
norm1 = 0;

for i=1:n
    % Adition of the absolute/module of each component of i-th column
    normColumn = sum(abs(A(:,i)));
    
    % We get the maximum as the norm1 new value
    norm1 = max(norm1, normColumn);
end

normInf = 0;

for i=1:n
    % Adition of the absolute/module of each component of i-th row
    normColum = sum(abs(A(i,:)));
    
    % We get the maximum as the normInf updated value
    normInf = max(normInf, normColum);
end

normFrobenious = 0;

for i=1:n
for j=1:n
    % Adition of the module of the i,j element
    normFrobenious = normFrobenious + abs(A(i,j))^2;
end
end

normFrobenious = sqrt(normFrobenious);

% Now we iterates if the iterative schema converges:

if(normFrobenious >= 1 && norm1 >= 1 && normInf >= 1)
    error('The powers of the matrix don`t converge');
end
    
Ak = eye(n);
   
for i=1:20
    Ak = Ak*A;
end
    
disp(Ak);