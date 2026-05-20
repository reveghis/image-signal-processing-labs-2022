clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture et affichage de l'image à segmenter :
I = imread('IRM.png');
[nb_lignes,nb_colonnes,nb_canaux] = size(I);
if nb_canaux==3
	I = rgb2gray(I);
end
I = double(I);
I = I/max(I(:));
figure('Name','Champ de force externe','Position',[0.1*L,0.1*H,0.9*L,0.7*H]);
subplot(1,2,1);
imagesc(I);
colormap gray;
axis image off;
axis xy;
title('Image a segmenter','FontSize',20);
	
% Champ de force externe :
gamma = 0.1;
mu = 0.5;

iter_max = 300;

[Ix,Iy] = gradient(I);
Eext0 = -(Ix.*Ix+Iy.*Iy);
[Fx,Fy] = gradient(Eext0);
Fx0 = Fx;
Fy0 = Fy;

for iter=1:iter_max
    Fx_kp1 = Fx - gamma * (norm(gradient(Eext0))^2*(Fx - Fx0) - mu * del2(Fx));
    Fy_kp1 = Fy - gamma * (norm(gradient(Eext0))^2*(Fy - Fy0) - mu * del2(Fy));
    
    Fx = Fx_kp1;
    Fy = Fy_kp1;
    
end


% Normalisation du champ de force externe pour l'affichage :
norme = sqrt(Fx.*Fx+Fy.*Fy);
Fx_normalise = Fx./(norme+eps);
Fy_normalise = Fy./(norme+eps);

% Affichage du champ de force externe :
subplot(1,2,2);
imagesc(I);
colormap gray;
axis image off;
axis xy;
hold on;
pas_fleches = 5;
taille_fleches = 1;
[x,y] = meshgrid(1:pas_fleches:nb_colonnes,1:pas_fleches:nb_lignes);
Fx_normalise_quiver = Fx_normalise(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
Fy_normalise_quiver = Fy_normalise(1:pas_fleches:nb_lignes,1:pas_fleches:nb_colonnes);
hq = quiver(x,y,Fx_normalise_quiver,Fy_normalise_quiver,taille_fleches);
set(hq,'LineWidth',1,'Color',[1,0,0]);
title('Champ de force externe elementaire','FontSize',20);

save force_externe;
