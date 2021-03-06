
% This script uses the trained network to compare the predicted
% pattern by the CNN to the actual pattern. The test images should be put in a
% folder that containes only a particular pattern. The corresponding pattern label
% should be inserted as the parameter "shape". The predicted classification for each image is stored in parameter "pred" and compared with "shape"....
% accuracy is ultimately calculated as the percentage of correctly classified images divided by the total number of test images. 




clc
clear
load Jan_net % CNN is loaded
net=Jan_net;

% address to the folder with the test images with a particular predefined
% pattern 

IM3 = imageDatastore(fullfile('insert the address','all_cropped_O'),...
  'FileExtensions','.png','LabelSource','foldernames','includesubfolders',1);

n_images=max(size(IM3.Labels));%total number of actual images
corr=zeros(n_images,1);


for i=1:n_images
  
  %     shape=imds.Labels(i);
  shape='edited_O'; % manually should change to any pattern of interest"
  I = readimage(IM3, i);
  J = prepareImage(I);
  pred = classify(net, J);
  
  if pred == shape
    corr(i,1)=1;
  else
    imshow(J);
    drawnow;
  end
end

Testing_accuracy = nnz(corr) / length(corr)
find(~corr)

% Copyright <2019> Massachusetts Institute of Technology
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
% 




