%   Francisco Javier Bl�zquez Mart�nez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingenier�a inform�tica - Matem�ticas
%            Universidad Complutense, Madrid
%   
%   Descripci�n:
%   Fichero para la lectura y resoluci�n de sistemas del tipo Ax=b siendo 
%   A una matriz con el determinante de todos sus menores principales no 
%   nulos.

disp('-------------------------------------------------------------');
disp('Resoluci�n del sistema Ax=b hallando la factorizaci�n LU de A');
disp('-------------------------------------------------------------');

% 1) Lectura de datos por consola:
A = input('Introduzca la matriz A: ');
b = input('Introduzca el t�rmino independiente b: ');

% 2) Hallamos la factorizaci�n LU y la mostramos:
[L, U] = LUfactorization(A);

disp('L = '); disp(L);
disp('U = '); disp(U);

% 3) Resolvemos los dos sistemas asociados y mostramos la soluci�n:
w = lowerTriangularSystem(L,b);
x = upperTriangularSystem(U,w);

disp('x = '); disp(x);

% 4) Permitimos al usuario variar el t�rmino independiente, ya no
%    refactorizamos la matriz A dada.
continua = input('�Quiere variar el vector de t�rminos independientes? [SI=1/NO=0]: ');

while(continua)
    b = input('Introduzca el nuevo t�rmino independiente b: ');
        
    w = lowerTriangularSystem(L,b);
    x = upperTriangularSystem(U,w);
        
    disp('El nuevo valor de x es: '); disp(x);
    
    continua = input('�Quiere variar el vector de t�rminos independientes? [SI=1/NO=0]: ');
end
