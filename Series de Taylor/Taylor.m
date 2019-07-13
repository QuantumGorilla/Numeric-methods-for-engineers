clear all;
clc;
format long;
syms x;
n = input('Digite el valor de n: ');
equisde = input('Digite el valor de x: ');
f = input('Digite la función: ');
real = subs(f,equisde);
fig = ezplot(f);
set(fig,'Color','r');
vectorColores = ['r','g','c','m','y','k'];
j = 1;
for i=1:15
    disp('El modelo matemático es: ');
    t = taylor(f,x,0,'Order',i)
    errorAbsoluto = abs(real - subs(t,equisde));
    errorRelativo = abs(errorAbsoluto/real) * 100;
    fprintf('El error relativo de la iteración %i, es: %d',i , errorRelativo);
    fprintf('El error absoluto de la iteración %i, es: %d',i , errorAbsoluto);
    pause(1);
    hold on;
    f2 = ezplot(t);
    if(j == 6)
        j = 1;
    end
    set(f2,'Color',vectorColores(j));
    j = j + 1;
end