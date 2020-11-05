function [sigmai, qi] = metodo_potencia(A, q0, k, tol)
%Metodo de la potencia simple.
%   Calcula el valor propio dominante y su vector propio asociado, A es la
%   matriz, q0 es un vector arbitrario, k es el numero maximo de
%   iteraciones y tol es la condición de parada.

qi=q0; %En este vector se guardara el resultado, es sobre el que se iterará
q1=-q0; %En este vector se guardar el vector anterior al actual, lo hacemos
%para poder comparar y determinar si la condición de parada ya fue
%cumplida.
i=0; %Una variable para contar el numero de iteraciones que llevamos
while(normaInf(qi-q1)/normaInf(qi)>tol && i<k) %mientras que el error rela-
%tivo sea mas grande que la tolerancia y no hallamos pasado del numero de
%iteraciones especificado por el parametro k.
    q1=qi;%Se guarda el vector anterior
    qi=A*qi;%Se multiplica el vector actual por la matriz para cambiar la 
%direccion de este.
    sigmai=elementoMax(qi);%Se elije el elemento maximo para poder normali-
%zar utilizando la norma infinito.
    qi=(1/sigmai)*qi;%Se normaliza para que el vector no diverja en cuanto 
%a su norma y para que no converja al [0,...,0]
    i=i+1;
end


