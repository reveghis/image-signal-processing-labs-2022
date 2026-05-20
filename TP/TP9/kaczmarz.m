function f = kaczmarz(p,W,k_max)
[nmesures, npixels] = size(W);

W_t = W';

f = zeros(npixels, 1);
k = 1;

while k <= k_max
    for i=1:nmesures
        wi = W_t(:,i);
        n = norm(wi);
        if n ~= 0
            pi = p(i);
            f = f + ((pi-wi'*f)/(n^2))*wi;
        end
    end
    k = k+1;
end
end