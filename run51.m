[gray_img, R, G, B] = loadImage('rectangle.jpg');

[m, n] = size(R);

X_color_reconstructed = zeros(m, n, 3);
X_color_reconstructed(:,:,1) = R;
X_color_reconstructed(:,:,2) = G;
X_color_reconstructed(:,:,3) = B;

figure;
imagesc(uint8(X_color_reconstructed));
title('Figure 1: Original Color Image (rectangle.jpg)');
axis equal tight;

figure;
imagesc(uint8(gray_img));
colormap('gray');
title('Figure 2: Grayscale Version (rectangle.jpg)');
axis equal tight;