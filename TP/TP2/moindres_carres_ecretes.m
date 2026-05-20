function beta_estime = moindres_carres_ecretes(D_app,beta_0,beta_d,d,lambda)

X = transpose(D_app(1,:));
napp = size(X);
B = transpose(D_app(2,:)) - beta_0*nchoosek(d, 0).*(1-X).^d - beta_d*nchoosek(d, d).*X.^d;
A = zeros(napp(1),(d-1));
alpha = [1:d-1]/d;
beta_aligne = beta_0+(beta_d-beta_0)*alpha;

for i = 1:d-1
     A(:,i) = nchoosek(d,i).*(X.^i).*((1-X).^(d-i));
end

C = B - A*transpose(beta_aligne);

delta_estime =  (transpose(A)*A + lambda*eye(d-1))^(-1) * transpose(A) * C ;

beta_estime = transpose(delta_estime) + beta_aligne;
end

