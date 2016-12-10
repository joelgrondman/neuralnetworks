function e = trainrand(N, P,nd, nmax)

    e = 0;
    wt = ones(N,1);
    for n = 1:nd
        xi = randn(N,P);

        S = sign(wt' * xi)';

        wmax = perceptron (xi, S, nmax);

        e = e + (1/pi)*acos(sum(wmax)/(sqrt(N)*norm(wmax)))/nd;
    
    end

end

