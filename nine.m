[~, R, G, B] = loadImage('rectangle.jpg');

[m, n] = size(R);

border_size = 100;

T_border_v = zeros(m);
I_block_v = eye(m - (2 * border_size));

T_border_v(border_size + 1 : m - border_size, ...
           border_size + 1 : m - border_size) = I_block_v;

T_border_h = zeros(n);
I_block_h = eye(n - (2 * border_size));

T_border_h(border_size + 1 : n - border_size, ...
           border_size + 1 : n - border_size) = I_block_h;

R_bordered = T_border_v * R * T_border_h;
G_bordered = T_border_v * G * T_border_h;
B_bordered = T_border_v * B * T_border_h;

X_bordered = zeros(m, n, 3);
X_bordered(:,:,1) = R_bordered;
X_bordered(:,:,2) = G_bordered;
X_bordered(:,:,3) = B_bordered;

figure;
imagesc(uint8(X_bordered));
title('Figure 10: Image Cropped with 100px Black Border');
axis equal tight;

figure;
spy(T_border_v);
title('Figure 11: Vertical Border Matrix (spy(T_{border\_v}))');
xlabel('m (columns)');
ylabel('m (rows)');

figure;
spy(T_border_h);
title('Figure 12: Horizontal Border Matrix (spy(T_{border\_h}))');
xlabel('n (columns)');
ylabel('n (columns)');