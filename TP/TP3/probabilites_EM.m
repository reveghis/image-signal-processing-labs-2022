function probas = probabilites_EM(D_app,parametres_estim,proportion_1,proportion_2,sigma)
    napp = size(D_app,2);
    probas = zeros(2,napp);
    p1 = proportion_1/sigma * exp(- calcul_r(D_app,parametres_estim(1,:)).^2 /(2*sigma^2));
    p2 = proportion_2/sigma * exp(- calcul_r(D_app,parametres_estim(2,:)).^2 /(2*sigma^2));
    probas(1,:) = p1/(p1 + p2);
    probas(2,:) = p2/(p1 + p1);
end

