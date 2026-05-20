function [d_estime, sigma_estime] = estimation_d_sigma_bis(liste_d, liste_VC)
[erreur, index] = min(liste_VC);
sigma_estime = sqrt(erreur);
d_estime = liste_d(index);
end