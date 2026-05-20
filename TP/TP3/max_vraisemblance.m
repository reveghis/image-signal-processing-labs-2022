function parametres_MV = max_vraisemblance(D_app,parametres_test)

nb_tirages = size(parametres_test,1)
R = zeros(nb_tirages,1);
for i=1:nb_tirages
    R(i) = sum(calcul_r(D_app,parametres_test(i,:)).^2);
end


[~, index] = min(R);
parametres_MV = parametres_test(index,:);




end

