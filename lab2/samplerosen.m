function [E, Kmax] = samplerosen(N, P, nd , nmax, c)

    E = 0;
    wt = ones(N,1);
    Kmax = 0;
    for n = 1:nd
        %generate a set ID
        xi = randn(N,P);
        S = sign(wt' * xi)';
        wmax = rosenperceptron (xi, S, nmax, c);
        
        Kmax = Kmax + (min(xi'*wmax.*S)/norm(wmax))/nd;
        E = E + (1/pi)*acos(sum(wmax)/(sqrt(N)*norm(wmax)))/nd;
    end

end

