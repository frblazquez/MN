%   Francisco Javier Bl�zquez Mart�nez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingenier�a inform�tica - Matem�ticas
%            Universidad Complutense, Madrid
%   
%   Descripci�n:
%   Fichero para la implementaci�n de la resoluci�n de sistemas lineales
%   por m�todos iterativos. M�todo de la relajaci�n.

disp('-----------------------------------------------------------------');
disp('Resoluci�n del sistema Ax=b por el m�todo iterativo de relajaci�n');
disp('-----------------------------------------------------------------');

% 1) Lectura de datos:
A    = input('Introduzca la matriz A: ');
b    = input('Introduzca el t�rmino independiente b: ');
w    = input('Introduzca el par�metro de relajaci�n w: ');
prec = input('Introduzca la tolerancia deseada: ');
n_it = input('Introduzca el n�mero m�ximo de iteraciones: ');

D    = diag(A);
dimA = size(A,1);

% 2) Consistencia de los datos:
assert(ismatrix(A),       'A debe ser una matriz cuadrada sin ceros en la diagonal');
assert(dimA == size(A,2), 'A debe ser una matriz cuadrada sin ceros en la diagonal');
assert(nnz(~D) == 0,      'A debe ser una matriz cuadrada sin ceros en la diagonal');
assert(dimA == size(b,1), 'b debe ser un vector columna del orden de la matriz A');
assert(0<w && w<2,        'Por el teorema de Kahan, el m�todo de relajaci�n no converge para este w');
assert(prec >=  0,        'No se admiten valores de precisi�n negativa')

% 3) Variables que intervienen en las iteraciones:
u_k = b;             % Vale cualquier valor, hasta el cero
u_k1= zeros(dimA,1); % para el siguiente valor de u_k
r_k = zeros(dimA,1); % Vector de restos o residuos
d_k = zeros(dimA,1); % D^(-1)*r_k
it  = 0;             % N�mero de iteraciones ejecutadas
stp = 0;             % Para parar si alcanzamos la precisi�n requerida

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

% 5) An�lisis y muestra de resultados:
if(~stp)
    disp('�Advertencia!, no se ha obtenido la precisi�n deseada');
end

disp('El n�mero de iteraciones empleadas ha sido: ');
disp(it);
disp('El error estimado es: ');
disp(norm(r_k));
disp('El valor de x obtenido es: ');
disp(u_k);
