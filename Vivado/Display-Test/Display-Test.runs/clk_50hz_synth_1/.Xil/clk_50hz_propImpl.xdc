set_property SRC_FILE_INFO {cfile:d:/git/Overig/CHIP8-FPGA/Vivado/Display-Test/Display-Test.gen/sources_1/ip/clk_50hz/clk_50hz.xdc rfile:../../../Display-Test.gen/sources_1/ip/clk_50hz/clk_50hz.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports i_clck]] 0.100
