function lightify(fignum,colors)
% The much anticipated counterpart to "darkify.m"
% Makes the figure nice (just not as nice as darkify)
% 
% Jonathan Macoskey
% Created: 2.2.18
% Last edited: 2.27.18
%
% Input:
%   figNum = number of the figure you want to darkify
%   colors = 1 or 0 - determines if you want to change line colors
%


COLORORDER = [0.0000    0.4470    0.7410;
              0.8500    0.3250    0.0980;
              0.9290    0.6940    0.1250;
              0.4940    0.1840    0.5560;
              0.4660    0.6740    0.1880;
              0.3010    0.7450    0.9330;
              0.6350    0.0780    0.1840];

figure(fignum)
set(fignum,'color',[1 1 1])
set(gca,'Color',[1 1 1])
l = get(gca,'Legend');
set(l,'Location','best')
set(l,'Color','w')
set(l,'TextColor',[0 0 0]);

t = get(gca,'Title');
t.Color = 'black';

grid on
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
set(gca,'XColor','k')
set(gca,'YColor','k')
set(gca,'ZColor','k')
set(gca,'GridColor','k')

if(colors)
    hline = findobj(gcf,'type','line');
    for n = 1:length(hline)
        set(hline(n),'LineWidth',2.0)
        try
            set(hline(n),'Color',COLORORDER(mod(n,size(COLORORDER,1)),:));
        catch
            set(hline(n),'Color',COLORORDER(size(COLORORDER,1),:));
        end
    end
end
end