clear all;
clc;
syms x;
equis = input('Digite los valores x: ');
fequis = input('Digite los valores de f(x): ');
if(length(equis) == length(fequis))
    n = length(equis);
    suma = 0;
    for i=1:n
        productoria = 1;
        for j=1:n
            if(i~=j)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 productoria = productoria*(x-equis(j)/(equis(i)-equis(j)));
            end
        end
        suma = suma + fequis(i)*productoria;
    end
    modelo = simplify(suma);
    ezplot(modelo);
    hold on;
    plot(equis,fequis,'*r');
    xlabel('x');
    ylabel('f(x)');
    title('Figura 1. Polinomio de interpolación de Lagrange');
else
    disp('Error en los tamaños de los vectores.')
end