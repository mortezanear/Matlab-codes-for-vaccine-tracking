
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
