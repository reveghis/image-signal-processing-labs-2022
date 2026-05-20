function probas = probabilites(D_app,parametres_estim,sigma)
    napp = size(D_app,2);
    probas = zeros(2,napp);
    probas(1,:) = 0.5/(sigma*sqrt(2*pi)) * exp(- calcul_r(D_app,parametres_estim(1,:)).^2 /(2*sigma^2));
    probas(2,:) = 0.5/(sigma*sqrt(2*pi)) * exp(- calcul_r(D_app,parametres_estim(2,:)).^2 /(2*sigma^2));
end

