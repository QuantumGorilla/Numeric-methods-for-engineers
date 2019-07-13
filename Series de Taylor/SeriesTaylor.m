clear all;
clc;
syms x;
f = input('Escriba la función: ');
a = input('Digite el valor de a: ');
n = input('Digite el valor n: ');

fprintf('El valor de a es: %d \n',a);
fprintf('El valor de n es: %d \n',n);

grafica = ezplot(f);
set(grafica, 'Color', 'r')

sumatoria = 0;
hold on;

v = ['b','g','c','m','y', 'k'];
k = 1;

for i=0:n
    sumatoria = sumatoria + (subs(diff(f,i),a)*(x-a).^i)/factorial(i); 
    grafica = ezplot(sumatoria);
    set(grafica, 'Color', v(k))
    if(k == 6)
        k = 1;
    else
        k = k + 1;
    end
end
disp('El modelo matemático generado es: ');
disp(sumatoria);

valor = input('Digite el valor de x: ');
valorAproximado = subs(sumatoria, valor);
disp('El valor aproximado es: ');
disp(valorAproximado)

valorReal = subs(f, valor);
disp('El valor real es: ');
disp(valorReal);

errorAbsoluto = abs(valorReal - valorAproximado);
errorRelativo = abs((valorReal - valorAproximado)/valorReal).*100;

disp('El error absoluto es: ');
disp(errorAbsoluto);

disp('El error relativo es: ');
disp(errorRelativo);