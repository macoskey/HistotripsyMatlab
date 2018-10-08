function b_set_imem_wloc(n)
%b_set_imem_wloc(n)
%   Sends "b" command instruction to set instruction memory
%   write location to n.
%   n = 0..2047
%   MaizeChip 1.0 Sept 2013 TLH
%   MaizeChip 2.0 Communications Aug 2016 JJM

global com
q = instrfind('Port',com);
if q.bytesAvailable
    junk = char(fread(q,q.bytesAvailable));
end

startcode = 170;
endcode = 85;
bcmd = 4;
data = [0 0 0 floor(n/256) rem(n,256)];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

