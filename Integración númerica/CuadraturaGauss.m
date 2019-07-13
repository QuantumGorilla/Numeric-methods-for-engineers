clear all;
clc;
syms x;
format long;
f = input('Digite la función: ');
a = input('Digite el limite inferior: ');
b = input('Digite el limite superior: ');

n = input('Digite la cantidad de puntos: ');
w = input('Digite los pesos: ');
x = input('Digite los xi: ');
suma = 0;
for i=1:n
    suma = suma + w(i)*subs(f,(((b-a)/2)*x(i))+((a+b)/2));
end

fprintf('Integral definida = %f', suma*((b-a)/2));
