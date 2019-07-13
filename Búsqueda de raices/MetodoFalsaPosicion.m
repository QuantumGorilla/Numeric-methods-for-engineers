clear all;
clc;
format short;
syms x;
f = input('Digite la función: ');
a = input('Digite el limite inferior: ');
b = input('Digite el limite superior: ');
tol = input('Digite la tolerancia: ');
error = 100;
i = 1;
fprintf('       i        xa        xb      f(xa)     f(xb)      xm       f(xm)   f(xb)*f(xm)   Ea\n');
%0 = Positivo. 1 = Negativo
while error > tol
    xm = b - (b - a)*subs(f,b)/(subs(f,b) - subs(f,a));
    m(i,1) = i;
    m(i,2) = a;
    m(i,3) = b;
    m(i,4) = subs(f,a);
    m(i,5) = subs(f,b);
    m(i,6) = xm;
    m(i,7) = subs(f,xm);
    if(subs(f,b)*subs(f,xm))
        m(i,8) = 0;
    else
        m(i,8) = 1;
    end
    m(i,9) = abs(subs(f,xm));
    if(subs(f,b)*subs(f,xm) > 0)
        b = xm;
    else
        a = xm;
    end
    error = abs(subs(f, xm));
    if(error > tol)
    i = i + 1;
    end
end
disp(m);
fprintf('La raiz es %f, con %i iteraciones y un error de %f', xm,i,error);
ezplot(f);
hold on;
plot(xm, 0, '*r');
grid on;