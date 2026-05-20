function AD = attache_donnees(I,moyennes,variances)

[n,m]= size(I);
N = length(moyennes);
AD = zeros(n,m,N);

%Exo 1
for i=1:n
    for j=1:m
       AD(i,j,:) = (0.5)*log(variances) + (I(i,j)-moyennes).^2./(variances);
    end
end


