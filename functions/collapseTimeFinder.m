function ct = collapseTimeFinder(t,fs,path,sampleVec,npulses,svdOption,filterProps)
% collapseTimeFinder is a custom function built to allow for easier
% processing of the cavitation collapse time data for ACE-CT monitoring for
% histotripsy therapy during preliminary research studies.
%
% INPUTS:
%   t           = time vector
%   fs          = sampling frequency
%   path        = filepath to data
%   sampleVec   = vector of sample ID numbers
%   npulses     = number of pulses in the treatment
%   svdOption   = rank for svd background subtraction. Setting = 0 turns
%                   off this option (OPTIONAL)
%   filterProps = input values for gaussFilter() (OPTIONAL)
%
% OUTPUTS:
%   ct          = collapse time measurements (relative to expansion signal)
%
%
% University of Michigan - Image-Guided Ultrasound Therapy Laboratory
% J. Macoskey - 10.12.17

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% THIS FUNCTION IS CURRENTLY ALMOST COMPLETE %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 6
    filterProps = [6e6,1e6,1];
    svdOption = 0;
end

if nargin < 7
    filterProps = [6e6,1e6,1];
end

ct = zeros(npulses,length(sampleVec)); % collapse time output array
cnt = 1;
N = length(t);
f = [-N/2:N/2-1]./N.*fs;
for nf = sampleVec % loops through all treatments/samples
    eval(sprintf('files = dir([path,''\\*%.1d*.mat'']);',nf))
    for nx = 1:npulses % loops through all pulses within each treatment
        tmp = load([files(nx).folder,'\',files(nx).name]);
        data = tmp.C; % need to make this more robust
        
        %%% Here begins the core of the data analysis %%%
        ftData = fftshift(fft(data));
        filt = gaussFilter(... % builds custom Gaussian-shaped filter
            filterProps(1),...
            filterProps(2),...
            f,...
            filterProps(3))';
        ftDataFilt = ftData.*filt;
        iftData = real(ifft(fftshift(ftDataFilt)));
        pltData = iftData./max(iftData);
        
        % optional SVD-based background subtraction. Good for really noisy
        % signals
        if svdOption
            [u,s,v] = svds(pltData,svdOption);
            dsvd = u(:,1:r)*s(1:r,1:r)*v(:,1:r)';
            outData = pltData - dsvd;
        else
            outData = pltData;
        end
       
        % next two lines need some serious robustness work
        g1 = max(find(abs(t - 100) < 0.05));
        g2 = max(find(abs(t - 250) < 0.05));
        
        [~,u] = max(outData(g1:g2));
        tu = t(u+g1);
        
        try % im not sure if this works yet
            [~,ACEeIdx] = max(outData);
            ACEeTime = t(ACEeIdx);
            ct(nx,cnt) = tu - ACEeTime;
        catch
            ct(nx,cnt) = tu;
        end
        
    end
    cnt = cnt + 1;
end