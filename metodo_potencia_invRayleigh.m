function [sigmai, qi] = metodo_potencia_invRayleigh(A, q0, k)
%Metodo de la potencia con shift dinamico (Rayleigh)
%   Es una mejora sobre el metodo de la potencia inversa, con un shift que
%   cambia a cada iteración, a diferencia de los otro metodos que son
%   derivadas del metodo de la potencia este no tiene una tolerancia porque
%   entre mas se acerquen las iteraciones al vap la matriz se hace cercana
%   a singular y no se puede calcular su inversa,A es la matriz que se
%   desea calcular sus vaps, q0 es una aproximación inical al vep y k es el
%   numero maximo de iteraciones.

qi=q0;%Inicializamos el vector que se iterara con una aproximación al vep.
i=0;%El contador para contar cuantas iteraciones llevamos.


while(i<k)%La condición ahora solo radica en el no de iteraciones.
    rayleighi=(ctranspose(qi)*A*qi)/(ctranspose(qi)*qi);%Calculamos nuestro 
    %shift que sera el cociente de Rayleigh
    warning('off')%Apagamos las advertencias para que no enuncie el error 
    %que dice que la matriz es cercana a singular
    qi=(A-(eye(size(A)))*rayleighi)\qi;%Es equivalente a realizar 
    %(A-rayleighi*I)^-1*qi
    warning('on')%Activamos las advertencias
    sigmai=elementoMax(qi);%Escogemos el elemento maximo para normalizar el vector
    qi=(1/sigmai)*qi;%Normalizamos
    i=i+1;
end

sigmai=rayleighi;%Recordemos que la mejor aproximación al vap es el ultimo
%cociente de rayleigh

end

