function makeMovie(imdata,filename,fr,cmap,clims,path)
% Makes a movie (.avi) from a series of 2D images
%
% Jonathan Macoskey
% Created: 2.1.18
% Edited: 3.23.18
%
% Inputs:
%   imdata      = image data (N,M,nframes)
%   filename    = name of file (no need to add extension)
%   fr          = frame rate
%   cmap        = colormap (default = gray)
%   clims       = colormap lims
%   path        = path where you'd like to save (optional)
%   

if nargin < 2
    filename = 'default_movie_filename';
end

if nargin < 3
    fr = 1/30;
end

if nargin < 4
    cmap = 'gray';
end

if nargin < 5
    clims = [];
end

if nargin < 6
    path = '';
end

N = size(imdata,1);
M = size(imdata,2);
nframes = size(imdata,3);
imdata = double(imdata);

writerObj = VideoWriter([filename,'.avi']);
writerObj.FrameRate = fr;
writerObj.Quality = 100;

open(writerObj)
for u = 1:nframes
    fprintf('analyzing frame %.0f/%.0f\n',u,nframes)
    imdata_colored = (mat2gray(imdata(:,:,u)) + 1).*length(gray);
    frame = im2frame(imdata_colored,gray(256));
    writeVideo(writerObj,frame)
end
close(writerObj)


end