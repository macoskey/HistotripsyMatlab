function a_halt
%a_halt
%   Writes "a" command instruction to halt program execution
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
data = [0 0 0 0 1];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

