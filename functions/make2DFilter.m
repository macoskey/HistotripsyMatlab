function filt2D = make2DFilter(inFilt,f)
%% Makes 2D filter from 1D filter for filtering 2D signals/images
% J. Macoskey 
% 2017
%
% Inputs:
% inFilt = 1D input filter that you want to turn into a 2D filter.
%               You can use gaussBPF.m (for example) to make a 1D filter
% f      = your freq. vector, e.g., [-N/2:N/2-1]./N*sample_frequency
%
% Output:
% filt2D = the 2D version of the input filter



l = length(inFilt);
if l > 1000
    rate = round(l/1000);
    inFilt = decimate(inFilt,rate);
    fd = decimate(f,rate);
    dcheck = 1;
    l = length(inFilt);
else
    dcheck = 0;
end

shiftFilter = fftshift(inFilt);
x = linspace(-l/2,l/2,length(inFilt));
y = linspace(-l/2,l/2,length(inFilt));
[xx,yy] = meshgrid(x,y);
F2 = zeros(size(xx));
for i = 1:length(xx)
    for j = 1:length(yy)
        r(i,j) = round(sqrt(xx(i,j).^2+yy(i,j).^2))+1;
        F2(i,j) = shiftFilter(r(i,j));
    end
end

% This part needs to be fixed:
if dcheck
    % interpolate
    filt2D = F2;
else
    filt2D = F2;
end

end