function [ w ] = perceptron(xi, S)

N = size(xi,2);
w = zeros(1,N);
c = 0.1;

for t=1:1000

   v = mod(t,size(xi,1))+ 1;

   Ev = w.* xi(v,:) * S(v);

   f = Ev < c;

   w = w + (f.*xi(v,:) * S(v))/ N;

end

end

