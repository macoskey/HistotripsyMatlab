% Awesome Filter Function
% Jonathan Macoskey, University of Michigan - Image-Guided Ultrasound Therapy Laboratory
% Created: 12/09/2016

% Inputs:
%   signal      = input signal to be filtered
%   wxLow       = low cutoff frequency for bandpass
%   wxHigh      = high cutoff frequency for bandpass
%   fs          = sampling frequency of signal
%   delay       = delay in acquired signal (optional)
%
% Outputs:
%   f           = frequency vector for Fourier domain
%   ftSig       = filtered signal in Fourier domain
%   filtSig     = filtered signal

function [f, ftSig, filtSig] = hilbFreqFilt(signal,wxLow,wxHigh,fs)

    % initiates
    signal = signal(:);
    N = length(signal);
    df = fs/N;
    f = (-fs/2:df:fs/2-df);
    
    % filtering parts
    rect  = @(t) double(and(abs(t) < wxHigh, abs(t) >= wxLow)); g = rect(f);
    ftSig = fftshift(fft(fftshift(signal))).*g;
    tSig  = fftshift(ifft(fftshift(ftSig)));
    
    % env with Hilbert txfrm
    filtSig = abs(hilbert(tSig));

end