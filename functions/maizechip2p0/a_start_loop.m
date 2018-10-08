function a_start_loop(n,m)
%a_start_loop(n,m)
%   Writes "a" command instruction to begin loop n
%   to be ececuted m times.
%   n = 0..7
%   m = 1..16777215 (~16 million)
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
acmd = 2;
byte1 = bin2dec(strcat(dec2bin(n,3),dec2bin(acmd,4)));
q = dec2bin(m,24);
byte2 = bin2dec(q(17:24));
byte3 = bin2dec(q(9:16));
byte4 = bin2dec(q(1:8));
data = [0 byte4 byte3 byte2 byte1];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end
