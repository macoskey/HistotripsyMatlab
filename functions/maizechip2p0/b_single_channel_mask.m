function b_single_channel_mask(n)
%b_single_channel_mask(n)
%   Sends "b" command instruction to mask out all channels except n.
%   All other channels will have no output.
%   Use b_mask_off to make all channels active again.
%
%   MaizeChip 1.0 Sept 2013 TLH
%   MaizeChip 2.0 Communications Aug 2016 JJM

global com
q = instrfind('Port',com);
if q.bytesAvailable
    junk = char(fread(q,q.bytesAvailable));
end

p = dec2bin(0,32);
p(n) = '1';
q = fliplr(p);
startcode = 170;
endcode = 85;
bcmd = 13;
data = [0 bin2dec(q(1:8)) bin2dec(q(9:16)) bin2dec(q(17:24)) bin2dec(q(25:32))];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

