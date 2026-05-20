function parametres_estim = max_vraisemblance_2(D_app,parametres_test,sigma)

nb_tirages = size(parametres_test,1);

V = zeros(nb_tirages,1);


for i = 1:nb_tirages
    r1 = calcul_r(D_app,parametres_test(i,1,:)).^2;
    r2 = calcul_r(D_app,parametres_test(i,2,:)).^2;
    V(i) = sum(log(0.5/sigma * (exp(-r1/(2*sigma^2)) + exp(-r2/(2*sigma^2)) )));
    
end


[~, index] = max(V);
parametres_estim = parametres_test(index,:);




end

