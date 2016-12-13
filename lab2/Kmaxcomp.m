clear all

% parameters
N = 20;                 % number of dimensions
ss = 0.25;
a = 0.1:ss:5;          % alpha to sample for (P = floor(N*a))
nmax = 200;             % maximum amount of iterations with perceptron
nd = 50;                % amount of samples obtained to measure l s
                        % probability
                        
a = [a (a(end) + ss)];
                        
Kmax = nan(size(a));
Kmaxrand = nan(size(a));
for i = 1:length(a)
    P = floor(N * a(i));
    [~, Kmax(i)] = trainteach(N,P,nd,nmax);
    [~, Kmaxrand(i)] = trainrand(N,P,nd,nmax);

end

figure(1)
stairs([a(1:end-1)],[Kmax(2:end)])
hold on 
stairs([a(1:end-1)],[Kmaxrand(2:end)])
hold off
xlabel('P/N');
ylabel('Estimated Kmax')
xlim([0 P/N])
title('Kmax comparison between teacher and random outputs')
legend('Kmax teacher', 'Kmax random')
name = ['N = ' num2str(N) ' nmax = '  num2str(nmax)...
    ' n_{D} = '  num2str(nd)];
saveas(gcf,['kmaxcomp',regexprep(name,'[^\w'']',''),'.png'])
