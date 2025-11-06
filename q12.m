try
    Xg = imread('cameraman.tif');
    Xg = im2double(Xg);
    N = 256;
    Xg = imresize(Xg, [N, N]);
catch
    disp('Could not load cameraman.tif, using a random matrix instead.');
    N = 256;
    Xg = rand(N, N);
end

disp('Creating S matrix...');
S = createDSTMatrix(N);
disp('S matrix created.');

disp('Applying forward DST...');
Y = S * Xg * S;
disp('Forward DST complete.');

disp('Applying inverse DST...');
Xg_reconstructed = S * Y * S;
disp('Inverse DST complete.');

figure('Name', '2D DST Inverse Demonstration');

subplot(1, 3, 1);
imagesc(Xg);
colormap(gray);
axis image;
title('Original Image (Xg)');

subplot(1, 3, 2);
imagesc(log(abs(Y) + 1));
colormap(gray);
axis image;
title('2D DST (Y = SXgS)');

subplot(1, 3, 3);
imagesc(Xg_reconstructed);
colormap(gray);
axis image;
title('Reconstructed (Xg = SYS)');

disp('Done. The "Original" and "Reconstructed" images should look identical.');