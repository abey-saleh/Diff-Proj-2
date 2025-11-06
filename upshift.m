image = imread('rectangle.jpg');

A = im2double(image);

[M, N, C] = size(A); 
shift = 306;

disp(['Image dimensions: ', num2str(M), ' (Height) x ', num2str(N), ' (Width)']);
disp(['Applying horizontal shift of: +', num2str(shift), ' pixels.']);

I_R = eye(N);
current_indices = 1:N;

new_col_indices = mod(current_indices - shift - 1, N) + 1;

T = I_R(:, new_col_indices);

figure;
spy(T, 1);
title(['Transformation Matrix T (', num2str(N), 'x', num2str(N), ') for Horizontal Shift +', num2str(shift)]);
xlabel('Original Column Index');
ylabel('New Column Index');

shifted_image = zeros(M, N, C);

for c = 1:C
    shifted_image(:,:,c) = A(:,:,c) * T;
end

figure;
imshow(shifted_image);
title(['Shifted Image (Horizontal +', num2str(shift), ' Pixels)']);