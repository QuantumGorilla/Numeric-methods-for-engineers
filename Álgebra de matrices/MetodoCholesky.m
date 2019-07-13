clc ;
clear all;
format rat;
syms x;
syms y;
syms z;
A = input("Digite el sistema de ecuaciones representado como matriz:  ");
b = input("Digite el vector solución: ");

[nRows, nColumns]=size(A);

vec=[x;y;z];
disp("Sistema de ecuaciones: ");
for i=1:nRows
    mostrar(i,1)=A(i,:)*vec;
end
for i=1:nRows
   mostrar(i,2)=b(i); 
end
disp(mostrar);

[L,U] = croultFactorization(A);
disp("Matriz L: ");
disp(L);
disp("Matriz U: ");
disp(U);


%paso 2
n=length(b);
d=det(L);
vectorY=zeros(n,1);
for i=1:n
    Lb=[L(:,1:i-1),b,L(:,i+1:n)];
    vectorY(i)=det(Lb)/d;
end
%paso 3
disp("Vector Y: ");
disp(vectorY);
n=length(vectorY);
d=det(U);
vectorX=zeros(n,1);
for i=1:n
    Ux=[U(:,1:i-1),vectorY,U(:,i+1:n)];
    vectorX(i)=det(Ux)/d;
end

disp("Solucion:")

fprintf("X=%s\n",strtrim(rats(vectorX(1))));
fprintf("Y=%s\n",strtrim(rats(vectorX(2))));
fprintf("Z=%s\n",strtrim(rats(vectorX(3))));
