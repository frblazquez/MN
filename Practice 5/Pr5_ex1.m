%   Francisco Javier Bl�zquez Mart�nez  ~ frblazqu@ucm.es
%
%    Doble grado en Ingenier�a inform�tica - Matem�ticas
%            Universidad Complutense, Madrid
%   
%   Descripci�n:
%   Fichero para la implementaci�n de la interpolaci�n de Lagrange mediante
%   la f�rmula de Newton.

disp('--------------------------------------------------------------------');
disp('Polinomio de interpolaci�n de Lagrange mediante la f�rmula de newton');
disp('--------------------------------------------------------------------1');

%--------------------------------------------------------------------------
% 1) Lectura de datos:
%--------------------------------------------------------------------------
x   = input('Introduzca las abscisas de interpolaci�n: ');
opt = input('�Interpolaci�n desde tabla [0] o dada una funci�n [1]?: ');
n   = length(x);

if opt == 0 % Funci�n tabulada
    y = input('Introduzca los valores en los puntos anteriores en orden: ');
else        % Funci�n expl�cita
    f = input('Introduzca la funci�n a interpolar: ');
    y = f(x);
end

%--------------------------------------------------------------------------
% 2) Construcci�n del polinomio de interpolaci�n:
%--------------------------------------------------------------------------
tabla = y;      % Tabla para las diferencias divididas (se reduce a un vector)
Pol   = y(1);   % Polinomio de interpolaci�n (inicialmente f(x_1))
p     = 1;      % Funci�n Prod_i(x)

for i = 1:n-1
    for j = 1:n-i  %Actualizamos la tabla
       tabla(j) = (tabla(j) - tabla(j+1)) / (x(j) - x(j+i));
    end
    
    p   = [p 0]   - [0, p .* x(i)]; % Prod_i+1(x) = x*Prod_i(x) + x(i+1)*Prod_i(x)
    Pol = [0 Pol] +  p * tabla(1);  % Pol_i+1(x)  = Pol_i(x) + Prod_i+1(x)*Dif_divididas
end

%--------------------------------------------------------------------------
% 3) Dibujamos el polinomio de interpolaci�n y la funci�n/tabla:
%--------------------------------------------------------------------------
% Puntos:
plot(x, y, 'rs');
hold on

% Polinomio:
part = linspace(min(x), max(x));    % 100 divisiones por defecto
plot(part, polyval(Pol, part));     % Polyval eval�a el polinomio en la base natural {x^n, ... , 1} 

% Funci�n (si procede, en color verde): 
if opt == 1  fplot(f, [min(x), max(x)], 'g'); end

% Leyenda en el dibujo de la funci�n:
legend('Puntos' ,'Interpolaci�n', 'Funci�n')
hold off

%--------------------------------------------------------------------------
% 4) Iteramos el proceso mientras el usuario quiera a�adir puntos:
%--------------------------------------------------------------------------
cont = input('�Desea a�adir un nuevo punto de interpolaci�n? [S�=1,No=0]: ');

while cont
    n = n+1;
    
    % Tomamos los nuevos datos:
    x(n) = input('Nueva abscisa donde interpolar: '); 

    if opt == 0 % Tabla
        y(n) = input('Valor en el punto a�adido: ');
    else        % Funci�n
        y(n) = f(x(n));
    end
    
    % Ahora no rellenamos la columna de al lado sino la nueva diagonal surgida:
    tabla(n) = y(n);
    for j = n-1:-1:1 
        tabla(j) = (tabla(j) - tabla(j+1)) / (x(j) - x(n));
    end

    % Actualizamos el productorio y el polinomio de interpolaci�n:
    p   = [p 0]   - [0, p .* x(n-1)];
    Pol = [0 Pol] +  p * tabla(1); 
    
    % Pintamos los puntos
    plot(x, y, 'rs');
    hold on
    
    % Pintamos el polinomio
    part = linspace(min(x), max(x));
    plot(part, polyval(Pol, part));
    
    % Pintamos la funci�n (si procede, en color verde):
    if opt == 1  fplot(f, [min(x), max(x)], 'g');  end
    
    % Leyenda:
    legend('Puntos' ,'Pol.Int.', 'Funcion')
    hold off
    
    cont = input('�Desea a�adir un nuevo punto de interpolaci�n? [S�=1,No=0]: ');
end