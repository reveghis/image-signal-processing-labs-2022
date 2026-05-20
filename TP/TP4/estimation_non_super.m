function [moyennes,variances,poids] = estimation_non_super(I,N)
    
    mini = min(reshape(I,[100*100,1])) - 0.00001;
    maxi = max(reshape(I,[100*100,1])) + 0.00001;
    [histo,x] = ksdensity(reshape(I,[100*100,1]), 'Support',[mini maxi], 'NumPoints', 256);

    H = size(x,2);

    err = 0.00005;
    mc=1;
    while err<mc
        moyennes = ceil(rand(1,N)*maxi);
        variances = ceil(rand(1,N)*15) + 10;
        X = x.'*ones(1,N);
        moy = ones(H,1)*moyennes;
        var = ones(H,1)*variances;
        A = exp(-(X - moy).^2 ./ (2*var.^2)) ./ (var*2*sqrt(2*pi));
        P = A\histo.';
        mc = abs(sum(histo.' - A*P));
    end
    
    poids = P;
    mc

