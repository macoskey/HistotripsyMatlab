function a_fire(n)
%a_fire(n)
%   Writes "a" command instruction to fire ultrasound output.
%   n = 0: fire single burst
%   n = 1: fire multicycle burst
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
data = [0 0 0 n 8];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

