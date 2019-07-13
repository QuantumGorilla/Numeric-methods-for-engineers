clear all;
clc;
syms x;
f = input('Digite la función: ');
a = input('Digite el limite inferior: ');
b = input('Digite el limite superior: ');
tol = input('Digite la tolerancia: ');

[aproximacion, errorAbs] = metodoSimpsonCompuesto(f,a,b,tol);

fprintf('Integral definida = %f, Error absoluto = %f',aproximacion, errorAbs);