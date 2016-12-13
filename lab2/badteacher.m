function [E, Kmax] = badteacher(N, P,nd, nmax, lambda)

    E = 0;
    wt = ones(N,1);
    Kmax = 0;
    for n = 1:nd
        
        xi = randn(N,P);
        S = sign(wt' * xi)';
        S = S .* randsample([1 -1],P,true,[1-lambda lambda])'; % add noise
        wmax = teacherperceptron (xi, S, nmax);

        Kmax = Kmax + (min(xi'*wmax.*S)/norm(wmax))/nd;
        E = E + (1/pi)*acos(sum(wmax)/(sqrt(N)*norm(wmax)))/nd;
    
    end

end

