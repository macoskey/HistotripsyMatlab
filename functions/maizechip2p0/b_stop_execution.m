function b_stop_execution
%b_stop_execution
%   Sends "b" command instruction to stop program execution
%   MaizeChip 1.0 Sept 2013 TLH
%   MaizeChip 2.0 Communications Aug 2016 JJM

global com
q = instrfind('Port',com);
if q.bytesAvailable
    junk = char(fread(q,q.bytesAvailable));
end

bdaddr = 0;
startcode = 170;
endcode = 85;
bcmd = 0;
data = [0 0 0 0 0];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

