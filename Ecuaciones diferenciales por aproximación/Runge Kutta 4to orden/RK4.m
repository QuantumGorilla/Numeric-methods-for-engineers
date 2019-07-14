function [yn] = RK4(f, a, b, y1, h)
format long;
syms x y;
m = a:h:b;
n = length(m);
for i=1:n-1
    k1 = subs(f,{x,y},{m(i), y1});
    k2 = subs(f,{x,y},{m(i)+h/2, y1+ k1*h/2});
    k3 = subs(f,{x,y},{m(i)+h/2, y1+ k2*h/2});
    k4 = subs(f,{x,y},{m(i)+h, y1+k3*h});
end
yn = y1 + (h/6)*(k1+2*k2+2*k3+k4);
end

