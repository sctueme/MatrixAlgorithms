function [ lambdas ] = MQR_dynamic( A,k,tol )
%Algoritmo QR con shift dinamico
%   Una mejora al algoritmo QR simple, A es la matriz de la que queremos
%   encontrar sus vaps, k es el numero maximo de iteraciones y tol es la
%   tolerancia, el algoritmo regresa un vector con todos los vaps.
A=hess(A);%Se usara la forma Hessemberg para minimizar las operaciones. 
i=0;
m=length(A);
lambdas=zeros(m,1);%Se inicializa el vector que contendra a los vaps
while(m>1)%En este loop se hallara un vap
    while(normaInf(A(m,m-1))>tol && i<k)
    s=A(m,m);%Se calcula el shift como la coordenada m,m de la matriz
    [Qm,Rm]=qr(A-eye(m)*s);%Se shiftea la matriz y se calcula su descomposicion QR
    A=Rm*Qm+(eye(m)*s);%Se genera la siguiente iteración y se le suma el shift
    i=i+1;
    end%deflación
    lambdas(m)=A(m,m);%Se guarda el vap
    m=m-1;
    A=A(1:m,1:m);%Aqui se hace la deflación de la matriz
end
disp(i)
lambdas(1)=A(1,1);%Se guarda el ultimo vap.