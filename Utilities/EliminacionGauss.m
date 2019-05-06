%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingeniería informática - Matemáticas
%            Universidad Complutense, Madrid
%   
%   Descripción:
%   Fichero para la lectura y resolución de sistemas del tipo Ax=b siendo 
%   A una matriz simétrica definida positiva.

disp('-----------------------------------------------------------------------');
disp('Resolución del sistema Ax=b mediante el método de eliminación gaussiana');
disp('-----------------------------------------------------------------------');

% 1) Lectura de datos por consola:
A = input('Introduzca la matriz A: '); dimA = size(A,1);
b = input('Introduzca el término independiente b: ');

% 2) Hallamos la factorización de PA=LU y la mostramos:
[p,L,U] = PALUfactorization(A);

disp('La matriz A admite factorización PA=LU de la forma:');
disp('L = '); disp(L);
disp('U = '); disp(U);
disp('El vector de permutación de filas es: '); disp(p);

% 3) Resolvemos los dos sistemas asociados y mostramos la solución:
w = lowerTriangularSystem(L,b(p(1:dimA)));
x = upperTriangularSystem(U,w);

disp('x = '); disp(x);

% 4) Permitimos al usuario variar el término independiente, ya no
%    refactorizamos la matriz A dada.
continua = input('¿Quiere variar el vector de términos independientes? [SI=1/NO=0]: ');

while(continua)
    b = input('Introduzca el nuevo término independiente b: ');
        
    w = lowerTriangularSystem(L,b(p(1:dimA)));
    x = upperTriangularSystem(U,w);
        
    disp('El nuevo valor de x es: '); disp(x);
    
    continua = input('¿Quiere variar el vector de términos independientes? [SI=1/NO=0]: ');
end
