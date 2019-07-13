function [L,U] = croultFactorization (A) 
 L = zeros(size(A));
 U = zeros(size(A));
 [nRows, nColumns] = size(A);
 n = nRows;

 for k=1:n
        U(k,k)=1;
        suma=0;
        for p=1:k-1
            suma=suma+L(k,p)*U(p,k);
        end
        L(k,k)=(A(k,k)-suma); 
        for i=k+1:n
            suma=0;
            for r=1:k-1
                suma=suma+L(i,r)*U(r,k);
            end
            L(i,k)=(A(i,k)-suma); 
        end
        for j=k+1:n
            suma=0;
            for s=1:k-1
                suma=suma+L(k,s)*U(s,j);
            end
            U(k,j)=(A(k,j)-suma)/L(k,k); 
        end
 end