function X = moindres_carres_ponderes(D_app,probas)

x = transpose(D_app(1,:));
y = transpose(D_app(2,:));
napp = length(y);
p = probas.';
A = [[x.^2.*p x.*y.*p y.^2.*p x.*p y.*p ones(napp,1).*p]; [1 1 0 0 0 0]];



O = [zeros(napp, 1); 1];

X = transpose(A\O) ;

end

