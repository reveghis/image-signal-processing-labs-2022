function [d_estime,sigma_estime] = estimation_d_sigma(liste_d,liste_erreurs_generalisation)

[erreur, index] = min(liste_erreurs_generalisation);
sigma_estime = sqrt(erreur);
d_estime = liste_d(index);

end

