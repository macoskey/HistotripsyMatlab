function write_array_pattern_16bit(data)
%write_array_pattern_16bit(data)
%   Sends appropriate commands to write a full set of pattern
%   information to maizechip FPGA program.
%
%   data is a 32 element vector of 16 bit numbers (0..65535)
%   representing either phase or amplitude information for a pattern.
%
%   For example, data(5) = 46;
%   This is 46 clock tics of phase delay or charge time for channel 5.
%
%   MaizeChip 1.0 Feb 2014 TLH

% reformat data for transmission...
bindata = dec2bin(data,16);
binsw = [bindata(:,9:16) bindata(:,1:8)];
bindatareshape = reshape(binsw',8,64)';
data16bit = (bin2dec(bindatareshape))';

% send in chunks two channels at a time...
for i = 1:16
    index = (i-1)*4+[1:4];
    b_write_chipmem(data16bit(index));
end

