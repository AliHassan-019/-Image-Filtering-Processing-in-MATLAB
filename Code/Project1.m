clc
close all
clear all

                         %%%%  READ IMAGE %%%%
                         
I = imread('penguin2.jpg'); % read image
figure()
imshow(I); % show image
title('Orignal Image');

              %%%%  CONVERT RGB IMAGE TO GRAY SCALE IMAGE%%%%

J1 = rgb2gray(I); %convert rgb image to gray
figure()
imshow(J1); % show gray scale image
title('Gray Scale Image');

                %%%%  APPLYING NOISE TO GRAY SCALE IMAGE %%%%

%  noiseimg = imnoise(J1,'gaussian',0,0.02); % Add gausian noise
% noiseimg = imnoise(J1,'salt & pepper',0.2); % Add salt & pepper noise
noiseimg = imnoise(J1,'speckle',0.05); % Add speckle noise
figure()
imshow(noiseimg); % show gray scale image
title('Noisy Image');

               %%%%  APPLYING MEDIAN FILTER TO NOISY IMAGE %%%%

M = 4;
N = 4;
filterimg = medfilt2(noiseimg,[M,N]);
figure()
imshow(filterimg); % show median filtered image
title(['Median Filtered Image',num2str(M),'x',num2str(N)]);

                     %%%%  APPLYING HIGH PASS FILTER %%%%

h1 = [1 -1 1; -1 1 -1; 1 -2 1];
% h1 = [1 -2 1; -1 -1 -1; 1 -1 1];
hpfimg = conv2(double(J1), double(h1));
figure()
imshow(hpfimg); % show HPF image
title('High Pass Filtered Image');
