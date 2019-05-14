%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingeniería informática - Matemáticas
%            Universidad Complutense, Madrid
%   
%   Descripción:
%   Fichero para la lectura y resolución de sistemas del tipo Ax=b siendo 
%   A una matriz tridiagonal.

%     Ejemplo de matriz tridiagonal:
%
%     (b1 c1                          )
%     (a2 b2 c2                       )
% A = (   a3 b3 c3 ...                )
%     (                 an-1 bn-1 cn-1)
%     (                      an   bn  )

disp('-----------------------------------------------------------');
disp('Resolución del sistema Ax=b siendo A una matriz tridiagonal');
disp('-----------------------------------------------------------');

% 1) Lectura de datos por consola:
d1 = input('Introduzca la diagonal inferior  de A: ');
d2 = input('Introduzca la diagonal principal de A: '); 
d3 = input('Introduzca la diagonal superior  de A: ');
b  = input('Introduzca el término independiente b: ');

% 2) Hallamos la solución del sistema Ax=b:
x = tridiagonalSystem(d1,d2,d3,b);

% 3) Hallamos la matriz sólo para mostrarla al usuario:
A = diag(d2); dimA = size(A,1);

A(1,2)          = d3(1); 
A(dimA, dimA-1) = d1(dimA-1);

for i=2:dimA-1
    A(i,i-1) = d1(i);
    A(i,i+1) = d3(i);
end

disp('A = '); disp(A);
disp('x = '); disp(x);
