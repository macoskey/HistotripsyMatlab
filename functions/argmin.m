function loc = argmin(data)
% Gives you the armin, because typing in [~,a] = min(data) is just way too
% annoying to do all the time
%
% Jonathan Macoskey
% Created: 1.15.18
%
% Input:
%   data = data that you want to find the location of the minimum value
    [~,loc] = min(data);
end