function a_set_trig(x)
%a_set_trig(x)
%   Writes "a" command instruction to specify trigger code
%   defined by bit pattern x.
%   x = 0..255
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
acmd = 6;
data = [0 0 0 x acmd];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end
