function regul = regularisation(i,R,C,C_n)
somme = 0;
[nblignes, ~] = size(C);
for j = 1:nblignes
    distance = pdist([C_n ; C(j,:)],'euclidean');
    
        if distance<(sqrt(2)*R) && j~=i

                somme = 1;
                break
            
        end
        
           

 
end

regul = somme;
end

