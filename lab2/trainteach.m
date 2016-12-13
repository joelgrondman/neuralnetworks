function [E, Kmax] = trainteach(N, P,nd, nmax)

    E = 0;
    wt = ones(N,1);
    Kmax = 0;
    for n = 1:nd
        
        xi = randn(N,P);
        S = sign(wt' * xi)';
        wmax = teacherperceptron (xi, S, nmax);

        Kmax = Kmax + (min(xi'*wmax.*S)/norm(wmax))/nd;
        E = E + (1/pi)*acos(sum(wmax)/(sqrt(N)*norm(wmax)))/nd;
    
    end

end

