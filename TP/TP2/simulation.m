function [x_gauche,x_droite] = simulation(y,beta_0,gamma_0,moyennes,ecarts_types,d)

aleatoire = randn(2*d-1,1);
b_generer = ecarts_types.*aleatoire.' + moyennes;
beta_d = b_generer(2*d-1);
gamma_d = beta_d;
beta = b_generer(1:d-1);
gamma = b_generer(d:2*d-2);
x_gauche = bezier(beta_0,beta,beta_d,y);
x_droite = bezier(gamma_0,gamma,gamma_d,y);
end

