A=gallery( 'fiedler', 25 );%Se genera una matriz de 25x25
disp('El numero de iteraciones que requirio QR simple son')
v1=MQR_simple( A , 2000, 1E-10);%Se obtienen los vaps con QR simple
v1=sort(v1);
disp('Los vaps ocupando QR simple son:')
disp(v1);
disp('El numero de iteraciones que requirio QR dinamico son')
v2=MQR_dynamic( A, 100, 1E-10);%Se obtienen los vaps con QR dinamico
v2=sort(v2);
disp('Los vaps ocupando QR dinamico son:')
disp(v2);
v3=eigs(A,25);%Se obtienen los vaps con eigs de matlab
v3=sort(v3);
disp('Los vaps ocupando eig son:')
disp(v3);

