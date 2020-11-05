format long
A=[1 1 2;-1 9 3;0 -1 3];
%Se aplica Potencia Inversa a la matriz A con un shift de cero (Potencia
%inversa sencilla)
rho=0;
disp('rho=0');
disp('-');
[sigmai,qi]=metodo_potencia_inv(A,[1;1;1],rho,16,eps);
n=length(A);
[v,d]=eig(A-rho*eye(n));
%Se ordenan los vaps de manera ascendente
vaps=diag(d);
[x,indices]=sort(abs(vaps));
vaps=vaps(indices);
v=v(:,indices);

vExacto=v(:,1);
vExacto=1/elementoMax(vExacto)*vExacto;%Se obtiene el vector propio normalizado 
% con respecto a la norma infinito.

q0=[0;0;0];
q1=[1;1;1];
j=1;
flag=true;
ratio=10;
while(j<16 && flag)
   %Se realizan las iteraciones para obtener la razón como en el
   %Ejercicio 1
    q0=q1;
    [x,q1]=metodo_potencia_inv(A,[1;1;1],0,j,eps);
    aux=(normaInf(q1-vExacto))/(normaInf(q0-vExacto));
    if(normaInf(q0-q1)<1E-10) %Misma condición de parada que en el ejercicio 1
        flag=false;
    else
        ratio=aux;
        
    end
    
    disp(strcat('Iteración no:',num2str(j),' es:',num2str(ratio,'%.16f')));
    j=j+1;
end

ratioTeorico=vaps(1)/vaps(2);
%Se invierten los vaps porque ahora nos interesa sacar los lambdas más
%pequeños

%Se exponen los resultados.
disp(strcat('El metodo de la potencia inversa produce: ',num2str(sigmai,'%.16f'),' como resultado'));
disp('-');
disp(strcat('El metodo eig produce:',num2str(vaps(1),'%.16f'),' como resultado'));
disp('-');
disp(strcat('El ratio practico es:',num2str(ratio,'%.16f')));
disp('-');
disp(strcat('El ratio teorico es:',num2str(ratioTeorico,'%.16f')));
error=abs((sigmai-vaps(1))/vaps(1));
disp(strcat('Error relativo vaps',num2str(error,'%.16f')))
error=(abs(ratio-ratioTeorico))/ratioTeorico;
disp(strcat('Error relativo ratio',num2str(error,'%.16f')))
disp('VExacto')
disp(vExacto)
disp('Potencia')
disp(qi)
disp('---------------------------')

%Se realizara lo mismo pero ahora para rho=3 
disp('rho=3')
rho=3;
AShiftada=(A-rho*eye(n));
[v,d]=eig(AShiftada);
[sigmai,qi]=metodo_potencia_inv(A,[1;1;1],rho,16,eps);

vaps1=diag(d);
[x,indices]=sort(abs(vaps1));
vap1s=vaps1(indices);
v=v(:,indices);

vExacto=v(:,1);
vExacto=1/elementoMax(vExacto)*vExacto;
q0=[0;0;0];
q1=[1;1;1];
j=1;
flag=true;
ratio=10;
while(j<16 && flag)
   
    q0=q1;
    [x,q1]=metodo_potencia_inv(AShiftada,[1;1;1],0,j,eps);
    aux=(normaInf(q1-vExacto))/(normaInf(q0-vExacto));
    
    if(normaInf(q0-q1)<1E-10)
        flag=false;
    else
        ratio=aux;
    end
    
    disp(strcat('Iteración no:',num2str(j),' es:',num2str(ratio,'%.16f')));
    j=j+1;
end
ratioTeorico=abs(vaps1(3)/vaps1(2));

disp(strcat('El metodo de la potencia inversa produce: ',num2str(sigmai,'%.16f'),' como resultado'));
disp('-');
disp(strcat('El metodo eig produce:',num2str(vaps(2),'%.16f'),' como resultado'));
disp('-');
disp(strcat('La razón practica con rho=',num2str(rho), ' es:',num2str(ratio,'%.16f')))
disp('-');

disp(strcat('La razón teorica con rho=',num2str(rho), ' es:',num2str(ratioTeorico,'%.16f')))
error=abs((sigmai-vaps(2))/vaps(2));
disp(strcat('Error relativo vaps',num2str(error,'%.16f')))
error=(abs(ratio-ratioTeorico))/ratioTeorico;
disp(strcat('Error relativo ratio',num2str(error,'%.16f')))
disp('-');
disp('VExacto')
disp(vExacto)
disp('Potencia')
disp(qi)
disp('---------------------------')
%Se realizara lo mismo que en los dos pasos previos pero con rho=5
disp('rho=5')
rho=5;
AShiftada=(A-rho*eye(n));
[v,d]=eig(AShiftada);
[sigmai,qi]=metodo_potencia_inv(A,[1;1;1],rho,16,eps);

vaps1=diag(d);
[x,indices]=sort(abs(vaps1));
vaps1=vaps1(indices);
v=v(:,indices);

vExacto=v(:,1);
vExacto=1/elementoMax(vExacto)*vExacto;
q0=[0;0;0];
q1=[1;1;1];
j=1;
flag=true;
ratio=10;
while(j<16 && flag)
   
    q0=q1;
    [x,q1]=metodo_potencia_inv(AShiftada,[1;1;1],0,j,eps);
    aux=(normaInf(q1-vExacto))/(normaInf(q0-vExacto));
    
    if(normaInf(q0-q1)<1E-10)
        flag=false;
    else
        ratio=aux;
    end
    
    disp(strcat('Iteración no:',num2str(j),' es:',num2str(ratio,'%.16f')));
    j=j+1;
end
ratioTeorico=abs(vaps1(1)/vaps1(2));

disp(strcat('El metodo de la potencia inversa produce: ',num2str(sigmai,'%.16f'),' como resultado'));
disp('-');
disp(strcat('El metodo eig produce:',num2str(vaps(2),'%.16f'),' como resultado'));
disp('-');
disp(strcat('La razón practica con rho=',num2str(rho), ' es:',num2str(ratio,'%.16f')))
disp('-');
disp(strcat('La razón teorica con rho=',num2str(rho), ' es:',num2str(ratioTeorico,'%.16f')))
disp('-');
error=abs((sigmai-vaps(2))/vaps(2));
disp(strcat('Error relativo vaps',num2str(error,'%.16f')))
error=(abs(ratio-ratioTeorico))/ratioTeorico;
disp(strcat('Error relativo ratio',num2str(error,'%.16f')))
disp('VExacto')
disp(vExacto)
disp('Potencia')
disp(qi)
