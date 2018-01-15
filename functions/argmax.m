function loc = argmax(data)
% Gives you the argmax, because typing in [~,a] = max(data) is just way too
% annoying to do all the time
%
% Jonathan Macoskey
% Created: 1.15.18
%
% Input:
%   data = data that you want to find the location of the maximum value
    [~,loc] = max(data);
end