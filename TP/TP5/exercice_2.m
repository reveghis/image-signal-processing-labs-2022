clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Paramètres :
N = 0;					% Nombre de disques d'une configuration
R = 10;					% Rayon des disques
beta = 1;
gamma = 7.5;
T = 0.2;
S = 140;
lambda = 250;
alpha = 0.99;
U_i = [];
U = 0;
list_U_c = [];
liste_q = [];
nb_points_affichage_disque = 30;
increment_angulaire = 2*pi/nb_points_affichage_disque;
theta = 0:increment_angulaire:2*pi;
rose = [253 108 158]/255;
q_max = 300;
nb_affichages = 1000;
pas_entre_affichages = floor(q_max/nb_affichages);
temps_pause = 0.0005;

% Lecture et affichage de l'image :
I = imread('colonie.png');
I = rgb2gray(I);
I = double(I);
I = I(1:400,100:450);
[nb_lignes,nb_colonnes] = size(I);
figure('Name',['Detection de ' num2str(N) ' flamants roses'],'Position',[0.25*L,0,0.75*L,0.5*H]);

U_i = [];
c = [];
c_ancien = [];

% Recherche de la configuration optimale :
for q = 1:q_max

    %1 Processus de naissances
    N_nv = poissrnd(lambda);
    N = N + N_nv;
    
    for i = 1:N_nv
        c_i = [nb_colonnes*rand nb_lignes*rand];
	    c = [c;c_i];
        I_moyen_ci = calcul_I_moyen(I,c_i,R);
        U_ci = 1 - 2 / (1 + exp(-gamma * (I_moyen_ci / S - 1) ) );
        U_i = [U_i, U_ci];
    end

    %2 Tri des disque
    [U_i,indicetri] = sort(U_i, "descend");
    c = c(indicetri,:);


    %3 Processus de mort
    i = 1;
    while i < size(c,1)
        somme = 0;
        sommeSansCi=0;
        for k = 1:size(c,1)
            for l = k:size(c,1)
                if k ~=l 
                     dist = sqrt((c(k,1)-c(l,1))^2 + (c(k,2)-c(l,2))^2);
                    if dist <= sqrt(2)*R
                       somme = somme + 1;
                       if k ~= i && l~=i
                            sommeSansCi = sommeSansCi +1;
                       end
                    end
                end
            end
        end

        U = sum(U_i) + beta*somme;
        

        U_sansci = sum(U_i) - U_i(i) + beta*sommeSansCi;
        p = lambda / (lambda + exp( (U_sansci - U) / T));
        if rand < p
            c(i,:) = []; 
            U_i(i) = []; 
            N = N - 1;
            i = i - 1;

        end
        i = i + 1;
        
    end


   %4 Test de convergence
   if size(c_ancien) == size(c) 
       if c_ancien == c
            break;
       end
   else
       T = alpha*T;
       lambda = alpha*lambda;
       c_ancien = c;
   end
   


		hold off;
		subplot(1,2,1);
		imagesc(I);
		axis image;
		axis off;
		colormap gray;
		hold on;
		for j = 1:N
			x_affich = c(j,1)+R*cos(theta);
			y_affich = c(j,2)+R*sin(theta);
			indices = find(x_affich>0 & x_affich<nb_colonnes & y_affich>0 & y_affich<nb_lignes);
			plot(x_affich(indices),y_affich(indices),'Color',rose,'LineWidth',3);
		end
		pause(temps_pause);
	

	% Courbe d'évolution du niveau d'energie :

        U = sum(U_i) + beta*regularisation_bis(R,c)
        N
		list_U_c = [list_U_c U];
		
		liste_q = [liste_q q];
		subplot(1,2,2);
		plot(liste_q,list_U_c,'.-','Color',rose,'LineWidth',3);
		axis([0 q_max -400 0]);
		set(gca,'FontSize',20);
		xlabel('Nombre d''iterations','FontSize',30);
		ylabel('L energie U(c)','FontSize',30);
	
end
