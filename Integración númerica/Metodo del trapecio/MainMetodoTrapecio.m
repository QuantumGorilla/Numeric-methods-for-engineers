clear all;
clc;
format long;
syms x;
f = input('Escribe la función: ');
a = input('Digite el limite inferior: ');
b = input('Digite el limite superior: ');
tol = input('Digite la tolerancia: ');

[aproximacion, errorAbs] = metodoTrapecio(f,a,b,tol);

fprintf('Integral definida = %f, Error absoluto = %f',aproximacion, errorAbs);