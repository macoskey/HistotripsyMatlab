function [t,f] = maketf(data,clk)
% Generates time and frequency vectors for data based on their clock
% 
% Jonathan Macoskey
% Created: 1.29.18
%
% Input:
%   data = obvious
%   clk  = your sampling frequency in Hz
%
% Outputs:
%   t   = time vector
%   f   = frequency vector

    N = max(size(data));
    t = [0:N-1]./clk;
    f = [-N/2:N/2-1]./N.*clk;
end