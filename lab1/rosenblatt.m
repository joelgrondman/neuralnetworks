clear all

% parameters
N = 20;                  % number of dimensions
ss = 0.25;
a = 0.75:ss:3;        % alpha to sample for (P = floor(N*a))
nmax = 1000;             % maximum amount of iterations with perceptron
nd = 50;                % amount of samples obtained to measure l s
                        % probability
c = 100;                % constant c
                        
a = [a (a(end) + ss)];  % extend a, necessary to have value on top of stairs

QV = nan(size(a));

for i = 1:length(a)
    P = floor(N * a(i));
    QV(i) = genplot(N, P, nd , nmax, c);
end

figure(1)
%plot(a,QV)
%hold on
stairs([0 a(1:end-1)],[1 QV(2:end)]) % also plot at a = 0 for continuity
ylim([0 1])
xlim([0 3])
hold on
xlabel('P/N')
ylabel('probability for lin. sep.')


% plot theoretical value,the 1:3*N + 1 and PV(2:end)
PV = nan(a(end-1)*N + 1,1);

for p = 1:length(PV)
    % add theoretical value plot for comparison
    PV(p) = theoretical(N,p);
end

stairs((1:length(PV)-1)/N,PV(2:end),'r')

hold off

l = {'rosenblatt', 'theoretical'};
legend(l)
name = ['N = ' num2str(N) ' nmax = '  num2str(nmax)...
    ' n_{D} = '  num2str(nd), ' c = ' num2str(c)];
ylim([0 1])
xlim([0 3])
title(name)
saveas(gcf,[regexprep(name,'[^\w'']',''),'.png'])

