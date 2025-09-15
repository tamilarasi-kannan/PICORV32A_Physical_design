set mode1 "func" 

set corner1 "nom"nom 

set scenario1 "${mode1}::${corner1}" 

remove_modes -all; remove_corners -all; remove_scenarios -all 

create_mode $mode1 

create_corner $corner1 

create_scenario -name func::nom -mode func -corner nom 
 
source ./../CONSTRAINTS/picorv.sdc 

current_corner nom 
 
current_scenario func::nom 

set parasitic1 "p1" 

set tluplus_file$parasitic1 "$PDK_PATH/tech/star_rcxt/saed32nm_1p9m_Cmax.tluplus" ./../ref/tech/star_rcxt/saed32nm_1p9m_Cmax.tluplus 

set layer_map_file$parasitic1 "$PDK_PATH/tech/star_rcxt/saed32nm_tf_itf_tluplus.map" ./../ref/tech/star_rcxt/saed32nm_tf_itf_tluplus.map 

set parasitic2 "p2" 

set tluplus_file$parasitic2 "$PDK_PATH/tech/star_rcxt/saed32nm_1p9m_Cmin.tluplus" ./../ref/tech/star_rcxt/saed32nm_1p9m_Cmin.tluplus 

set layer_map_file$parasitic2 "$PDK_PATH/tech/star_rcxt/saed32nm_tf_itf_tluplus.map" ./../ref/tech/star_rcxt/saed32nm_tf_itf_tluplus.map 

read_parasitic_tech -tlup $tluplus_filep1 -layermap $layer_map_filep1 -name p1 
read_parasitic_tech -tlup $tluplus_filep2 -layermap $layer_map_filep2 -name p2 
set_parasitic_parameters -late_spec $parasitic1 -early_spec $parasitic2 
set_app_options -name place.coarse.continue_on_missing_scandef -value true place.coarse.continue_on_missing_scandef true 

place_pins -self 

place_opt 
/*Stages in Placement : 
1. Initial place 
2. Initial drc 
3. Initial opto 
4. Final place 
5. Final opto */

place_opt -from initial_place -to initial_place  
place_opt -from initial_drc -to initial_opto 
place_opt -from initial_opto -to final_place 
place_opt -from final_place -to final_opto 
 
legalize_placement  
