% bare bones sample program
% Jan 27, 2014 TLH

chargetime = 500*ones(1,32);        % 5 us charge time for all channels

b_stop_execution;                   % stop any program that might be running
b_set_chipmem_wloc(25)              % specify location for charge data
write_array_pattern_16bit(chargetime)     % write charge time to memory

% here is the actual program:
%*********************
b_set_imem_wloc(0);                 % start at instruction memory location 0
a_loadincr_chipmem(1,25)            % data memory location 25
a_set_amp(0)                        % set charge times
a_set_phase(0)                      % also set delay
a_start_loop(1,5000)                % fire the output 5000 times
    a_fire(0)                       % fire output
    a_set_trig(1)                   % set trigger 1 high
        a_waitsec(10e-6)            % pause 10 usec
    a_set_trig(0)                   % set trigger low
    a_waitsec(10e-3)                % pause 10 msec -> 100 Hz
a_end_loop(1)                       % end loop
a_halt                              % stop at end of loop
%********************

b_execute_program(0)                % run the program

