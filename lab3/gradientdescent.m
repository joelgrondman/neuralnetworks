
N = 5;                          %dimension input
P = 10;                         %amount of inputs
xi = zeros(P,N);                %input
tau = zeros(P,1);               %output
w1 = rand(N,1);                %weights
w1 = w1./norm(w1);
w2 = rand(N,1);
w2 = w2./norm(w2);

n = 0.01;
h = 0.1;
t_max = 100;
%initialize xi and tau somehow

for t = 1:t_max*P

[xi_v,I] = datasample(xi,1);
tau_v = tau(I);
e_v = ((tanh(w1'*xi_v) + tanh(w2*xi_v) - tau_v)^2)/2;
e_vh1 = ((tanh((w1+h)'*xi_v) + tanh(w2*xi_v) - tau_v)^2)/2;
e_vh2 = ((tanh(w1'*xi_v) + tanh((w2+h)*xi_v) - tau_v)^2)/2;

w1 = w1 - n*(e_vh1-e_v)/h;
w2 = w2 - n*(e_vh2-e_v)/h;

end
