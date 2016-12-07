function QV = gensample(N, P, nd , nmax)

    Qls = 0;
    
    for n = 1:nd
        %generate a set ID
        xi = randn(N,P);
        S = randi([0 1],P,1)*2 - 1;
        w = perceptron (xi, S, nmax);
        Qls = Qls + isequal(S, sign(w'* xi)');
    end

    QV = Qls/nd;

end

