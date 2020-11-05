format long;
A=[1 1 2;-1 9 3;0 -1 3];
a1=[0;1;1];
a2=[-1;0;1];
a3=[1;1;1];%Estas son nuestras propuestas de vectores que generaran los veps
[sigma1,q1]=metodo_potencia_invRayleigh(A,a1,6);
[sigma2,q2]=metodo_potencia_invRayleigh(A,a2,6);
[sigma3,q3]=metodo_potencia_invRayleigh(A,a3,6);%Generamos los veps a partir
%de esas aproximaciones iniciales
[v,d]=eig(A);%Generamos los vaps y veps exactos.
disp('Los vectores utilizados son')
disp([a1,a2,a3])

 LI=[q1 q2 q3]%ponemos en una matriz los veps generados y su determinante
 %es distinto de cero son linealmente independientes.
 disp(strcat('Como el determinante de una matriz con los veps es:',num2str(det(LI),'%.16f')));
 disp('los veps son linealmente independientes');
 disp('Los vaps asociados son:')
 disp([sigma1;sigma2;sigma3])%Mostramos los vaps aproximados
 disp('-');

vExacto=v(:,1);
vExacto=(1/elementoMax(vExacto))*vExacto;%Normalizamos el vector exacto
q0=[0;0;0];
q1=a1;
j=1;
flag=true;
aux=0;
while(j<16 && flag)%Calculamos la razon cuadratica a cada iteración
   
    q0=q1;
    [x,q1]=metodo_potencia_invRayleigh(A,a1,j);
    ratio=(normaInf(q1-vExacto))/(normaInf(q0-vExacto))^2;
    
    if(normaInf(q0-q1)<1E-5)%la condición de parada es similar a la de los
        %ejercicios anteriores.
   
        flag=false;
    end
        disp(strcat('Iteración no:',num2str(j),' es:',num2str(ratio,'%.16f')));

    j=j+1;
end
%Se necesitan menos iteraciones que en los otros metodos porque potencia
%con shift converge mucho mas rapido.
disp('1er vep')
disp(q1)
disp(strcat('El limite de potencia con shift dinamico del primer vector es:',num2str(ratio,'%.16f')))

%A continuación si se desean calcular las iteraciones de los otros dos veps
%se puede descomentar el codigo y realiza justo eso.


%{
disp('-');

vExacto=v(:,2);
vExacto=(1/elementoMax(vExacto))*vExacto;
q0=[0;0;0];
q1=a2;
j=1;
flag=true;
aux=0;
while(j<16 && flag)
   
    q0=q1;
    [x,q1]=metodo_potencia_invRayleigh(A,a2,j);
    ratio=(normaInf(q1-vExacto))/(normaInf(q0-vExacto))^2;
    
    if(normaInf(q0-q1)<1E-5)
   
        flag=false;
    end
        disp(strcat('Iteración no:',num2str(j),' es:',num2str(ratio,'%.16f')));

    j=j+1;
end
disp('2do vep')
disp(q1)
disp(strcat('El limite de potencia con shift dinamico del segundo vector es:',num2str(ratio)))
disp('-');

vExacto=v(:,3);
vExacto=(1/elementoMax(vExacto))*vExacto;
q0=[0;0;0];
q1=a3;
j=1;
flag=true;
aux=0;
while(j<16 && flag)
   
    q0=q1;
    [x,q1]=metodo_potencia_invRayleigh(A,a3,j);
    ratio=(normaInf(q1-vExacto))/(normaInf(q0-vExacto))^2;
    
    if(normaInf(q0-q1)<1E-5)
   
        flag=false;
    end
       disp(strcat('Iteración no:',num2str(j),' es:',num2str(ratio,'%.16f')));

    j=j+1;
end
disp('3er vep')
disp(q1)
disp(strcat('El limite de potencia con shift dinamico del tercer vector es:',num2str(ratio)))

%}