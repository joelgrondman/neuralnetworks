function QV = gensample(N, P, nd , nmax)

QV = nan(P,1);

for p = 1:P
    Qls = 0;
    
    for n = 1:nd
        %generate a set ID
        xi = randn(N,p);
        S = randi([0 1],p,1)*2 - 1;
        w = perceptron (xi, S, nmax);
        Qls = Qls + isequal(S, sign(w'* xi)');
    end

    QV(p) = Qls;
    
end
QV = QV/nd;

end

