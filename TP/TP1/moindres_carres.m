function beta_estime = moindres_carres(D_app,beta_0,beta_d,d)
X = transpose(D_app(1,:));
napp = size(X);
B = transpose(D_app(2,:)) - beta_0*nchoosek(d, 0).*(1-X).^d - beta_d*nchoosek(d, d).*X.^d;
A = zeros(napp(1),d-1);

for i = 1:d-1
     A(:,i) = nchoosek(d,i).*(X.^i).*((1-X).^(d-i));
end

beta_estime = A\B;
