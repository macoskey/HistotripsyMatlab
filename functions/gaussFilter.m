function filt = gaussFilter(cf,gw,f,amp)
% Simple Gaussian filter function for filtering 1D signals.

% cf    = filter center frequency
% gw    = Gaussian width
% f     = input frequency vector that matches function to filter
% amp   = Gaussian amplitude (default is 1)

if varargin < 4
    amp = 1;
end

tmp = amp.*exp(-(f-cf).^2./(2.*gw.^2));
filt = tmp + filplr(tmp);

end