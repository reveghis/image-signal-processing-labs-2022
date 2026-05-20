donnees_apprentissage;

% DegrŽ de la courbe de BŽzier utilisŽe comme modle (testez plusieurs valeurs de d entre 2 et 20) :
d = 20;

% Estimation des paramtres de la courbe de BŽzier (sauf beta_0 et beta_d) :
beta_estime = moindres_carres(D_app,beta_0,beta_d,d);

% TracŽ de la courbe de BŽzier estimŽe, de degrŽ d (trait rouge) :
y_estime = bezier(beta_0,beta_estime,beta_d,x);
plot(x,y_estime,'-r','MarkerSize',10,'LineWidth',3);
lg = legend(' Modele exact',' Donnees d''apprentissage',[' Modele estime ($d=' num2str(d) '$)'],'Location','Best');
set(lg,'Interpreter','Latex');
