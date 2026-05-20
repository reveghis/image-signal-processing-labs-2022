function A = matrice_A(N,alpha,beta,gamma)

e = ones(N,1);
D2 = spdiags([e -2*e e],-1:1,N,N);
D2(1,N) = 1;
D2(N,1) = 1;

I = speye(N,N);

A = I + gamma * (alpha*D2 - beta*transpose(D2)*D2);
end