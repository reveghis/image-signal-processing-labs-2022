function u_barre_kp1 = calcul_structure_3(u_barre_k,u,Dx,Dy,Phi,epsilon,mu_prime,gamma)

    [nbl, nbc] = size(u);
    
    TF_u = real(fftshift(fft2(u)));
    TF_u_barre = real(fftshift(fft2(u_barre_k)));
    diff = Phi*(TF_u_barre - TF_u);
    TF_inv = real(ifft2(ifftshift(diff)));
    
    TF_inv = TF_inv(:);
    u_barre_k = u_barre_k(:);
    
    u_x = Dx*u_barre_k;
    u_y = Dy*u_barre_k;
    u_xx = -Dx'*Dx*u_barre_k;
    u_xy = -Dx'*Dy*u_barre_k;
    u_yy = -Dy'*Dy*u_barre_k;
    
    grad = (u_xx.*(u_y.^2+epsilon) + u_yy .* (u_x.^2 + epsilon) - 2 * u_x .* u_y .* u_xy) ./ ((u_x.^2 + u_y.^2 + epsilon).^(3/2));
    
    u_barre_kp1 = u_barre_k - gamma * (TF_inv - mu_prime * grad);
    u_barre_kp1 = reshape(u_barre_kp1,nbl,nbc);
end