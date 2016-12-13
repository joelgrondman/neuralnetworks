function [E, Kmax] = trainrand(N, P,nd, nmax)

    E = 0;
    Kmax = 0;
    for n = 1:nd
        
        xi = randn(N,P);
        S = randi([0 1],P,1)*2 - 1;
        wmax = teacherperceptron (xi, S, nmax);

        Kmax = Kmax + (min(xi'*wmax.*S)/norm(wmax))/nd;
        E = E + (1/pi)*acos(sum(wmax)/(sqrt(N)*norm(wmax)))/nd;
    
    end

end

