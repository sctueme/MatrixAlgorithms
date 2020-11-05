format long;
A=[1 1 2;-1 9 3;0 -1 3];
n=length(A);%Obtener la longitud de la matriz
[sigmai,qi]=metodo_potencia(A,[1;1;1],15,eps)
%Realizamos las iteraciones para comprobar que efectivamente nos den los
%vaps y veps de la matriz A
[v,d]=eig(A);
vaps=diag(d);
 %DE la misma descomposición en eig que nos da Matlab,
%ordenamos los veps en orden ascendente con respecto al módulo de
%los valores propios
[x,indices]=sort(abs(vaps));
vaps=vaps(indices);
v=v(:,indices);
vExacto=v(:,n); %Vector propio exacto
vExacto=vExacto/elementoMax(vExacto)%Vector propio exacto normalizado con el
%elemento mayor.
q0=[0;0;0];
q1=[1;1;1];
j=1;
flag=true;
aux=0;
while(j<16 && flag)
  %Para obtener el ratio teórico, dado que nuestros valores ya estan
%ordenados, sólo no queda dividir q1 equivalente a lambda_2 y q0
%equivalente a lambda_1
    q0=q1;
    [x,q1]=metodo_potencia(A,[1;1;1],j,eps);
    aux=(normaInf(q1-vExacto))/(normaInf(q0-vExacto));
    %Para obtener la razón, iteramos y vamos realizando el método de la
%potencia guardando el valor j que ya teníamos antes y se detiene la
%iteración hasta que la norma Infinito del vector actual menos el anterior
%sea mas pequeño que una tolerancia.
    if(normaInf(q0-q1)<1E-10)
        flag=false;
    else
        ratio=aux;
    end
    disp(strcat('Iteración no:',num2str(j),' es:',num2str(ratio,'%.16f')));
    j=j+1;
  
end
%De esta manera se obtiene el ratio práctico, porque en vaps se encuentran
%los valores propio ordenados de mayor a menor.
ratioTeorico=vaps(2)/vaps(3);
%Exponemos los resultados
disp(strcat('El metodo de la potencia produce: ',num2str(sigmai,'%.16f'),' como resultado'));
disp('-');
disp(strcat('El metodo eig produce:',num2str(elementoMax(d),'%.16f'),' como resultado'));
disp('-');
disp(strcat('El ratio practico es:',num2str(ratio,'%.16f')));
disp('-');
disp(strcat('El ratio teorico es:',num2str(ratioTeorico,'%.16f')));
disp('-')
error=abs((sigmai-vaps(3))/vaps(3));
disp(strcat('Error relativo vaps',num2str(error,'%.16f')))
error=(abs(ratio-ratioTeorico))/ratioTeorico;
disp(strcat('Error relativo veps',num2str(error,'%.16f')))
