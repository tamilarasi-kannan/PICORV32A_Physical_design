create_clock -name clk -period 1.6 [get_ports clk]     
create_clock -name virtual_clk -period 1.6      
set_input_delay 0.64 -clock <virtual_clock>  [get_ports [all_inputs]]   
set_output_delay 0.64 -clock <virtual_clock>  [get_ports [all_outputs]]    
set_max_transition 0.16 [get_ports [all_inputs]]      
set_max_transition 0.16 [get_ports [all_outputs]]      
set_fanout_load 20 [all_outputs]        
set_max_capacitance 0.32        
set_clock_uncertainty 0.08 [get_ports clk]
