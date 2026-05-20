function [lambda_optimal,sigma_estime] = estimation_lambda_sigma(liste_lambda,liste_VC)

[erreur, index] = min(liste_VC);
sigma_estime = sqrt(erreur);
lambda_optimal = liste_lambda(index);

end


