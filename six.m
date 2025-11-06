[~, R, G, B] = loadImage('rectangle.jpg');

[m, n] = size(R);

r_shift = 230;
c_shift = 306;

E_v = eye(m);
T_v = zeros(m);

T_v(1:r_shift, :) = E_v(m - (r_shift - 1):m, :);

T_v(r_shift + 1:m, :) = E_v(1:m - r_shift, :);

E_h = eye(n);
T_h = zeros(n);

T_h(:, 1:c_shift) = E_h(:, n - (c_shift - 1):n);

T_h(:, c_shift + 1:n) = E_h(:, 1:n - c_shift);

R_shifted = T_v * R * T_h;
G_shifted = T_v * G * T_h;
B_shifted = T_v * B * T_h;

X_shifted = zeros(m, n, 3);
X_shifted(:,:,1) = R_shifted;
X_shifted(:,:,2) = G_shifted;
X_shifted(:,:,3) = B_shifted;

figure;
imagesc(uint8(X_shifted));
title('Figure 4: Combined Horizontal (306px) and Vertical (230px) Shift');
axis equal tight;

figure;
spy(T_v);
title('Figure 5: Vertical Shift Matrix (spy(T_v))');
xlabel('m (rows)');
ylabel('m (rows)');

figure;
spy(T_h);
title('Figure 6: Horizontal Shift Matrix (spy(T_h))');
xlabel('n (columns)');
ylabel('n (columns)');