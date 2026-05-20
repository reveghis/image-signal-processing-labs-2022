function regul = regularisation_bis(R,C)
somme = 0;
[nblignes, ~] = size(C);
for i = 1:nblignes
    for j = i:nblignes
        if j<i
            distance = pdist([C(i,:) ; C(j,:)],'euclidean');
            if distance<(sqrt(2)*R)
                somme = somme + 1;    
            end
        end
    end
end
regul = somme;
end





