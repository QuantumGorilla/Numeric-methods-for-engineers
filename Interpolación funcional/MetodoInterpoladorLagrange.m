clear all;
clc;
clear;
format short;
syms x;
n=input('Digite la cantidad de puntos que tiene: ');
i=1;
while(i<=n)
    vx(i:n)= input('Digite el punto x: ');
    vfx(i:n)= input('Digite el respectivo fx: ');
    i=i+1;
end
f1=0;
for j=1:n
    f2=1;
    for k=1:n
        if(j~=k)
            f2=f2*((x-vx(k))/(vx(j)-vx(k)));
        end
    end
    f1 = f1+vfx(j)*f2;
end
fprintf('El modelo matemático es: ');
disp(f1);
val = input('Digite un valor para evaluar la función: ');
val2 = input('Digite otro valor para evaluar la función: ');
f1=subs(f1,val);
f2=subs(f1,val2);
fprintf('El modelo matemático anterior evaluado en %d es %f y evaluado en %d es %f. \n', val, f1, val2, f2);
