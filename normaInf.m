function [ y ] = normaInf( x )
%Norma Infinito
%   Dado un vector x regresaremos el modulo de su mayor elemento en la variable y
max=0;
n=length(x);
for i=1:n%En este bucle se busca el maximo elemento
    if(abs(x(i))>max)
        max=abs(x(i));
    end

end
y=max;
