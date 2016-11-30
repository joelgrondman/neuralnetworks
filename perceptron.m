function [ w ] = perceptron(xi, S, nmax)

    N = size(xi,1);
    P = size(xi,2);
    w = zeros(N,1);

    Ev = zeros(P,1);
    
    for t=1:nmax
        
        for p = 1:P

            Ev(p) = dot(w, xi(:,p)) * S(p);

            if sum(sign(Ev)) == P
               return
            end
            
            if Ev(p) <= 0
                w = w + (xi(:,p) * S(p))/ N;
            end
            
        end
    end

end

