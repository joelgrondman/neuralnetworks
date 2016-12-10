function pr = theoretical(N,P)


        if P <= N
            pr = 1;
        else
            pr = 0;
            for j = 0:N-1
                  pr = pr + nchoosek(P - 1,j);
            end
            pr = pr/2^(P-1);
        end     
    
end

