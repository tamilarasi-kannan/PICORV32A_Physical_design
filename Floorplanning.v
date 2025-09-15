set PDK_PATH ./../ref 

create_lib -ref_lib $PDK_PATH/lib/ndm/saed32rvt_c.ndm PICO_PROJ 

read_verilog {./../DC/results/picorv32a.mapped.v} -library PICO_PROJ -design 

initialize_floorplan -core_utilization 0.6 -core_offset {3 3} 

set_individual_pin_constraints -ports [get_ports clk] -exclude_sides {2 3 4} 

place_pins -self 

create_placement -floorplan 

Save_block 

Save_lib
