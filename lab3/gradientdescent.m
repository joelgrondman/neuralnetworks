load('data3.mat');

N = size(xi,1);                 %dimension input
P = 500;                         %amount of inputs
xi_s = xi(:,1:P)';
tau_s = tau(1:P);
w1 = rand(N,1);                %weights
w1 = w1./norm(w1);
w2 = rand(N,1);
w2 = w2./norm(w2);

n = 0.01;
h = ones(N,1)*0.1;
t_max = 100;
%initialize xi and tau somehow
EV = nan(t_max*P,1);

for t = 1:t_max*P

    [xi_v,I] = datasample(xi_s,1);
    tau_v = tau_s(I);
    e_v = ((tanh(xi_v*w1) + tanh(xi_v*w2) - tau_v)^2)/2;
    e_vh1 = ((tanh(xi_v*(w1+h)) + tanh(xi_v*w2) - tau_v)^2)/2;
    e_vh2 = ((tanh(xi_v*w1) + tanh(xi_v*(w2+h)) - tau_v)^2)/2;

    w1 = w1 - n*(e_vh1-e_v)./h;
    w2 = w2 - n*(e_vh2-e_v)./h;
    
    EV(t) = (1/P)*0.5*sum((tanh(xi_s*w1)+tanh(xi_s*w2)).^2);

end

plot(1:t_max*P,EV)