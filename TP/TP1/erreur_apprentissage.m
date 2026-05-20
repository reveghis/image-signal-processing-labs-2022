function erreur = erreur_apprentissage(D_app,beta_0,beta_d,d)


    beta_estime = moindres_carres(D_app,beta_0,beta_d,d);
    yestime = bezier(beta_0,beta_estime,beta_d,transpose(D_app(1,:)));
    yreel = transpose(D_app(2,:));

    erreur = sum((yreel - yestime).^2)/length(yestime);

end