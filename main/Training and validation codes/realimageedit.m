
% This script works as an image augmentation code. The user enters the address
% to the folder containing the patterns. Per each real image, an arbitrary
% number of modified image (e. g. rotated, translated, etc.) is produced.
% The generated augmented images are saved according to their pattern in corresponding folders.
% Produced images can be used for training and validation of the CNN



clc
clear
% read the address to the actual image folder. Please note that the address
% should change to where the images are saved.
imds = imageDatastore(fullfile('C:\','Users','Morteza','Desktop','jannet','training','abbr','/'),...
'FileExtensions','.jpg','LabelSource','foldernames','includesubfolders',1);

num_images=size(imds.Labels); %total number of actual images
num_edited=100; % number of generated images of each real image
current_folder=pwd;
warning off

for i=1:num_images
    cd(current_folder);

shape=imds.Labels(i);
folder_name = sprintf('edited_%s',shape);
mkdir(folder_name);
save_address=fullfile(pwd,folder_name);
 cd(fullfile(pwd,folder_name));
     
    for k=1:num_edited

I=readimage(imds,i);
I=imagegen(I);
% I=imresize(I,[227 227]);
% I=rgb2gray(I(:, :, 1:3));
% I = repmat(I, [1 1 3]);

 s=size(I);
file_name = sprintf('test_%s_%d_%d.jpg',shape,i,k);
%  if (nnz(~I)/(s(1)*s(2)*s(3))) < 0.75
 I=prepareImage(I);
 imwrite(I,file_name)
%  end
 
    end
end


cd(current_folder);
% Copyright <2019> Massachusetts Institute of Technology
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
% 


