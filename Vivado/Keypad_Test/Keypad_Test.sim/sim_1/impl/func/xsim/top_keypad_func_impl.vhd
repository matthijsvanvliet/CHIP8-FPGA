-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue May 30 12:39:46 2023
-- Host        : LAPTOP-IT23Q15D running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/git/git
--               repositories/CHIP8-FPGA/Vivado/Keypad_Test/Keypad_Test.sim/sim_1/impl/func/xsim/top_keypad_func_impl.vhd}
-- Design      : top_keypad
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_keypad is
  port (
    i_clock : in STD_LOGIC;
    i_keypad_col1 : in STD_LOGIC;
    i_keypad_col2 : in STD_LOGIC;
    i_keypad_col3 : in STD_LOGIC;
    i_keypad_col4 : in STD_LOGIC;
    o_keypad_row1 : inout STD_LOGIC;
    o_keypad_row2 : inout STD_LOGIC;
    o_keypad_row3 : inout STD_LOGIC;
    o_keypad_row4 : inout STD_LOGIC;
    o_led1 : out STD_LOGIC;
    o_led2 : out STD_LOGIC;
    o_led3 : out STD_LOGIC;
    o_led4 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_keypad : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of top_keypad : entity is "d8386acc";
end top_keypad;

architecture STRUCTURE of top_keypad is
begin
pullup_o_keypad_row1inst: unisim.vcomponents.PULLUP
    port map (
      O => o_keypad_row1
    );
pullup_o_keypad_row2inst: unisim.vcomponents.PULLUP
    port map (
      O => o_keypad_row2
    );
pullup_o_keypad_row3inst: unisim.vcomponents.PULLUP
    port map (
      O => o_keypad_row3
    );
pullup_o_keypad_row4inst: unisim.vcomponents.PULLUP
    port map (
      O => o_keypad_row4
    );
o_led1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_led1
    );
o_led2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_led2
    );
o_led3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_led3
    );
o_led4_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_led4
    );
end STRUCTURE;
