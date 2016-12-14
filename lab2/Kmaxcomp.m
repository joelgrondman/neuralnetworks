clear all

% parameters
N = 20;                 % number of dimensions
ss = 0.25;
a = 0.25:ss:5;          % alpha to sample for (P = floor(N*a))
nmax = 100;             % maximum amount of iterations with perceptron
nd = 50;                % amount of samples obtained to measure l s
                        % probability
c = 0.01;
                        
                        
Kmax = nan(size(a));
Kmaxrand = nan(size(a));
for i = 1:length(a)
    P = floor(N * a(i));
    [~, Kmax(i)] = trainteach(N,P,nd,nmax);
    [~, Kmaxrand(i)] = trainrand(N,P,nd,nmax,c);

end

figure(1)
plot(a,Kmax)
hold on 
plot(a,Kmaxrand)
hold off
xlabel('P/N');
ylabel('Estimated Kmax')
xlim([0 P/N])

legend('Kmax teacher', 'Kmax random')
name = ['N = ' num2str(N) ' nmax = '  num2str(nmax)...
    ' n_{D} = '  num2str(nd)];
title(name)
saveas(gcf,['kmaxcomp',regexprep(name,'[^\w'']',''),'.png'])
