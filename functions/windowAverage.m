function dataout = windowAverage(varargin)
% (c) Jonathan Macoskey, University of Michigan, August 19, 2016
% Takes input signal and applys a running window average
%
% Inputs:
%   1 - input data (two-dimensional max for proper function)
%   2 - window size (must evenly divide the input signal)
%   3 - 'same' (optional): write same if you want to have the signal
%       upsampled to match the original signal length
% 
% Output:
%   dataout = output data

    switch (nargin)
        case 2
            data = varargin{1};
            if size(data,3) > 1
                error('windowAverage - inputDataMustBeTwoDimensional')
            end
            window_size = varargin{2};
%             try
                count = 1;
                dataout = zeros(size(data,1),size(data,2)/window_size);
                for n = 1:size(data,2)/window_size
                    dataout(:,n) = sum(data(:,[count:count+window_size-1]),2)./window_size;
                    count = count + window_size;
                end
%             catch
%                 error('windowAverage - windowSizeNotCompatibleWithDataSize')
%             end
        case 3
            data = varargin{1};
            window_size = varargin{2};
            if strcmp(varargin{3},'same')
                try
                    count = 1;
                    dataout = zeros(size(data,1),size(data,2)/window_size);
                    for n = 1:size(data,2)/window_size
                        dataout(:,n) = sum(data(:,[count:count+window_size-1]),2)./window_size;
                        count = count + window_size;
                    end
                    dataout = upsample(dataout',window_size)';
                catch
                    error('windowAverage - windowSizeNotCompatibleWithDataSize')
                end
            elseif strcmp(varargin{3},'moving')
                dataout = tsmovavg(data,'s',window_size,1);
            else
                error('windowAverage - undefinedInput3')
            end
    end
end