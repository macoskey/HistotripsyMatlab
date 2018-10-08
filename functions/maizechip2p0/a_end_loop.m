function a_end_loop(n)
%a_end_loop(n)
%   Writes "a" command instruction to end loop n.
%   n = 0..7
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
acmd = 3;
byte1 = bin2dec(strcat(dec2bin(n,3),dec2bin(acmd,4)));
data = [0 0 0 0 byte1];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

