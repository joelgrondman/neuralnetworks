clear all

N = 5;
a = 4;
nmax = 100;
nd = 50;
P = N * a;


figure(1)

if 1 == 0
    for a = 0.75:0.25:3
        P = N * a;
        QV = genplot(N, P, nd , nmax);
        hold on
        plot((1:P)/N, QV)


    end
end
hold off

figure(2)

for N = 5:15:95
    P = floor(N * a);
    % add theoretical value plot for comparison
    [C,X] = theoretical(N,4);
    stairs(X,C)
    C
    hold on
end
hold off

xlabel('P/N')
ylabel('probability for lin. sep.')
