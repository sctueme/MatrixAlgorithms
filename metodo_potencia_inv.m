function [sigmai, qi] = metodo_potencia_inv(A, q0, rho, k, tol)
%Metodo de potencia inversa utilizando un shift predeterminado.
%   Calcula el valor propio dominado (el menor) y su vector propio asociado
%   , A es la matriz, q0 es un vector arbitrario,rho es un shift para que 
%   algoritmo converja mas rapido k es el numero maximo de iteraciones
%   y tol es la condición de parada.


qi=q0;%Vector sobre el que se iterara.
q1=-q0;%Variable para guardar el vector anterior.
i=0;%Contador de iteraciones
while(normaInf(qi-q1)/normaInf(qi)>tol && i<k)%Condiciones de parada.
    q1=qi;%Guardamos el vector anterior.
    qi=(A-(eye(size(A)))*rho)\qi;%Es equivalente a realizar (A-rho*I)^-1*qi
    sigmai=elementoMax(qi);%Escogemos el mayor elemento para normalizar.
    qi=(1/sigmai)*qi;%Normalizamos el vector para que no diverja en norma o
    %que converja al vector [0,...,0]
    i=i+1;
end

sigmai=1/sigmai+rho;%Se invierte el vap de la matriz (A-rho*I) y se le suma
%rho para obtener el vap.
end

