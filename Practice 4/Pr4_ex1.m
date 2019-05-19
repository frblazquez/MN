%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingeniería informática - Matemáticas
%            Universidad Complutense, Madrid
%   
%   Descripción:
%   Fichero para la implementación de la resolución de sistemas lineales
%   por métodos iterativos. Método de Jacobi.

disp('-------------------------------------------------------------');
disp('Resolución del sistema Ax=b por el método iterativo de Jacobi');
disp('-------------------------------------------------------------');

% 1) Lectura de datos:
A    = input('Introduzca la matriz A: ');
b    = input('Introduzca el término independiente b: ');
prec = input('Introduzca la tolerancia deseada: ');
n_it = input('Introduzca el número máximo de iteraciones: ');

D    = diag(A);
dimA = size(A,1);

% 2) Consistencia de los datos:
assert(ismatrix(A),       'A debe ser una matriz cuadrada sin ceros en la diagonal');
assert(dimA == size(A,2), 'A debe ser una matriz cuadrada sin ceros en la diagonal');
assert(nnz(~D) == 0,      'A debe ser una matriz cuadrada sin ceros en la diagonal');
assert(dimA == size(b,1), 'b debe ser un vector columna del orden de la matriz A');
assert(prec >=  0,        'No se admiten valores de precisión negativa')

% 3) Variables que intervienen en las iteraciones:
u_k = b;             % Vale cualquier valor, hasta el cero
r_k = zeros(dimA,1); % Vector de restos o residuos
d_k = zeros(dimA,1); % D^(-1)*r_k
it  = 0;             % Número de iteraciones ejecutadas
stp = 0;             % Para parar si alcanzamos la precisión requerida

% 4) Iteraciones:
while (it < n_it &&  ~stp)
    r_k = b - A*u_k;
    d_k = r_k./D;
    u_k = u_k + d_k;
    
    it = it+1;
    if(norm(r_k) <= prec) stp = 1; end
end

% 5) Análisis y muestra de resultados:
if(~stp)
    disp('¡Advertencia!, no se ha obtenido la precisión deseada');
end

disp('El número de iteraciones empleadas ha sido: ');
disp(it);
disp('El error estimado es: ');
disp(norm(r_k));
disp('El valor de x obtenido es: ');
disp(u_k);
