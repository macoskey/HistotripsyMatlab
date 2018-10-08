function a_waitsec(t)
%a_waitsec(t)
%   Writes "a" command instruction to wait a specific time in seconds.
%   t = 0 to 2.68 seconds
%   assumes a 100 MHz clock, t is quantized and rounded to 10 ns steps.
%
%   MaizeChip 1.0 Sept 2013 TLH
%   MaizeChip 2.0 Communications Aug 2016 JJM

global com
q = instrfind('Port',com);
if q.bytesAvailable
    junk = char(fread(q,q.bytesAvailable));
end

n = round(t*100e6)-7;
% disp(n/1e8)
if n<0
    n = 0;
end

startcode = 170;
endcode = 85;
bcmd = 5;
acmd = 4;
bits = dec2bin(n,28);
byte1 = bin2dec(strcat(bits(25:28),dec2bin(acmd,4)));
byte2 = bin2dec(bits(17:24));
byte3 = bin2dec(bits(9:16));
byte4 = bin2dec(bits(1:8));
data = [0 byte4 byte3 byte2 byte1];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end
