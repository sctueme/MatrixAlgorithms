function [ y ] = elementoMax( x )
%Elemento mayor
%   Dado un vector x regresaremos su elemento mayor en la variable y
max=0;
n=length(x);
for i=1:n%Buscamos el elemento con el mayor modulo
    if(abs(x(i))>abs(max))
        max=x(i);
    end

end
y=max;

end

