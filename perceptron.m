function [ w ] = perceptron(xi, S, nmax)

    N = size(xi,1);
    P = size(xi,2);
    w = zeros(N,1);
    
    cumulative_nonupdate = 0;
    
    for t=1:nmax
        
        for p = 1:P
            
            % find Ev value
            Ev = dot(w, xi(:,p)) * S(p);
            
            if Ev <= 0
                % update weight and reset cumulative_update
                w = w + (xi(:,p) * S(p))/ N;
                cumulative_nonupdate = 0;
            else
                % no update => increase nonupdate
                cumulative_nonupdate = cumulative_nonupdate + 1;
            end
            
            % P times no update, nothing will change => return
            if cumulative_nonupdate == P
               return 
            end
            
        end
    end

end


