function erreur = erreur_generalisation(D_test,D_app,beta_0,beta_d,d)
    
    beta_estime = moindres_carres(D_app,beta_0,beta_d,d);
    yestime = bezier(beta_0,beta_estime,beta_d,transpose(D_test(1,:)));



    ytest = transpose(D_test(2,:));


    erreur = sum((ytest - yestime).^2)/length(yestime);
end