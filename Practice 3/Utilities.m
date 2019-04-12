%   Copyright � 2019
%   Francisco Javier Bl�zquez Mart�nez ~ frblazqu@ucm.es
%
%   Double degree in Mathematics - Computer engineering
%           Complutense University, Madrid
%
%   Description:
%   File for creating test cases in other files

dim = 1000; kte = 50;

A = zeros(dim);

for i=1:dim
for j=1:dim
    A(i,j) = kte*rand(1,1);
end
end

tic 
    Pr3_ex4Manu(A);
toc

tic
    Pr3_ex4(A);
toc
