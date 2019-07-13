clear all;
clc;
format short;
syms x;
f = input('Digite la función (Con la x ya despejada): ');
x0 = input('Digite un valor para x: ');
tol = input('Digite la tolerancia: ');
error = 100;
i = 1;
fprintf('       i        x0        xm         Ea\n');
while error > tol
    xm = subs(f,x0);
    m(i,1) = i;
    m(i,2) = x0;
    m(i,3) = xm;
    if(i > 1)
        m(i,4) = abs(xm - x0);
    else
        m(i,4) = 0;
    end
    error = abs(xm - x0);
    x0 = xm;
    if(error 
        > tol)
    i = i + 1;
    end
end
disp(m);
fprintf('La raiz es %f, con %i iteraciones y un error de %f', xm, i, error);
fplot(f);
hold on;
plot(xm, 0, '*r');
grid on;