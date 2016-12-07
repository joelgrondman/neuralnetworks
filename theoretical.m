function [C,X] = theoretical(N,a)

    maxp = floor(a * N);
    X = 1/N:1/N:maxp/N;
    X = X';
    C = zeros(maxp,1);

    for p = 1:maxp
        
        if p <= N
            C(p) = 1;
        else
            for j = 0:N-1
                  C(p) = C(p) + nchoosek(p - 1,j);
            end
            C(p) = C(p)/2^(p-1);
        end     
        
    end
    
end

