function [ IEEE ] = DecAIEEE754(n)
IEEE = zeros(1,32);
if n<0
    IEEE(1) = 1;
    n = n*-1;
end
ParteEntera = floor(n);
ParteFraccionaria = n-ParteEntera;
BEnt = decToBin(ParteEntera);
p=1;

while BEnt>0
    res = mod(BEnt,10);
    BEnt = (BEnt-res)/10;
    VBEnt(p) =res;
    p=p+1;
end
m=10;
exp=127;
if ParteEntera > 0
    for i=p-2:-1:1
        IEEE(m) =VBEnt(i);
        m=m+1;
        exp =exp+1;
    end
end
if ParteEntera == 0
    while ParteFraccionaria <1
        ParteFraccionaria = ParteFraccionaria*2;
        exp = exp-1;
    end
end
%mantisa parte fraccionaria
for h=m:1:32
    ParteFraccionaria = ParteFraccionaria*2;
    if ParteFraccionaria >=1 
        ParteFraccionaria = ParteFraccionaria-1;
        IEEE(h) =1;
    end
end

ExpBin = decToBin(exp);
p=9;

while ExpBin>0
    res = mod(ExpBin,10);
    ExpBin = (ExpBin-res)/10;
    IEEE(p) =res;
    p=p-1;
end

ParteFraccionaria = ParteFraccionaria*2;
if ParteFraccionaria >=1 
    for i = 32:-1:10
        if IEEE(i)==0
            IEEE(i) =1;
            break;
        else
            IEEE(i) =0;
        end
    end
end
end
function [ b ] = decToBin( n )
d10=1;
b=0;
while n>0
    res = mod(n,2);
    b = res *d10 +b;
    n=(n-res)/2;
    d10 =d10*10;
end

end