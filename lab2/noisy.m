clear all

% parameters
N = 20;                 % number of dimensions
ss = 0.25;
a = 0.1:ss:5;          % alpha to sample for (P = floor(N*a))
nmax = 100;             % maximum amount of iterations with perceptron
nd = 50;                % amount of samples obtained to measure l s
                        % probability
lambda = 0.01;           % probability of noise                        
                        
a = [a (a(end) + ss)];
                        
E = nan(size(a));
Er = nan(size(a));
for i = 1:length(a)
    P = floor(N * a(i));
    [E(i), ~] = badteacher(N,P,nd,nmax,lambda);
    [Er(i), ~] = samplerosen(N,P,nd,nmax,0.1);

end

figure(1)
stairs([a(1:end-1)],[E(2:end)])
hold on
stairs([a(1:end-1)],[Er(2:end)])
hold off
xlabel('P/N');
ylabel('generalization error')
xlim([0 P/N])
ylim([0 0.6])
title('Rosenblatt and minover comparison')
legend('gen error minover', 'gen error rosen')
name = ['N = ' num2str(N) ' nmax = '  num2str(nmax)...
    ' n_{D} = '  num2str(nd),' \lambda = ', num2str(lambda)];
saveas(gcf,['noisy',regexprep(name,'[^\w'']',''),'.png'])

