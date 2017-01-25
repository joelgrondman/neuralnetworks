load('data3.mat');

% function for calculating Sigma
Sigma = @(w1,w2,xi) (tanh(xi*w1) + tanh(xi*w2));
% function for calculating contribution
Cont = @(w1,w2,xi,tau) ((Sigma(w1,w2,xi) - tau).^2)/2;
%gradient of contribution with respect to w2
grad = @(w1,w2,xi,tau) (Sigma(w1,w2,xi) - tau)*(1-tanh(xi*w2)^2)*xi';

N = size(xi,1);                 %dimension input
P = 1000;                        % number of examples
Q = 100;                        % number of test samples
xi_train = xi(:,1:P)';          % training examples
tau_train = tau(1:P);           % corresponding labels
xi_test = xi(:,P+1:P+Q)';       % testing data
tau_test = tau(P+1:P+Q);        % labels of testing data

w1 = rand(N,1);                 % initialize weights
w1 = w1./norm(w1);
w2 = rand(N,1);
w2 = w2./norm(w2);

n = 1;                       % constant learning rate
t_max = 1000;                   % timesteps

E_train = nan(t_max,1);         % vectors for holding found errors
E_test = nan(t_max,1);
tic

for t = 1:t_max

    for p = 1:P
        [xi_v,I] = datasample(xi_train,1);      % pick train example
        tau_v = tau_train(I);

        w1 = w1 - n*grad(w2,w1,xi_v,tau_v);             % update weights
        w2 = w2 - n*grad(w1,w2,xi_v,tau_v);
    end
    
    % estimate training and test error
    E_train(t) = (1/P)*sum(Cont(w1,w2,xi_train,tau_train'));
    E_test(t) = (1/Q)*sum(Cont(w1,w2,xi_test,tau_test'));

end
toc
figure(1)
plot(1:t_max,E_train,'b')
hold on
plot(1:t_max,E_test,'r')
hold off
xlabel('Time (P updates to weights each timestep)')
ylabel('Error')
legend('Training error','Generalization error')
title('Estimated errors against time')

figure(2)
bar(w1)
xlabel('Weight index')
ylabel('Weight value')
title('Weights of w1')
figure(3)
bar(w2)
xlabel('Weight index')
ylabel('Weight value')
title('Weights of w2')
