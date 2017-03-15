% conveniently make grayscale image with colorbar with just two characters!

function h = im(in)
h = imagesc(in);
colormap gray
colorbar
