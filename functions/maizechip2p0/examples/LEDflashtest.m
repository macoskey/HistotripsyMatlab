% LED test program
% This just flashes LEDs to show you that
% the system is working correctly.
%


wt = 10e6;
b_stop_execution
b_set_imem_wloc(0)
a_start_loop(2,100) % do this whole set 100 times
    a_start_loop(1,1)       % red LED flashes once
      a_set_LEDs(1)
       a_wait(wt)
        a_set_LEDs(0)
       a_wait(wt)
    a_end_loop(1)
    a_start_loop(1,2)       % yellow LED twice
        a_set_LEDs(2)
        a_wait(wt)
        a_set_LEDs(0)
        a_wait(wt)
    a_end_loop(1)
    a_start_loop(1,3)       % green LED three times
      a_set_LEDs(4)
      a_wait(wt)
      a_set_LEDs(0)
      a_wait(wt)
    a_end_loop(1)
    a_start_loop(1,4)       % blue LED four times
        a_set_LEDs(8)
        a_wait(wt)
        a_set_LEDs(0)
        a_wait(wt)
    a_end_loop(1)
    a_end_loop(2) % end the main loop #2
a_halt

b_execute_program(0)
