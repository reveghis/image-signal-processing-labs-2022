function f = retroprojection(sinogramme,theta,nb_rayons,nb_lignes,nb_colonnes)

f = zeros(nb_lignes, nb_colonnes);
n_theta = length(theta);

for i=1:nb_lignes
    for j=1:nb_colonnes
        x = j - nb_colonnes/2;
        y = nb_lignes/2 - i;
        for k=1:n_theta
            t_xy = (x*cos(theta(k)) + y*sin(theta(k))); convertir en radian
            f(i,j) = f(i,j) + sinogramme(round(t_xy) + (nb_rayons-1)/2, k);
        end
        f(i,j) = f(i,j)/n_theta;
    end
end

end