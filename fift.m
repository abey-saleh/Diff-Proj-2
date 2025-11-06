img_name = 'square.jpg';
[~, R, ~, ~] = loadImage(img_name);

[m, n] = size(R);
if m ~= n
    error('Image is not square.');
end

S = createDSTMatrix(n);

p_values = [0.5, 0.25, 0.1];
total_pixels = n * n;

disp('--- Compression Ratio Analysis ---');
disp(['Total Entries (Uncompressed Size): ' num2str(total_pixels)]);
disp('----------------------------------');

for k = 1:length(p_values)
    p = p_values(k);
    
    [~, YR_zeroed] = compressChannel(R, S, p);
    
    non_zero = nnz(YR_zeroed);
    
    compression_ratio = total_pixels / non_zero;
    
    fprintf('p = %.2f | NNZ (Compressed Size): %d | CR: %.1f\n', ...
            p, non_zero, compression_ratio);
end