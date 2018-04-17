function nice_errorbar(x,y,err,color,style)
% Makes a good looking errorbar figure without all the hard work
% 
% Jonathan Macoskey
% Created: 2.14.18
%
% Input:
%   x       = x values
%   y       = y values (usually mean)
%   errr    = error values (standard dev, e.g.)
if nargin < 5
    style = '-';
end

e = errorbar(x,y,err);
e.LineStyle = style;
e.LineWidth = 1.5;
e.Color = color;
e.CapSize = 8;
e.Marker = '.';
e.MarkerSize = 20;
grid on
set(gca,'FontSize',18)

end