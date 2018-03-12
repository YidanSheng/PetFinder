I = imread('dog1.png');

J = imresize(I,0.5);

figure
imshow(I)
title('Original Image')

figure
imshow(J)
title('Resized Image')