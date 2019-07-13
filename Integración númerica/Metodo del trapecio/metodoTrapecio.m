function [aprox, errorAbsoluto ] = metodoTrapecio(f, a, b, tol)
format long;
syms x;

n = ceil(sqrt((abs(-(b-a)^3*max(subs(diff(f,2),a),subs(diff(f,2),b))))/(12*tol)));
h = (b-a)/n;
suma = (subs(f,a)+ subs(f,b))/2;

for i=1:n-1
    suma = suma + subs(f,a+i*(b-a)/n);
end

aprox = suma * h;

valorReal = double(int(f,a,b));
errorAbsoluto = abs(valorReal-aprox);

end

