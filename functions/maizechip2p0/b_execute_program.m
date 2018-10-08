function b_execute_program(n)
%b_execute_program(n)
%   Sends "b" command instruction to start program execution
%   at line n of the instruction memory.
%   MaizeChip 1.0 Sept 2013 TLH
%   MaizeChip 2.0 Communications Aug 2016 JJM

global com
q = instrfind('Port',com);
if q.bytesAvailable
    junk = char(fread(q,q.bytesAvailable));
end

startcode = 170;
endcode = 85;
bcmd = 1;
data = [0 0 0 floor(n/256) rem(n,256)];
fprintf(com,[startcode bcmd data endcode]);
fprintf(com,[1 1 1 1 1 1 1 1]);

end

