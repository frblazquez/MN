%   Francisco Javier Bl�zquez Mart�nez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingenier�a inform�tica - Matem�ticas
%            Universidad Complutense, Madrid
%   
%   Descripci�n:
%   Fichero para la lectura y resoluci�n de sistemas del tipo Ax=b siendo 
%   A una matriz tridiagonal.

%     Ejemplo de matriz tridiagonal:
%
%     (b1 c1                          )
%     (a2 b2 c2                       )
% A = (   a3 b3 c3 ...                )
%     (                 an-1 bn-1 cn-1)
%     (                      an   bn  )

disp('-----------------------------------------------------------');
disp('Resoluci�n del sistema Ax=b siendo A una matriz tridiagonal');
disp('-----------------------------------------------------------');

% 1) Lectura de datos por consola:
d1 = input('Introduzca la diagonal inferior  de A: ');
d2 = input('Introduzca la diagonal principal de A: '); 
d3 = input('Introduzca la diagonal superior  de A: ');
b  = input('Introduzca el t�rmino independiente b: ');

% 2) Hallamos la soluci�n del sistema Ax=b:
x = tridiagonalSystem(d1,d2,d3,b);

% 3) Hallamos la matriz s�lo para mostrarla al usuario:
A = diag(d2); dimA = size(A,1);

A(1,2)          = d3(1); 
A(dimA, dimA-1) = d1(dimA-1);

for i=2:dimA-1
    A(i,i-1) = d1(i);
    A(i,i+1) = d3(i);
end

disp('A = '); disp(A);
disp('x = '); disp(x);
