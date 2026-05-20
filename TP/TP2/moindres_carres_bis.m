function X_estime = moindres_carres_bis(d,y,bords_gauche,beta_0,bords_droit,gamma_0)


F = [bords_gauche - beta_0*(1-y).^d; bords_droit - gamma_0*(1-y).^d];

A = [];
for i =1:d
    a = nchoosek(d,i) .* y.^i.*(1-y).^(d-i);
    A = [A a];
end

E = [ A(:,1:(d-1)) zeros(size(y,1), d-1) A(:,d) ; zeros(size(y,1), d-1) A(:, 1:d)];




X_estime = E\F;

end

