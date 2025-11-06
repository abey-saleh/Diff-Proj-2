function S = createDSTMatrix(n)

    S = zeros(n);
    
    k = sqrt(2 / n);

    for i = 1:n
        for j = 1:n
            arg = (pi * (i - 0.5) * (j - 0.5)) / n;
            S(i, j) = k * sin(arg);
        end
    end
end