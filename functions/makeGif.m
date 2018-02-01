function makeGif(imdata,filename,cmap,clims,extension,path)
% Makes a gif from a series of 2D images
% 
% Jonathan Macoskey
% Created: 2.1.18
% Inspired by code from MathWorks Support Team:
% https://www.mathworks.com/matlabcentral/answers/94495-how-can-i-create-animated-gif-images-in-matlab

%
% Inputs:
%   imdata      = image data (N,M,nframes)
%   filename    = name of file (no need to add extension)
%   path        = path where you'd like to save (optional)

if nargin < 4
    cmap = 'gray';
end

if nargin < 5
    extension = 'gif';
end

if nargin < 6
    path = '';
end

file = [path,filename,'.',extension];
N = size(imdata,1);
M = size(imdata,2);
nframes = size(imdata,3);
imdata = double(imdata);

% h = figure;
imagesc(imdata(:,:,1)), axis equal tight, colormap(cmap)
caxis(clims)
set(gca,'nextplot','replacechildren','Visible','off')
f = getframe;
[im,map] = rgb2ind(f.cdata,512,'nodither');
im(1,1,1,nframes) = 0;
for n = 1:nframes
    fprintf('analyzing frame %.0f/%.0f\n',n,nframes)
    imagesc(imdata(:,:,n))
    caxis(clims)
    f = getframe;
    im(:,:,1,n) = rgb2ind(f.cdata,map,'nodither');
end

imwrite(im,map,file,'DelayTime',0,'LoopCount',inf)

end