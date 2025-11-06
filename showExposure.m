function showExposure()

    brightness_value = 110; 

    try
        original_img = imread('grayscale1.jpg');
    catch
        error("Could not read '%s'. Make sure it is in the Current Folder.", filename);
    end
    
    exposed_img = imadd(original_img, brightness_value);

    figure;
    
    subplot(1, 2, 1);
    imshow(original_img);
    title('Original Image');
    
    subplot(1, 2, 2);
    imshow(exposed_img);
    title('Increased Exposure');

end