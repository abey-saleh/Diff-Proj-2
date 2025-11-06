[~, R, G, B] = loadImage('rectangle.jpg');

R_t = R';
G_t = G';
B_t = B';

[n, m] = size(R_t);

X_transposed = zeros(n, m, 3);
X_transposed(:,:,1) = R_t;
X_transposed(:,:,2) = G_t;
X_transposed(:,:,3) = B_t;

figure;
imagesc(uint8(X_transposed));
title('Figure 9: Transposed Image');
axis equal tight;