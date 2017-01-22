load('data3.mat');

% function for calculating Sigma
Sigma = @(w1,w2,xi) (tanh(xi*w1) + tanh(xi*w2));
% function for calculating contribution
Cont = @(w1,w2,xi,tau) ((Sigma(w1,w2,xi) - tau).^2)/2;

N = size(xi,1);                 %dimension input
P = 500;                        % number of examples
Q = 500;                        % number of test samples
xi_train = xi(:,1:P)';          % training examples
tau_train = tau(1:P);           % corresponding labels
%xi_test = xi(:,P+1:Q)';          % testing data
%tau_test = tau(P+1:Q);           % labels of testing data
[xi_test,I] = datasample(xi(:,P+1:end)',Q,'Replace',false);   % testing data
tau_test = tau(I);              % labels of testing data

w1 = rand(N,1);                 % initialize weights
w1 = w1./norm(w1);
w2 = rand(N,1);
w2 = w2./norm(w2);

n = 0.05;                       % constant learning rate
h = ones(N,1)*0.01;             % h for approximating partial derivative
t_max = 100;                    % timesteps

E_train = nan(t_max,1);       % vectors for holding found errors
E_test = nan(t_max,1);
tic
%[trains,I_v] = datasample(xi_train,t_max*P);

for t = 1:t_max

    for p = 1:P
        [xi_v,I] = datasample(xi_train,1);      % pick train example
        %xi_v = trains(t,:);
        %I = I_v(t);
        tau_v = tau_train(I);

        e_v = Cont(w1,w2,xi_v,tau_v);           % calculate gradient
        e_vh1 = Cont(w1+h,w2,xi_v,tau_v);
        e_vh2 = Cont(w1,w2+h,xi_v,tau_v);

        w1 = w1 - n*(e_vh1-e_v)./h;             % update weights
        w2 = w2 - n*(e_vh2-e_v)./h;
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

figure(2)
bar(w1)
figure(3)
bar(w2)
