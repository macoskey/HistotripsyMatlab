function maize_init(com_number)
%maize_init)
%   Initializes USB communications with FPGA.
%   com_number = number of virtual com port used
%   MaizeChip 2.0 Aug 2016 JJM

disp(['Initializing with COM port ',num2str(com_number),'...'])

% clear any old connections on com port of interest
global com; com = ['COM',num2str(com_number)];
q = instrfind('Port',com);
if ~isempty(q)
    fclose(instrfind('Port',com))
    delete(instrfind('Port',com))
end

% setup port
maize = serial(com,'BaudRate',9600);
fopen(maize)


pause(0.1)
disp('Initialization complete.')
end