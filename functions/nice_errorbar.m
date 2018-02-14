function nice_errorbar(x,y,err)
% Makes a good looking errorbar figure without all the hard work
% 
% Jonathan Macoskey
% Created: 2.14.18
%
% Input:
%   x       = x values
%   y       = y values (usually mean)
%   errr    = error values (standard dev, e.g.)

e = errorbar(x,y,err);
e.LineStyle = 'none';
e.Color = 'k';
e.CapSize = 10;
e.Markersize = 10;

end