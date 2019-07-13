clear all;
clc;
format long;
syms x;
f = input('Digite la función: ');
limU = input('Digite el limite superior: ');
limD = input('Digite el limite inferior: ');
tol = input('Digite la tolerancia: ');

if(subs(f,limD)*subs(f,limU) < 0)
    xr = (limD+limU)./2;
    i = 0;
    while(abs(subs(f,xr)) >= tol)
        if(subs(f,limD)*subs(f,xr) < 0)
            limU = xr;
        else 
            limD = xr;
        end
        i = i + 1;
        xr = (limD+limU)./ 2;
    end
    fprintf('La raiz es: %d, con %i iteraciones. \n ', xr, i);
    ezplot(f);
    hold on;
    plot(xr,0,'*r');
    grid on;
else 
   disp('No existe una raíz en ese intervalo');
end