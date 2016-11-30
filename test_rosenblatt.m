N = 20;
a = 2;
nmax = 100;

P = a * N;
nd = 50;
QV = zeros(P,1);

for p = 1:P
    Qls = 0;
    
    for n = 1:nd
        %generate a set ID
        xi = randn(N,P);
        S = randi([0 1],P,1)*2 - 1;
        w = perceptron (xi, S, nmax);
        output = w'* xi;
        isld = isequal(S, sign(output)');
        Qls = Qls + (isld == 0);
    end
    QV(p) = Qls/nd;

end

figure(1)
plot((1:P)/N, QV)
xlabel('P/N')