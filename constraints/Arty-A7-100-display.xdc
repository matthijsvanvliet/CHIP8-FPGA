## Clock signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports i_clck]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports i_clck]

## ChipKit Outer Analog Header - as Digital I/O
set_property -dict {PACKAGE_PIN F5 IOSTANDARD LVCMOS33 PULLUP true } [get_ports o_oled_sda]
set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS33 PULLUP true } [get_ports o_oled_scl]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
