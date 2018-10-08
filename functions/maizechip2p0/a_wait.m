function a_wait(n)
%a_wait(n)
%   Writes "a" command instruction to wait n clock cycles.
%   n = 1..2^28 (268435456 =~268 million)
%
%   assuming base 10 MHz clock
%   time = 700 ns + 100 ns*n
%     1 us: n = 3
%    10 us: n = 93
%   100 us: n = 993
%     1 ms: n = 9993
%      1 s: n = 10e6;
%   26.8 s: n = 2.68e8;
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
