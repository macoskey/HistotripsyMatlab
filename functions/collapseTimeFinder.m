function ct = collapseTimeFinder(t,fs,path,sampleVec,npulses)
% collapseTimeFinder is a custom function built to allow for easier
% processing of the cavitation collapse time data for ACE-CT monitoring for
% histotripsy therapy.
%
% INPUTS:
%   t           = time vector
%   fs          = sampling frequency
%   path        = filepath to data
%   sampleVec   = vector of sample ID numbers
%   npulses     = number of pulses in the treatment
%   
% OUTPUTS:
%   ct          = collapse time measurements (relative to expansion signal)
%
%
% University of Michigan - Image-Guided Ultrasound Therapy Laboratory
% J. Macoskey - 10.12.17

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% THIS FUNCTION IS CURRENTLY INCOMPLETE %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ct = zeros(npulses,length(sampleVec));
cnt = 1;
N = length(t);
f = [-N/2:N/2-1]./N.*fs;
for nf = sampleVec
    eval(sprintf('files = dir([path,''\\*%.1d*.mat'']);',nf))
    for nx = 1:npulses
       tmp = load([files(nx).folder,'\',files(nx).name]);
        
    end


end