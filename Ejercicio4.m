A=[1 -4 -6; -12 -8 -6; 11 10 10];
[v,d]=eig(A); %Calcularemos los vaps 

vaps=diag(d);%Los guardamos en un arreglo auxiliar y los ordenamos en orden
%ascendente
[x,indices]=sort(abs(vaps));
vaps=vaps(indices);
v=v(:,indices);

%Verificamos los modulos de los dos vaps mayores y al darnos cuenta que son
%iguales concluimos que no podemos aplicar el metodo de la potencia.
disp(strcat('El modulo del primer vap es: ',num2str(abs(vaps(3))),' y el del segundo es: ',num2str(abs(vaps(2)))))
disp('Como no hay un vap dominante el metodo de potencia no funcionara')