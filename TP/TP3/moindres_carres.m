function X = moindres_carres(D_app)

x = transpose(D_app(1,:));
y = transpose(D_app(2,:));
napp = length(y);
A = [x.^2 x.*y y.^2 x y ones(napp,1); 1 1 0 0 0 0];



O = [zeros(napp, 1); 1];

X = transpose(A\O) ;

end

