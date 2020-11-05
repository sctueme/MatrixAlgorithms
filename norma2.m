function [ y ] = norma2( x )
%Norma Euclidiana
%   Dado un vector x regresaremos su norma en la variable y
sum=0;
n=length(x);
for i=1:n%Se realiza la suma x1^2+...+xn^2
    sum=sum+(abs(x(i)))^2;
end
y=sqrt(sum);%Se obtiene la raiz cuadrada y esta es la norma

