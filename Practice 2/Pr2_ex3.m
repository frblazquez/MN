%   Copyright © 2019
%   Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   Create a program for computing ||-||1 ||-||inf and ||-|| Frobeniöus of
%   a given matrix. Compare the result with norm command in Matlab.

A = [2 1 0; 0 4 0; 0 0 1];
rows = size(A,1);
cols = size(A,2);
n    = rows;

if(rows ~= cols) error('Matix given is not a square matrix.'); end

% a) || . ||1 subordinate norm to |v| = sum(1:n, abs(vi)). |v|1 in Kn
%    From theorem 2.3 at http://www.mat.ucm.es/~jrey/libro/libro.htm
%    we know that ||.||1 is the maximum of the |.|1 of the vectors in
%    the columns of the matrix given.

norm1 = 0;

for i=1:n
    % Adition of the absolute/module of each component of i-th column
    normColumn = sum(abs(A(:,i)));
    
    % We get the maximum as the norm1 new value
    norm1 = max(norm1, normColumn);
end

% b) || . ||inf subordinate norm to |v| = max(1:n, abs(vi)). |v|1 in Kn
%    From theorem 2.3 at http://www.mat.ucm.es/~jrey/libro/libro.htm
%    we know that ||.||inf is the maximum of the |.|inf of the vectors 
%    in the rows of the matrix given.

normInf = 0;

for i=1:n
    % Adition of the absolute/module of each component of i-th row
    normColum = sum(abs(A(i,:)));
    
    % We get the maximum as the normInf updated value
    normInf = max(normInf, normColum);
end

% c) || . ||F  This is the norm we get considering the matrix given as a
%    n*n components vector in euclidean space K^n.

normFrobenious = 0;

for i=1:n
for j=1:n
    % Adition of the module of the i,j element
    normFrobenious = normFrobenious + abs(A(i,j))^2;
end
end

normFrobenious = sqrt(normFrobenious);

% d) We print the result and the norm of the matrix given by matlab.
fprintf('Norm 1          = %.2f\n', norm1);
fprintf('Norm Inf        = %.2f\n', normInf);
fprintf('Norm Frobenious = %.2f\n', normFrobenious);
fprintf('Norm Matlab     = %.2f\n', norm(A));

% Honestly, at this point I don't really know wich algorithm uses matlab
% to compute the norm of a given matrix.
