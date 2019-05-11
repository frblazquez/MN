%   Francisco Javier Bl�zquez Mart�nez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingenier�a inform�tica - Matem�ticas
%            Universidad Complutense, Madrid
%   
%   Descripci�n:
%   Fichero para la lectura y resoluci�n de sistemas del tipo Ax=b siendo 
%   A una matriz sim�trica definida positiva.

disp('----------------------------------------------------------------------');
disp('Resoluci�n del sistema Ax=b hallando la factorizaci�n de Cholesky de A');
disp('----------------------------------------------------------------------');

% 1) Lectura de datos por consola:
A = input('Introduzca la matriz A: ');
b = input('Introduzca el t�rmino independiente b: ');

% 2) Hallamos la factorizaci�n de Cholesky y la mostramos:
[B] = CHOLfactorization(A);

disp('B = '); disp(B);

% 3) Resolvemos los dos sistemas asociados y mostramos la soluci�n:
w = lowerTriangularSystem(B,b);
x = upperTriangularSystem(B',w);

disp('x = '); disp(x);

% 4) Permitimos al usuario variar el t�rmino independiente, ya no
%    refactorizamos la matriz A dada.
continua = input('�Quiere variar el vector de t�rminos independientes? [SI=1/NO=0]: ');

while(continua)
    b = input('Introduzca el nuevo t�rmino independiente b: ');
        
    w = lowerTriangularSystem(B,b);
    x = upperTriangularSystem(B',w);
        
    disp('El nuevo valor de x es: '); disp(x);
    
    continua = input('�Quiere variar el vector de t�rminos independientes? [SI=1/NO=0]: ');
end
