function [X_gray, R, G, B] = loadImage(filename)

    X_int = imread(filename);
    X_double = double(X_int);

    R = X_double(:,:,1);
    G = X_double(:,:,2);
    B = X_double(:,:,3);

    X_gray = R/3.0 + G/3.0 + B/3.0;
end