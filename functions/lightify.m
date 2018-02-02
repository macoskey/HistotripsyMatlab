function lightify(fignum,colors)
% The much anticipated counterpart to "darkify.m"
% Makes the figure pretty (just not as pretty as darkify) without wasting a
% bunch of ink
% 
% Jonathan Macoskey
% Created: 2.2.18
% Last edited: 2.2.18
%
% Input:
%   figNum = number of the figure you want to darkify
%   colors = 1 or 0 - determines if you want to change line colors (not yet
%       supported)
%
% Note: if switching between this and darkify, use clf('reset') before you
% add anything to that figure to clear formatting. Update later will do
% this automatically.



figure(fignum),
l = get(gca,'Legend');
set(l,'Location','best')
grid on
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
hline = findobj(gcf,'type','line');
for n = 1:length(hline)
    set(hline(n),'LineWidth',1.5)
end


end