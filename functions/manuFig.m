% Saves figure as both png and fig without all the hassle
% J. Macoskey
% Created: 10.5.17
% Updated 4.30.18

% Save_option = 1: uses imwrite instead of saveas

function manuFig(fignum, name, path, save_option)
    if nargin < 4
        save_option = 0;
    else
        save_option = 0; % IMWRITE NEEDS A REWRITE
    end
    if ispc
        delim = '\';
    else
        delim = '/';
    end
    if path(end) == delim
        if save_option
            imwrite(fignum,[path,name,'.png'])
            saveas(fignum,[path,name,'.fig'])
        else
            saveas(fignum,[path,name,'.png'])
            saveas(fignum,[path,name,'.fig'])
        end
    else
        if save_option
            imwrite(fignum,[path,delim,name,'.png'])
            saveas(fignum,[path,delim,name,'.fig'])
        else
            saveas(fignum,[path,delim,name,'.png'])
            saveas(fignum,[path,delim,name,'.fig'])
        end
    end
end