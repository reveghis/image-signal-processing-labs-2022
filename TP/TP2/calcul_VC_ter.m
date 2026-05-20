function VC = calcul_VC_ter(D_app,beta_0,beta_d,d,lambda,A)

n_app = length(D_app(2,:));
X = transpose(D_app(1,:));
Y = transpose(D_app(2,:));

betaestime = moindres_carres_ecretes(D_app, beta_0, beta_d, d, lambda);
yestime = bezier(beta_0, betaestime, beta_d, X);

S = A * (A.' * A + lambda * eye(d-1))^(-1) * A.';

VC = 0;
for j=1:n_app
    VC = VC + ((Y(j) - yestime(j)) / (1 - S(j,j)))^2;
end

VC = VC/n_app;

