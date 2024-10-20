# Create a new Vivado project
create_project Lab4ProjectDirectory ./Lab4ProjectDirectory -part xc7k70tfbv676-1

# Add source files to the project
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/ALU_1bit.v"
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/ALU_32bit.v"
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/nbit_dff.v"
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/ALU_32bit_DFF.v"
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/nbit_FA_str.v"
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/nbit_not.v"
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/MUX_Prelab.v"
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/nbit_FA_dff.v"
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/nbit_FA_Verif.v"
add_files -fileset sources_1 "./Lab4ProjectDirectory.srcs/sources_1/new/MUX_Prelab_verif.v"

# Add simulation files to the project
add_files -fileset sim_1 "./Lab4ProjectDirectory.srcs/sim_1/new/ALU_1bit_TB.v"
add_files -fileset sim_1 "./Lab4ProjectDirectory.srcs/sim_1/new/ALU_32bit_TB.v"
add_files -fileset sim_1 "./Lab4ProjectDirectory.srcs/sim_1/new/ALU_32bit_DFF_TB.v"
add_files -fileset sim_1 "./Lab4ProjectDirectory.srcs/sim_1/new/MUX_Prelab_TB.v"
add_files -fileset sim_1 "./Lab4ProjectDirectory.srcs/sim_1/new/TEST_TB.v"
add_files -fileset sim_1 "./Lab4ProjectDirectory.srcs/sim_1/new/nbit_FA_dff_TB.v"

# Add any constraint files if present
# Uncomment and modify the path if there are any constraint files
# add_files -fileset constrs_1 "./Lab4ProjectDirectory.srcs/constrs_1/new/constraints.xdc"

# Set the top module for synthesis
set_property top "ALU_32bit_DFF" [get_filesets sources_1]

# Set the top module for simulation
set_property top "dff_tb" [get_filesets sim_1]

# Optional: Save and close the project to ensure changes are persisted
close_project
