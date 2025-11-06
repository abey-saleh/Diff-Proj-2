[~, R, G, B] = loadImage('rectangle.jpg');

R_new = R * 0;

G_new = G;

B_new = B + 80;

[m, n] = size(R);

X_color_changed = zeros(m, n, 3);
X_color_changed(:,:,1) = R_new;
X_color_changed(:,:,2) = G_new;
X_color_changed(:,:,3) = B_new;

figure;
imagesc(uint8(X_color_changed));
title('Figure 3: Modified Color Image (Red Removed, Blue Increased)');
axis equal tight;