function b_select_motherboard(n)
%b_select_motherboard(n)
%   Sends "b" command instruction to specify the
%   target motherboard for subsequent pattern memory
%   and mask commands.
%   
%   n = 0..256
%   MaizeChip 1.0 Sept 2013 TLH
%   MaizeChip 2.0 Communications Aug 2016 JJM

global com
q = instrfind('Port',com);
if q.bytesAvailable
    junk = char(fread(q,q.bytesAvailable));
end

startcode = 170;
endcode = 85;
bcmd = 10;
data = [0 0 0 0 rem(n,256)];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

