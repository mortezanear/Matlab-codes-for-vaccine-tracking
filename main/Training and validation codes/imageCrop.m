
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
