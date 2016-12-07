clear all

N = 5;
a = 0.75:0.25:3;
nmax = 100;
nd = 50;
P = N * a;


QV = nan(size(a));

for i = 1:length(a)
    P = floor(N * a(i));
    QV(i) = genplot(N, P, nd , nmax);
end

figure(1)
plot(a, QV)
xlabel('P/N')
ylabel('probability for lin. sep.')




figure(2)

for N = 1:10
    P = floor(N * a);
    % add theoretical value plot for comparison
    [C,X] = theoretical(N,4);
    stairs(X,C)
    
    hold on
end
hold off

xlabel('P/N')
ylabel('probability for lin. sep.')
