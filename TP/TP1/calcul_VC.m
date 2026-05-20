function VC = calcul_VC(D_app,beta_0,beta_d,d)

n_app = length(D_app(2,:));
X = transpose(D_app(1,:));
Y = transpose(D_app(2,:));

VC = 0;
for j=1:n_app
    D_app_j = [D_app(:, 1:j-1) D_app(:,j+1:n_app)];
    betaestime = moindres_carres(D_app_j, beta_0, beta_d, d);
    VC = VC + (Y(j) - bezier(beta_0, betaestime, beta_d, X(j)))^2;
end

VC = VC/n_app;

