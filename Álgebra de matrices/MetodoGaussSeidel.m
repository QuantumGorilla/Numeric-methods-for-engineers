clc ;
clear all;
format short;
A = input("Digite el sistema de ecuaciones representado como matriz:  ");
b = input("Digite el vector solución: ");

tol = input("digite tolerancia");
x0=input("digite los valores iniciales para x");
y0=input("digite los valores iniciales para y");



[nRows,nColumns] = size(A);

syms x;
syms y;
syms z;
vec=[x;y;z];
disp("Sistema de ecuaciones: ");
for i=1:nRows
    mostrar(i,1)=A(i,:)*vec;
end
for i=1:nRows
   mostrar(i,2)=b(i); 
end
disp(mostrar);
D=zeros(size(A));
L=zeros(size(A));
U=zeros(size(A));
diag=diag(A);
for i=1:nRows
    D(i,i)=diag(i);
end

for i=1:nRows
    for j=1:nColumns
        if(i>j)
            L(i,j)=A(i,j)*-1;
        else
            if(i<j)
                U(i,j)=A(i,j)*-1;
            end
        end
    end
end

Dinv=inv(D);
LMasU=L+U;
Dinv_b=Dinv*b;
Dinv_LMasU=Dinv*LMasU;

syms x;
syms y;
syms z;

XiMas1=Dinv_LMasU*[x;y;z]+Dinv_b;

Di=100;
xi(1)=x0;
yi(1)=y0;
zi(1)=double(subs(XiMas1(3),[x,y],[xi(end),yi(end)]));

i=2;

double(subs(XiMas1(1),[y,z],[100,4]));
c=1;
fprintf('i - X - Y - Z - Eax - Eay - Eaz - Di\n');
while (Di>= tol)
   
   xi(i)=double(subs(XiMas1(1),[y,z],[yi(end),zi(end)]));
   yi(i)=double(subs(XiMas1(2),[x,z],[xi(end),zi(end)]));
   zi(i)=double(subs(XiMas1(3),[x,y],[xi(end),yi(end)]));
   
   Eax(i-1)=abs(xi(i)-xi(i-1));
   Eay(i-1)=abs(yi(i)-yi(i-1));
   Eaz(i-1)=abs(zi(i)-zi(i-1));
   Di=max([Eax(i-1) Eay(i-1) Eaz(i-1)]);
   m(c,1)=c;
   m(c,2)=xi(i);
   m(c,3)=yi(i);
   m(c,4)=zi(i);
   m(c,5)=Eax(i-1);
   m(c,6)=Eay(i-1);
   m(c,7)=Eaz(i-1);
   m(c,8)=Di;
   
   i=i+1; 
   c=c+1;
end
disp(m);
    
r=[xi(i-1),yi(i-1),zi(i-1)]';

for j=1:nRows
    sum=A(j,:)*r;
    fprintf("La ecuación da: %d\n",sum);
end

fprintf("Para un valor de x igual a: %d\n",xi(i-1));
fprintf("Para un valor de y igual a: %d\n",yi(i-1));
fprintf("Para un valor de z igual a: %d\n",zi(i-1));
fprintf("con  %i iteraciones.\n",c-1);
