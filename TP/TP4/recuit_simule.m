function [U,k] = recuit_simule(U,k,AD,T,beta)

[n,m,N] = size(AD);

for i=1:n
    for j=1:m
        nouvelle_classe = k(i,j);
        while nouvelle_classe == k(i,j)
            nouvelle_classe = ceil(rand*N);
        end  
        U_prime = U(i,j) + beta * regularisation(i,j,k,nouvelle_classe);
        if U(i,j)>U_prime || rand(1) < exp( -(U_prime - U(i,j)) / T ) 
            k(i,j) = nouvelle_classe;
        end


    end
end
end

