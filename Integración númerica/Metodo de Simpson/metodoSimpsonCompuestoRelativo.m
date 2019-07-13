function [aprox, error] = metodoSimpsonCompuestoRelativo(f, a, b, tol)
syms x;

n= ceil((abs(((b-a)^5)*max([subs(diff(f,4),a),subs(diff(f,4),b)]))/(80*tol))^(1/4));
h = (b-a)/n;

suma = subs(f,a);

suma1 = 0;
for i=1:3:n-2
    suma1 = suma1 + (subs(f,h*i+a));
end
suma2 = 0;
for i=2:3:n-1
    suma2 = suma2 + subs(f,h*i+a);
end
suma3 = 0;
for i=3:3:n-3
    suma3 = suma3 + subs(f,h*i+a);
end

aprox = (suma + (suma1*3) + (suma2*3) + (suma3*2) + subs(f,b))*((3*h)/8);

valorReal = double(int(f,a,b));
error = abs(valorReal-aprox);
end

