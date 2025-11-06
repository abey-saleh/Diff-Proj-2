img_name = 'square.jpg';
try
    [~, R, G, B] = loadImage(img_name);
catch
    disp("Error: 'square.jpg' not found or 'loadImage.m' is missing.");
    disp("Please add 'square.jpg' to the current folder.");
    return;
end

[m, n] = size(R);
if m ~= n
    disp('Warning: The image loaded is not square.');
    disp('Using n x n matrix for S. This may produce errors.');
end

try
    S = createDSTMatrix(n);
catch
    disp("Error: 'createDSTMatrix.m' is not in your path.");
    return;
end

p_values = [0.9, 0.5, 0.3, 0.1];
figure_handles = [13, 14, 15, 16];

for k = 1:length(p_values)
    p = p_values(k);
    
    [R_comp, ~] = compressChannel(R, S, p);
    [G_comp, ~] = compressChannel(G, S, p);
    [B_comp, ~] = compressChannel(B, S, p);
    
    X_compressed = zeros(m, n, 3);
    X_compressed(:,:,1) = R_comp;
    X_compressed(:,:,2) = G_comp;
    X_compressed(:,:,3) = B_comp;
    
    figure;
    imagesc(uint8(X_compressed));
    axis equal tight;
    title_str = sprintf('Figure %d: Compressed Image with p = %.1f', ...
                        figure_handles(k), p);
    title(title_str);
end