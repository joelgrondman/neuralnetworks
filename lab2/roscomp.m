clear all

% parameters
N = 50;                 % number of dimensions
ss = 0.25;
a = 0.1:ss:5;          % alpha to sample for (P = floor(N*a))
nmax = 200;             % maximum amount of iterations with perceptron
nd = 50;                % amount of samples obtained to measure l s
                        % probability
                                                
E = nan(size(a));
Er = nan(size(a));
for i = 1:length(a)
    P = floor(N * a(i));
    [E(i), ~] = trainteach(N,P,nd,nmax);
    [Er(i), ~] = samplerosen(N,P,nd,nmax,0.1);

end

figure(1)
plot(a,E)
hold on
plot(a,Er)
hold off
xlabel('P/N');
ylabel('generalization error')
xlim([0 P/N])
ylim([0 0.6])
legend('gen error minover', 'gen error rosen')
name = ['N = ' num2str(N) ' nmax = '  num2str(nmax)...
    ' n_{D} = '  num2str(nd)];
title(name)

saveas(gcf,['generrcomp',regexprep(name,'[^\w'']',''),'.png'])

