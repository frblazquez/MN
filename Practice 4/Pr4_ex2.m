%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingeniería informática - Matemáticas
%            Universidad Complutense, Madrid
%   
%   Descripción:
%   Fichero para la implementación de la resolución de sistemas lineales
%   por métodos iterativos. Método de la relajación.

disp('-----------------------------------------------------------------');
disp('Resolución del sistema Ax=b por el método iterativo de relajación');
disp('-----------------------------------------------------------------');

% 1) Lectura de datos:
A    = input('Introduzca la matriz A: ');
b    = input('Introduzca el término independiente b: ');
w    = input('Introduzca el parámetro de relajación w: ');
prec = input('Introduzca la tolerancia deseada: ');
n_it = input('Introduzca el número máximo de iteraciones: ');

D    = diag(A);
dimA = size(A,1);

% 2) Consistencia de los datos:
assert(ismatrix(A),       'A debe ser una matriz cuadrada sin ceros en la diagonal');
assert(dimA == size(A,2), 'A debe ser una matriz cuadrada sin ceros en la diagonal');
assert(nnz(~D) == 0,      'A debe ser una matriz cuadrada sin ceros en la diagonal');
assert(dimA == size(b,1), 'b debe ser un vector columna del orden de la matriz A');
assert(0<w && w<2,        'Por el teorema de Kahan, el método de relajación no converge para este w');
assert(prec >=  0,        'No se admiten valores de precisión negativa')

% 3) Variables que intervienen en las iteraciones:
u_k = b;             % Vale cualquier valor, hasta el cero
u_k1= zeros(dimA,1); % para el siguiente valor de u_k
r_k = zeros(dimA,1); % Vector de restos o residuos
d_k = zeros(dimA,1); % D^(-1)*r_k
it  = 0;             % Número de iteraciones ejecutadas
stp = 0;             % Para parar si alcanzamos la precisión requerida

% 4) Iteraciones:
while (it < n_it &&  ~stp)
    
    for i=1:dimA
        r_k(i) = b(i) - A(i,1:i-1)*u_k1(1:i-1) - A(i, i:dimA)*u_k(i:dimA);
        d_k(i) = r_k(i)/D(i);
        u_k1(i)= u_k(i) + d_k(i);
    end
    
    if(norm(r_k) <= prec) stp = 1; end
    it  = it+1;
    u_k = u_k1;
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
