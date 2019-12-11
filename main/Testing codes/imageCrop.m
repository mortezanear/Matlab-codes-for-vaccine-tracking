
% This code crops around the pattern and zooms into it to make the
% classification easier for the CNN


function J = imageCrop(I)

threshold = max(I(:)) / 4;
margin = 0.25;

[i, j] = find(I > threshold);
i0 = min(i);
i1 = max(i);
j0 = min(j);
j1 = max(j);

ic = round((i0 + i1) / 2);
jc = round((j0 + j1) / 2);
sz = 0.5 * (max(i1 - i0, j1 - j0) + 1);
sz = sz * (1 + margin);
sz = round(sz);

% Make sure the crop fits within image bounds (trim to the bounds).
imin = max(1, ic - sz);
jmin = max(1, jc - sz);
imax = min(ic + sz, size(I, 1));
jmax = min(jc + sz, size(I, 2));
szmin = min(imax - imin, jmax - jmin);
imax = imin + szmin;
jmax = jmin + szmin;

J = I(imin:imax, jmin:jmax, :);

end

% Copyright <2019> Massachusetts Institute of Technology
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
% 



