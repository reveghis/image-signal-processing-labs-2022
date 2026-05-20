function u_barre_kp1 = calcul_structure_2(u_barre_k,b,Dx,Dy,lambda,epsilon)

[nb_lignes, nb_colonnes] = size(u_barre_k);
nb_pixels = nb_lignes*nb_colonnes;

u = b(:);
u_barre_k = u_barre_k(:);

mat_diag = 1./sqrt((Dx*u_barre_k).^2+(Dy*u_barre_k).^2+epsilon);
W = spdiags(mat_diag,0,nb_pixels,nb_pixels);

Lap = -Dx'*W*Dx -Dy'*W*Dy;
A_k = speye(nb_pixels) - lambda*Lap;

u_barre_kp1 = A_k\u;

u_barre_kp1 = reshape(u_barre_kp1, nb_lignes, nb_colonnes);
end