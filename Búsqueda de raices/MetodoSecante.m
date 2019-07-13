clear all;
clc;
format short;
syms x;
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
disp(m);
fprintf('La raiz es %f, con %i iteraciones y un error absoluto de %f',b,i, error);
ezplot(f);
hold on;
plot(b, 0, '*r');
grid on;