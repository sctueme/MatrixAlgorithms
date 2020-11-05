function [ lambdas ] = MQR_simple( A,k,tol )
%Algoritmo QR sencillo
%   A es la matriz de la cual deseamos encontrar sus vaps, k es el numero
%   maximo de iteraciones y tol es la tolerancia, el algoritmo regresa
%   lambdas que es un vector con todos los vaps de la matriz.
Am=hess(A);%Se usara la forma de Hessenberg para reducir las operaciones.
i=0;
while(normaInf(diag(Am,-1))>tol && i<k)%Nuestra condicion de parada es que 
    %la matriz A ya sea triangular o que rebasemos el numero de
    %iteraciones.
    [Qm,Rm]=qr(Am);%Obtenemos la descomposición QR de la matriz.
    Am=Rm*Qm;%Las multiplicamos en orden inverso para tener la siguiente 
    %iteración
    i=i+1;
end

disp(i)
lambdas=diag(Am); %Regresamos la diagonal de la matriz triangular.