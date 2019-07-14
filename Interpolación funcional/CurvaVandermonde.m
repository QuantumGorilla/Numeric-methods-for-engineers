clear all;
clc;
format short;
syms x;
y = input('Digite los valores correspondientes de y: ');
n = input('Digite los valores correspondientes de x: ');
A = vander(n);
respuesta = inv(A) * y';
l = length(respuesta);
f = 0;
for i=1:l
    f = f + respuesta(i) * x^(l-i);
end
disp('El modelo matemático generado es: ');
disp(f);