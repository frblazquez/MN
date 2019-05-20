%   Francisco Javier Blázquez Martínez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingeniería informática - Matemáticas
%            Universidad Complutense, Madrid
%   
%   Descripción:
%   Fichero para la implementación de la interpolación de Lagrange mediante
%   la fórmula de Newton.

disp('--------------------------------------------------------------------');
disp('Polinomio de interpolación de Lagrange mediante la fórmula de newton');
disp('--------------------------------------------------------------------1');

%--------------------------------------------------------------------------
% 1) Lectura de datos:
%--------------------------------------------------------------------------
x   = input('Introduzca las abscisas de interpolación: ');
opt = input('¿Interpolación desde tabla [0] o dada una función [1]?: ');
n   = length(x);

if opt == 0 % Función tabulada
    y = input('Introduzca los valores en los puntos anteriores en orden: ');
else        % Función explícita
    f = input('Introduzca la función a interpolar: ');
    y = f(x);
end

%--------------------------------------------------------------------------
% 2) Construcción del polinomio de interpolación:
%--------------------------------------------------------------------------
tabla = y;      % Tabla para las diferencias divididas (se reduce a un vector)
Pol   = y(1);   % Polinomio de interpolación (inicialmente f(x_1))
p     = 1;      % Función Prod_i(x)

for i = 1:n-1
    for j = 1:n-i  %Actualizamos la tabla
       tabla(j) = (tabla(j) - tabla(j+1)) / (x(j) - x(j+i));
    end
    
    p   = [p 0]   - [0, p .* x(i)]; % Prod_i+1(x) = x*Prod_i(x) + x(i+1)*Prod_i(x)
    Pol = [0 Pol] +  p * tabla(1);  % Pol_i+1(x)  = Pol_i(x) + Prod_i+1(x)*Dif_divididas
end

%--------------------------------------------------------------------------
% 3) Dibujamos el polinomio de interpolación y la función/tabla:
%--------------------------------------------------------------------------
% Puntos:
plot(x, y, 'rs');
hold on

% Polinomio:
part = linspace(min(x), max(x));    % 100 divisiones por defecto
plot(part, polyval(Pol, part));     % Polyval evalúa el polinomio en la base natural {x^n, ... , 1} 

% Función (si procede, en color verde): 
if opt == 1  fplot(f, [min(x), max(x)], 'g'); end

% Leyenda en el dibujo de la función:
legend('Puntos' ,'Interpolación', 'Función')
hold off

%--------------------------------------------------------------------------
% 4) Iteramos el proceso mientras el usuario quiera añadir puntos:
%--------------------------------------------------------------------------
cont = input('¿Desea añadir un nuevo punto de interpolación? [Sí=1,No=0]: ');

while cont
    n = n+1;
    
    % Tomamos los nuevos datos:
    x(n) = input('Nueva abscisa donde interpolar: '); 

    if opt == 0 % Tabla
        y(n) = input('Valor en el punto añadido: ');
    else        % Función
        y(n) = f(x(n));
    end
    
    % Ahora no rellenamos la columna de al lado sino la nueva diagonal surgida:
    tabla(n) = y(n);
    for j = n-1:-1:1 
        tabla(j) = (tabla(j) - tabla(j+1)) / (x(j) - x(n));
    end

    % Actualizamos el productorio y el polinomio de interpolación:
    p   = [p 0]   - [0, p .* x(n-1)];
    Pol = [0 Pol] +  p * tabla(1); 
    
    % Pintamos los puntos
    plot(x, y, 'rs');
    hold on
    
    % Pintamos el polinomio
    part = linspace(min(x), max(x));
    plot(part, polyval(Pol, part));
    
    % Pintamos la función (si procede, en color verde):
    if opt == 1  fplot(f, [min(x), max(x)], 'g');  end
    
    % Leyenda:
    legend('Puntos' ,'Pol.Int.', 'Funcion')
    hold off
    
    cont = input('¿Desea añadir un nuevo punto de interpolación? [Sí=1,No=0]: ');
end