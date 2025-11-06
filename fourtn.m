img_name = 'square.jpg';
[~, R, G, B] = loadImage(img_name);

[m, n] = size(R);
if m ~= n
    error('Image is not square.');
end

S = createDSTMatrix(n);

p_values = [0.9, 0.5, 0.3, 0.1];
total_pixels = n * n;

disp('--- Compression Analysis ---');
disp(['Image Size: ' num2str(n) 'x' num2str(n)]);
disp(['Total Entries per Channel: ' num2str(total_pixels)]);
disp('----------------------------------');

for k = 1:length(p_values)
    p = p_values(k);
    
    [~, YR_zeroed] = compressChannel(R, S, p);
    
    non_zero = nnz(YR_zeroed);
    
    percent_kept = (non_zero / total_pixels) * 100;
    
    fprintf('p = %.1f | Non-Zero: %d | Data Kept: %.1f%%\n', ...
            p, non_zero, percent_kept);
end