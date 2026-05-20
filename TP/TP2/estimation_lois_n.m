function [moyennes,ecarts_types] = estimation_lois_n(X)
moyennes = mean(X);

ecarts_types = std(X,1);

end