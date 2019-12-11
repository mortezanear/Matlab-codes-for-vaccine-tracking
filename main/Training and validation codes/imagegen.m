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


% Copyright <2019> Massachusetts Institute of Technology
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
% 




