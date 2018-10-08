function b_write_chipmem(n)
%b_write_chipmem(n)
%   Sends "b" command instruction to write data to on chip pattern memory
%   n = 4x8 bits ([n1 n2 n3 n4])
%   MaizeChip 1.0 Sept 2013 TLH
%   MaizeChip 2.0 Communications Aug 2016 JJM

global com
q = instrfind('Port',com);
if q.bytesAvailable
    junk = char(fread(q,q.bytesAvailable));
end

startcode = 170;
endcode = 85;
bcmd = 7;
data = [0 n(4) n(3) n(2) n(1)];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

