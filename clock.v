check_design -checks pre_clock_tree_stage 

synthesize_clock_tree 
 
set_app_options -name cts.optimize.enable_local_skew -value true cts.optimize.enable_local_skew true 

set_app_options -name cts.compile.enable_local_skew -value true cts.compile.enable_local_skew true 

set_app_options -name cts.compile.enable_global_route -value false cts.compile.enable_global_route false 

set_app_options -name clock_opt.flow.enable_ccd -value true clock_opt.flow.enable_ccd true 

clock_opt -to build_clock 
/* Satges in clock_opt : 
1. build_clock 
2. route_clock 
3. final_opto */ 

clock_opt -from -build_clock -to route_clock 

clock_opt -from -route_clock -to final_opto
