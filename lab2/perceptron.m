function [ w ] = perceptron(xi, S, nmax)

    N = size(xi,1);
    P = size(xi,2);
    w = zeros(N,1);
    
    
    for t=1:nmax
        wo = w;
        for p = 1:P      
            Kv = (xi'*w.*S);               %dropped weight, for efficiency
            [~,u] = min(Kv);               %find minimal stability     
            w = w + (xi(:,u) .* S(u))/ N;  %update  weight vector
            
        end
        
        % stop if w remains relatively constant
        n = norm(abs((w - wo)./wo));
        if n < 0.1
           return 
        end
        
    end

end


