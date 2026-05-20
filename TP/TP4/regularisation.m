function regul = regularisation(i,j,k,ks)
somme = 0;
[nblignes, nbcols] = size(k);
for m = (i-1):(i+1)
    for l = (j-1):(j+1)
        if l ~= j && m ~=i && l > 0 && m > 0 && m<=nblignes && l <= nbcols

            if k(m,l) ~= ks
                somme = somme + 1;
            end
        end
        
           

    end
end

regul = somme;
end

