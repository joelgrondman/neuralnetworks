clear all

% parameters
N = 20;                 % number of dimensions
ss = 0.1;
a = 0.1:ss:5;          % alpha to sample for (P = floor(N*a))
nmax = 100;             % maximum amount of iterations with perceptron
nd = 10;                % amount of samples obtained to measure l s
                        % probability
                        
E = nan(size(a));
Kmax = nan(size(a));
for i = 1:length(a)
    P = floor(N * a(i));
    [E(i), Kmax(i)] = trainteach(N,P,nd,nmax);

end

figure(1)
plot(a,E)
xlabel('P/N');
ylabel('generalization error')
ylim([0 0.6])
xlim([0 P/N])

name = ['N = ' num2str(N) ' nmax = '  num2str(nmax)...
    ' n_{D} = '  num2str(nd)];
title(name)
saveas(gcf,[regexprep(name,'[^\w'']',''),'.png'])

figure(2)
plot(a,Kmax)
xlabel('P/N');
ylabel('Estimated Kmax')
xlim([0 P/N])
title(name)
saveas(gcf,['kmax',regexprep(name,'[^\w'']',''),'.png'])

