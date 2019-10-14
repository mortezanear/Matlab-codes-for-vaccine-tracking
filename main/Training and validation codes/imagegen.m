% This script applies certain random modifications to an image (e. g. rotation,
% translation, etc.). It also prepares the images in a format appropriate
% for the image classifier CNN (AlexNet)


function J = imagegen(I)

% if rand>0.5
% I= imnoise(I,'gaussian',0.75*rand-0.5);
% end

% if rand>0.5
%     tform = affine2d([0.1*rand 0.1*rand 0; 0.1*rand 0.1*rand 0; 0 0 1]);
%     I=imwarp(I,tform);
% end

if rand >0.5
    I=flip(I ,2);
end

if rand > 0.5
    I=flip(I ,2);
end






if rand>0.5
I=imrotate(I,180*rand);
end

if rand>0.5
I=imrotate(I,180*rand);
end





% if rand>0.5
% I= imnoise(I,'salt & pepper',0.01*rand);
% end
% 
% if rand>0.5
%   I=imresize(I,2*rand);
% end
% 
%  if rand>0.5
%     I=imresize(I,0.5*rand);
% end


% 

I=imresize(I,[227 227]); % size of AlexNet training images
I=rgb2gray(I(:, :, 1:3)); % converting to gray scale
I = repmat(I, [1 1 3]);
% 

J=I;



end