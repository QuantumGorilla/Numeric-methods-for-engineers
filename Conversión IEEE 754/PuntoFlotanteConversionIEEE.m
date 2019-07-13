clear all;
clc;
format long;
flotante = input('Digite un número punto flotante: ');
if (flotante < 0)
    signo = 1;
else
    signo = 0;
end
no = floor(abs(flotante));
a = dec2bin(no);
sub = extractAfter(a, 1);
be = dec2bin(127 + (strlength(a) - 1));
loop = 23 - (strlength(a) - 1);
parteFlotante = abs(flotante) - no;
q = zeros(1,23);
for j = 1:loop
    q(j) = floor(parteFlotante.*2);
    parteFlotante = parteFlotante.*2;
    if (q(j) == 1)
        parteFlotante = parteFlotante - 1;
    end
end
mantisa =sprintf('%d ', q);
disp('El número en formato IEEE 754 es: ');
disp('Signo: ');
disp(signo);
disp('Exponente: ');
disp(be);
disp('Mantisa: ');
disp(sub);
fprintf(mantisa);