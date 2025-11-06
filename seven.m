% --- Script to Flip Image Upside Down (Question 7) ---

% Load the original image data
[~, R, G, B] = loadImage('rectangle.jpg');

% Get image dimensions
[m, n] = size(R);

% --- 1. Create Vertical Flip Matrix (T_flip) ---
E = eye(m);       % m x m identity matrix

% Create T_flip by reversing the row order of the identity matrix
% A simple way to do this is to index the rows from m down to 1.
T_flip = E(m:-1:1, :);

% --- 2. Apply Transformations to all 3 Channels ---
R_flipped = T_flip * R;
G_flipped = T_flip * G;
B_flipped = T_flip * B;

% --- 3. Reconstruct and Display Flipped Image ---
X_flipped = zeros(m, n, 3);
X_flipped(:,:,1) = R_flipped;
X_flipped(:,:,2) = G_flipped;
X_flipped(:,:,3) = B_flipped;

figure;
imagesc(uint8(X_flipped));
title('Figure 7: Image Flipped Upside Down');
axis equal tight;

% --- 4. Display Spy Plot ---
figure;
spy(T_flip);
title('Figure 8: Vertical Flip Matrix (spy(T_flip))');
xlabel('m (columns)');
ylabel('m (rows)');