function filt2D = make2DFilter(inputFilter,f)
%% Makes 2D filter from 1D filter for filtering 2D signals/images
% J. Macoskey

l = length(inputFilter);
if l > 1000
    rate = round(l/1000);
    inputFilter = decimate(inputFilter,rate);
    fd = decimate(f,rate);
    dcheck = 1;
    l = length(inputFilter);
else
    dcheck = 0;
end

shiftFilter = fftshift(inputFilter);
x = linspace(-l/2,l/2,length(inputFilter));
y = linspace(-l/2,l/2,length(inputFilter));
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