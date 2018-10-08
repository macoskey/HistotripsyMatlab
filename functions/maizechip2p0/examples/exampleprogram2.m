% circular scan pattern sample program
% for MaizeChip 350 kHz array
% Jan 21, 2014 TLH

% define delay set here:
nfl = 8;            % number of focal locations
nc = 32;            % the system stores data for 32 channels, but this array only uses 1:20
cp = 100e-9;        % 100 MHz master clock: base period is 100 ns
timedelay = 10e-6;  % 10 usec

% change phasedata to represent the real delays
phasedata = timedelay/cp*ones(nfl,nc);

% charge times must be less than or equal to phases
charge = 5e-6;      % 5 usec
chargetimes = charge/cp*ones(nfl,nc);

%****************************************
%% load phase and amplitude data to FPGA
b_stop_execution;   % stop any program that might be running

% write the phase data in data memory locations 1:nfl
for i = 1:nfl
    b_set_chipmem_wloc(i)
    write_array_pattern(phasedata(i,:))
end

% write the amplitude data in data memory locations 100+(1:nfl)
for i = 1:nfl
    b_set_chipmem_wloc(i+100)
    write_array_pattern(chargetimes(i,:))
end

%****************************************
%% write the program to FPGA
b_set_imem_wloc(0);         % start at instruction memory location 0

% in this example will only set the amplitude once and keep it the same for
% all focal locations
a_loadincr_chipmem(1,101)       % data memory location 101
a_set_amp(0)

trigwidth = 2e-6;   % width of trigger signal
gaptime = 20e-6;    % pause between focal locations
numcircs = 10;      % number of repetitions of the scan pattern

a_set_LEDs(1)       % turn on red LED

a_start_loop(1,50)                          % outermost loop
    a_start_loop(2,numcircs)                % circle loop
        a_loadincr_chipmem(1,1)             % load first focus
        a_set_phase(0)                      % load that data as delays
        a_set_trig(2)                       % set trigger 2 high
            a_waitsec(trigwidth)            % pause
        a_set_trig(0)                       % set trigger low
        a_start_loop(3,nfl)                 % innermost loop
            a_fire(0)                       % fire output
            a_set_trig(1)                   % set trigger 1 high
                a_waitsec(trigwidth)        % pause
            a_set_trig(0)                   % set trigger low
            a_waitsec(gaptime-trigwidth)    % pause between focal locations
            a_loadincr_chipmem(0,1)         % increment to next delay set (focal location)
            a_set_phase(0)                  % load that data as delays
        a_end_loop(3)                       % end inner loop
    a_end_loop(2)                           % end middle loop
    a_waitsec(1)                            % wait one second
a_end_loop(1)                               % end outer loop

a_set_LEDs(0)       % turn off LED
a_halt              % end of program


%****************************************
%% run the program
b_execute_program(0)


