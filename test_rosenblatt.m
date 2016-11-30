clear all

N = 5;
a = 4;
nmax = 100;

P = a * N;
nd = 50;
QV = zeros(P,1);

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

figure(1)
plot((1:P)/N, QV)

% add theoretical value plot for comparison
C = ones(min(N,P) + 1,1);
if P > N
    Vkm = zeros(P-N,1);
    for pc = N+1:P
        for i = 0:N-1
           Vkm(pc - N) = Vkm(pc - N) + nchoosek(pc - 1,i);
        end
        Vkm(pc - N) = Vkm(pc - N)/(2^(pc - 1));
    end

  C = [C ; Vkm];  
end

X = [0:1/N:P/N]; 

hold on
stairs(X,C)
hold off
xlabel('P/N')
ylabel('probability for lin. sep.')