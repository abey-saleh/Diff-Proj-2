function [X_comp, Y_zeroed] = compressChannel(X_channel, S, p)

    [m, n] = size(X_channel);
    
    if m ~= n
        error('Image is not square. This simple compression requires n x n.');
    end
    
    Y = S * X_channel * S;

    Y_zeroed = Y;
    for i = 1:n
        for j = 1:n
            if (i + j > p * 2 * n)
                Y_zeroed(i, j) = 0;
            end
        end
    end
    
    X_comp = S * Y_zeroed * S;
end