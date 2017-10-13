function filt = gaussFilterHP(cf,gw,f,amp)
% Simple Gaussian high-pass filter function for filtering 
% 1D signals.
% J. Macoskey
% 8.7.17

% cf    = filter center frequency
% gw    = Gaussian width
% f     = input frequency vector that matches function to filter
% amp   = Gaussian amplitude (default is 1)

if nargin < 4
    amp = 1;
end

tmp = amp.*exp(-(f-cf).^2./(2.*gw.^2));
filt = tmp + fliplr(tmp);

end