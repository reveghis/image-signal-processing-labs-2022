function u_k = inpainting(b,u_k,lambda,Dx,Dy,epsilon,W_d)

u0 = W_d*b;
[nb_pixel, ~] = size(b);
matrice_diag = 1./sqrt((Dx*u_k).^2+(Dy*u_k).^2+epsilon);
W = spdiags(matrice_diag,0,nb_pixel,nb_pixel);
Lap = -Dx'*W*Dx -Dy'*W*Dy;
A = W_d - lambda*Lap;
u_k = A\u0;
end