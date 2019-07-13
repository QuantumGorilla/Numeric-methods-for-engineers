function [L,U] = doolittleFactorization (A) 
 L = zeros(size(A));
 U = zeros(size(A));
 [nRows, nColumns] = size(A);

 for j=1:nColumns
    for i=1:nRows
     if i<=j
        U(i,j) = A(i,j);
        for k=1:i-1
        U(i,j) = U(i,j) - L(i,k)*U(k,j);
        end
      end    
     if j<=i
       L(i,j) = A(i,j);
       for k=1:j-1
         L(i,j) = L(i,j) - L(i,k)*U(k,j);
       end
       L(i,j) = L(i,j)/U(j,j);
     end
    end
 end