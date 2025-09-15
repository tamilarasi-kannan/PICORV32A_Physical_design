 check_design -checks pre_route_stage 
 
set_app_options -name route.global.timing_driven -value true route.global.timing_driven true 

set_app_options -name route.global.crosstalk_driven -value false route.global.crosstalk_driven false 

set_app_options -name route.track.timing_driven -value true route.track.timing_driven true 

set_app_options -name route.track.crosstalk_driven -value true route.track.crosstalk_driven true 

set_app_options -name route.detail.timing_driven -value true 

set_app_options -name route.detail.save_after_iterations -value false 

set_app_options -name route.detail.force_max_number_iterations -value false 

set_app_options -name route.detail.antenna -value true 

set_app_options -name route.detail.antenna_fixing_preference -value use_diodes 

set_app_options -name route.detail.diode_libcell_names -value */ANTENNA_RVT 

route_track

route_detail 

route_opt

write_verilog ./results/picorv32a.routed.v 

write_sdc -output ./results/picorv32a.routed.sdc 

write_parasitics -format spef -output ./results/picorv32a_${scenario1}.spef
