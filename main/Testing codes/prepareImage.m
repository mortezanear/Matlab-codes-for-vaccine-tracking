
% This script is used to normalize the intensity thus remove
% intensity-caused biases in image classification 

function J = prepareImage(I)

J = I;

% Convert to grayscale.
if (size(J, 3) >= 3)
  J = rgb2gray(J(:, :, 1:3));
end

% Rescale to [0,1] range.
J = double(J);
J = J / max(J(:));

% Crop around the brightest parts, assuming pattern is bright.
J = imageCrop(J);

% Resize to AlexNet compatible size.
J = imresize(J, [227 227]);

% Convert to 8-bit
J = uint8(255 * J);

% Make into 3 channels for AlexNet.
J = repmat(J, [1 1 3]);

end

% Copyright <2019> Massachusetts Institute of Technology
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
% 




