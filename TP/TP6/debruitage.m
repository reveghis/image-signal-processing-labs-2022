function u_k = debruitage(b,u_k,lambda,Dx,Dy,epsilon)

[nb_pixel, ~] = size(b);
matrice_diag = 1./sqrt((Dx*u_k).^2+(Dy*u_k).^2+epsilon);
W = spdiags(matrice_diag,0,nb_pixel,nb_pixel);
Lap = -Dx'*W*Dx -Dy'*W*Dy;
A = speye(nb_pixel) -lambda*Lap;
u_k = A\b;
end