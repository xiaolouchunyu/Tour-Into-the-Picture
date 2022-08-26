
im = im2single(imread('vordergrund2.jpg'));
%im = im2single(imread('../samples/water_small.jpg'));
patch_size = 21;
%figure(3), hold off, imagesc(im)
% position
x = [ceil(pos(1)),ceil(pos(1)+pos(3)),ceil(pos(1))+ceil(pos(3)),ceil(pos(1))]';
y = [ceil(pos(2)),ceil(pos(2)),ceil(pos(2)+pos(4)),ceil(pos(2)+pos(4))]';

%[x, y] = ginput; 
%Bild ausfüllen                                                             
target_mask = poly2mask(x, y, size(im, 1), size(im, 2)); 
hole_filling_crimnisi(im, target_mask, patch_size, 0.01, 'image');
