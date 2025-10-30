# Set the search paths to the libraries and the HDL files
# Remember that "." means your current directory. Add more directories
# after the . if you like. 
set_db log_file log/genus.log
set_db cmd_file log/genus.cmd
set_db init_hdl_search_path {../../source} 
# top_module is defined in the command line with -execute "set top_module <module_name>"

read_libs ${target_library}
# check_library -lib_cell [get_lib_cells]

read_hdl [glob ../../source/*v]

elaborate $top_module

read_sdc ../scripts/${top_module}.sdc

read_power_intent ../scripts/upf
apply_power_intent
commit_power_intent

set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

report timing > report/${top_module}_timing.rep
report gates  > report/${top_module}_cell.rep
report power  > report/${top_module}_power.rep

write_netlist -mapped >  output/${top_module}_syn.v
write_netlist -pg -mapped >  output/${top_module}_pg_syn.v
write_sdf > output/${top_module}_syn.sdf
write_sdc >  output/${top_module}_syn.sdc

exit