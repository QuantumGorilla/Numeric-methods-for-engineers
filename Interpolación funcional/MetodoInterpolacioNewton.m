clear all;
clc;
clear;
format short;
syms x;
x0 = input('Digite x0: ');
fx0 = input('Digite fx0: ');
x1 = input('Digite x1: ');
fx1 = input('Digite fx1: ');
val = input('Digite un valor para evaluar f(x): ');
val2 = input('Digite otro valor para evaluar f(x): ');
f = fx0+(((x-x0)*(fx1-fx0))/(x1-x0));
fprintf('El modelo matemático es: ');
disp(f);
f1 = subs(f,val);
f2 = subs(f,val2);
fprintf('El modelo matemático anterior evaluado en %d es %f y evaluado en %d es %f. \n', val, f1, val2, f2);

