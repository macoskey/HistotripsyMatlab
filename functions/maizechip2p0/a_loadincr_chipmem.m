function a_loadincr_chipmem(n,m)
%a_loadincr_chipmem(n,m)
%   Writes "a" command instruction to specify or increment
%   on chip pattern memory location.
%   n = 0: increment on chip memory location by amount m
%   n = 1: set the on chip memory location to m
%   m = 0..2047
%
%   note: the memory is 2048 locations so incrementing beyond
%   2047 will cause the location to wrap back to 0
%
%   MaizeChip 1.0 Sept 2013 TLH
%   MaizeChip 2.0 Communications Aug 2016 JJM

global com
q = instrfind('Port',com);
if q.bytesAvailable
    junk = char(fread(q,q.bytesAvailable));
end

startcode = 170;
endcode = 85;
bcmd = 5;
acmd = 11;
byte1 = bin2dec(strcat(num2str(n),dec2bin(acmd,4)));
q = dec2bin(m,16);
byte2 = bin2dec(q(9:16));
byte3 = bin2dec(q(1:8));
byte4 = 0;
data = [0 byte4 byte3 byte2 byte1];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end
