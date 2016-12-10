function pr = theoretical(N,P)


        if P/N < 2
            pr = 0.5;
        else
            pr = (1/(P/N - 1))/2;
        end     
    
end

