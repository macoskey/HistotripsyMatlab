function b_set_mask(n)
%b_set_mask(n)
%   Sends "b" command instruction to specify a channel mask.
%   n represents the bit pattern for active and masked channels.
%   1 = channel active
%   0 = channel masked (off)
%   n = 32 bit binary string
%   MaizeChip 1.0 Sept 2013 TLH
%   MaizeChip 2.0 Communications Aug 2016 JJM

global com
q = instrfind('Port',com);
if q.bytesAvailable
    junk = char(fread(q,q.bytesAvailable));
end

q = fliplr(n);
startcode = 170;
endcode = 85;
bcmd = 13;
data = [0 bin2dec(q(1:8)) bin2dec(q(9:16)) bin2dec(q(17:24)) bin2dec(q(25:32))];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

