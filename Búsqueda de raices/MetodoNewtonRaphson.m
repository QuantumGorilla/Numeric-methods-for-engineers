clear all;
clc;
format short;
syms x;
f = input('Digite la función: ');
a = input('Digite un valor para x: ');
tol = input('Digite la tolerancia: ');
error = 100.0;
i = 1;
fprintf('       i        xi        f(xi)      f"(xi)     xr       Ea\n');
while error > tol
    xm = a - (subs(f,a)/subs(diff(f),a));
    m(i,1) = i;
    m(i,2) = a;
    m(i,3) = subs(f,a);
    m(i,4) = subs(diff(f),a);
    m(i,5) = a - (subs(f,a)/subs(diff(f),a));
    m(i,6) = abs(subs(f,a));
    error = abs(subs(f,a));
    a = xm;
    if(error > tol)
    i = i + 1;
    end
end
disp(m);
fprintf('La raiz es: %f, con %i iteraciones y un error de %f', a, i, error);
grafDiff = ezplot(diff(f));
set(grafDiff, 'Color', 'b');
hold on;
ezplot(f);
hold on;
plot(a,0,'*r');
grid on;