clear all;
clc;
format short;
syms x;

%Ejercicio 1
g = input('Digite la función: ');
xi = input('Digite el valor inicial de x: ');
h = input('Digite el paso: ');
primerAprox = (-subs(g, xi+2*h) + 8*subs(g, xi+h) - 8*subs(g, xi-h) + subs(g, xi-2*h))/(12*h);
segunAprox = (-subs(g, xi+2*h)+16*subs(g,xi+h)-30*subs(g,xi)+16*subs(g,xi-h)-subs(g,xi-2*h))/(12*h^2);
terceAprox = (-subs(g,xi+3*h)+8*subs(g,xi+2*h)-13*subs(g,xi+h)+13*subs(g,xi-h)-8*subs(g,xi-2*h)+subs(g,xi-3*h))/(8*h^3);
primeraAnalit = subs(diff(g), xi);
segundaAnalit = subs(diff(diff(g)), xi);
terceraAnalit = subs(diff(diff(diff(g))), xi);
errorA = abs(primeraAnalit - primerAprox);
errorR = abs(errorA/primeraAnalit) * 100;

fprintf('Valor de la primera derivada analitica: %d vs Aproximada: %d\n',primeraAnalit,primerAprox);
fprintf('Error absoluto (Primera): %d \n Error Relativo(Primera): %d\n', errorA, errorR);

errorA = abs(segundaAnalit - segunAprox);
errorR = abs(errorA/segundaAnalit) * 100;
fprintf('Valor de la segunda derivada analitica: %d vs Aproximada: %d\n',segundaAnalit,segunAprox);
fprintf('Error absoluto (Segunda): %d \n Error Relativo(Segunda): %d\n', errorA, errorR);

errorA = abs(terceraAnalit - terceAprox);
errorR = abs(errorA/terceraAnalit) * 100;
fprintf('Valor de la tercera derivada analitica: %d vs Aproximada: %d\n',terceraAnalit,terceAprox);
fprintf('Error absoluto (Tercera): %d \n Error Relativo(Tercera): %d\n', errorA, errorR);

%Ejercicio 2
f = input('Digite la función: ');
a = input('Digite el limite inferior: ');
b = input('Digite el limite superior: ');
tol = input('Digite la tolerancia: ');
error = abs(subs(f,b));
i = 1;
fprintf('       i        xa        xb      f(xa)     f(xb)      xm       Ea\n');
while error > tol
    xm = b - ((b - a)*subs(f,b))/(subs(f,b) - subs(f,a));
    m(i,1) = i;
    m(i,2) = a;
    m(i,3) = b;
    m(i,4) = subs(f, a);
    m(i,5) = subs(f, b);
    m(i,6) =  xm;
    m(i,7) = abs(subs(f,b));
    error = abs(subs(f, b));
    a = b;
    b = xm;
    if(error > tol)
    i = i + 1;
    end
end
%A partir de cierto punto varias decimales que no muestra el format short
disp(m);
fprintf('La raiz es %f, con %i iteraciones y un error absoluto de %f',b,i, error);
ezplot(f);
hold on;
plot(b, 0, '*r');
grid on;