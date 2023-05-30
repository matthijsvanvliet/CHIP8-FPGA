-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue May 30 15:17:15 2023
-- Host        : LAPTOP-IT23Q15D running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/git/git
--               repositories/CHIP8-FPGA/Vivado/Keypad_Test/Keypad_Test.sim/sim_1/impl/func/xsim/top_func_impl.vhd}
-- Design      : top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity keypad is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    LED4_OBUF : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    i_keypad_col4_IBUF : in STD_LOGIC;
    i_keypad_col3_IBUF : in STD_LOGIC;
    i_keypad_col2_IBUF : in STD_LOGIC;
    i_keypad_col1_IBUF : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
end keypad;

architecture STRUCTURE of keypad is
  signal LED4_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal LED4_OBUF_inst_i_3_n_0 : STD_LOGIC;
  signal LED4_OBUF_inst_i_4_n_0 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal column : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal data0 : STD_LOGIC;
  signal \key[0]_i_2_n_0\ : STD_LOGIC;
  signal \key[0]_i_3_n_0\ : STD_LOGIC;
  signal \key[0]_i_4_n_0\ : STD_LOGIC;
  signal \key[1]_i_2_n_0\ : STD_LOGIC;
  signal \key[1]_i_3_n_0\ : STD_LOGIC;
  signal \key[2]_i_2_n_0\ : STD_LOGIC;
  signal keys1 : STD_LOGIC;
  signal \keys[11]_i_1_n_0\ : STD_LOGIC;
  signal \keys[12]_i_1_n_0\ : STD_LOGIC;
  signal \keys[13]_i_1_n_0\ : STD_LOGIC;
  signal \keys[14]_i_1_n_0\ : STD_LOGIC;
  signal \keys[15]_i_1_n_0\ : STD_LOGIC;
  signal \keys[3]_i_1_n_0\ : STD_LOGIC;
  signal \keys[7]_i_1_n_0\ : STD_LOGIC;
  signal \keys_reg_n_0_[0]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal sel0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  attribute \PinAttr:I0:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I0:HOLD_DETOUR\ of \column[0]_i_1\ : label is 193;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \column[0]_i_1\ : label is "soft_lutpair3";
  attribute \PinAttr:I0:HOLD_DETOUR\ of \column[1]_i_1\ : label is 193;
  attribute SOFT_HLUTNM of \column[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \key[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \key[3]_i_1\ : label is "soft_lutpair0";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
LED4_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => sel0(7),
      I1 => sel0(6),
      I2 => LED4_OBUF_inst_i_2_n_0,
      I3 => LED4_OBUF_inst_i_3_n_0,
      I4 => LED4_OBUF_inst_i_4_n_0,
      O => LED4_OBUF
    );
LED4_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => sel0(10),
      I1 => sel0(11),
      I2 => sel0(13),
      I3 => sel0(12),
      I4 => sel0(8),
      I5 => sel0(9),
      O => LED4_OBUF_inst_i_2_n_0
    );
LED4_OBUF_inst_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(0),
      I2 => \keys_reg_n_0_[0]\,
      I3 => data0,
      O => LED4_OBUF_inst_i_3_n_0
    );
LED4_OBUF_inst_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(3),
      I2 => sel0(5),
      I3 => sel0(4),
      O => LED4_OBUF_inst_i_4_n_0
    );
\column[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => column(0),
      O => p_0_in(0)
    );
\column[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => column(0),
      I1 => column(1),
      O => p_0_in(1)
    );
\column_pins_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(3),
      Q => \^q\(0),
      R => '0'
    );
\column_pins_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(0),
      Q => \^q\(1),
      R => '0'
    );
\column_pins_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(1),
      Q => \^q\(2),
      R => '0'
    );
\column_pins_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(2),
      Q => \^q\(3),
      R => '0'
    );
\column_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => p_0_in(0),
      Q => column(0),
      R => '0'
    );
\column_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => p_0_in(1),
      Q => column(1),
      R => '0'
    );
\key[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF00FFFFFF0D"
    )
        port map (
      I0 => \key[0]_i_2_n_0\,
      I1 => \key[0]_i_3_n_0\,
      I2 => sel0(6),
      I3 => \key[0]_i_4_n_0\,
      I4 => sel0(7),
      I5 => LED4_OBUF_inst_i_2_n_0,
      O => D(0)
    );
\key[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFEFEFEFFFEFF"
    )
        port map (
      I0 => sel0(3),
      I1 => sel0(2),
      I2 => sel0(4),
      I3 => sel0(1),
      I4 => sel0(0),
      I5 => data0,
      O => \key[0]_i_2_n_0\
    );
\key[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => sel0(5),
      I1 => sel0(4),
      I2 => sel0(3),
      O => \key[0]_i_3_n_0\
    );
\key[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF00F4"
    )
        port map (
      I0 => sel0(10),
      I1 => sel0(9),
      I2 => sel0(11),
      I3 => sel0(12),
      I4 => sel0(13),
      O => \key[0]_i_4_n_0\
    );
\key[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \key[1]_i_2_n_0\,
      I1 => \key[1]_i_3_n_0\,
      I2 => LED4_OBUF_inst_i_2_n_0,
      I3 => sel0(6),
      I4 => sel0(7),
      O => D(1)
    );
\key[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEEEEEFFFE"
    )
        port map (
      I0 => sel0(12),
      I1 => sel0(13),
      I2 => sel0(9),
      I3 => sel0(8),
      I4 => sel0(10),
      I5 => sel0(11),
      O => \key[1]_i_2_n_0\
    );
\key[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1111111111110001"
    )
        port map (
      I0 => sel0(5),
      I1 => sel0(4),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => sel0(3),
      I5 => sel0(2),
      O => \key[1]_i_3_n_0\
    );
\key[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF00FF00FF01"
    )
        port map (
      I0 => LED4_OBUF_inst_i_4_n_0,
      I1 => sel0(9),
      I2 => sel0(8),
      I3 => \key[2]_i_2_n_0\,
      I4 => sel0(6),
      I5 => sel0(7),
      O => D(2)
    );
\key[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => sel0(12),
      I1 => sel0(13),
      I2 => sel0(11),
      I3 => sel0(10),
      O => \key[2]_i_2_n_0\
    );
\key[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => sel0(7),
      I1 => sel0(6),
      I2 => LED4_OBUF_inst_i_2_n_0,
      O => D(3)
    );
\keys[11]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_keypad_col2_IBUF,
      O => \keys[11]_i_1_n_0\
    );
\keys[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => column(1),
      I1 => column(0),
      O => \keys[12]_i_1_n_0\
    );
\keys[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => column(0),
      I1 => column(1),
      O => \keys[13]_i_1_n_0\
    );
\keys[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => column(1),
      I1 => column(0),
      O => \keys[14]_i_1_n_0\
    );
\keys[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => column(0),
      I1 => column(1),
      O => \keys[15]_i_1_n_0\
    );
\keys[15]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_keypad_col1_IBUF,
      O => keys1
    );
\keys[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_keypad_col4_IBUF,
      O => \keys[3]_i_1_n_0\
    );
\keys[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_keypad_col3_IBUF,
      O => \keys[7]_i_1_n_0\
    );
\keys_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[12]_i_1_n_0\,
      D => \keys[3]_i_1_n_0\,
      Q => \keys_reg_n_0_[0]\,
      R => '0'
    );
\keys_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[14]_i_1_n_0\,
      D => \keys[11]_i_1_n_0\,
      Q => sel0(8),
      R => '0'
    );
\keys_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[15]_i_1_n_0\,
      D => \keys[11]_i_1_n_0\,
      Q => sel0(9),
      R => '0'
    );
\keys_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[12]_i_1_n_0\,
      D => keys1,
      Q => sel0(10),
      R => '0'
    );
\keys_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[13]_i_1_n_0\,
      D => keys1,
      Q => sel0(11),
      R => '0'
    );
\keys_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[14]_i_1_n_0\,
      D => keys1,
      Q => sel0(12),
      R => '0'
    );
\keys_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[15]_i_1_n_0\,
      D => keys1,
      Q => sel0(13),
      R => '0'
    );
\keys_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[13]_i_1_n_0\,
      D => \keys[3]_i_1_n_0\,
      Q => data0,
      R => '0'
    );
\keys_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[14]_i_1_n_0\,
      D => \keys[3]_i_1_n_0\,
      Q => sel0(0),
      R => '0'
    );
\keys_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[15]_i_1_n_0\,
      D => \keys[3]_i_1_n_0\,
      Q => sel0(1),
      R => '0'
    );
\keys_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[12]_i_1_n_0\,
      D => \keys[7]_i_1_n_0\,
      Q => sel0(2),
      R => '0'
    );
\keys_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[13]_i_1_n_0\,
      D => \keys[7]_i_1_n_0\,
      Q => sel0(3),
      R => '0'
    );
\keys_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[14]_i_1_n_0\,
      D => \keys[7]_i_1_n_0\,
      Q => sel0(4),
      R => '0'
    );
\keys_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[15]_i_1_n_0\,
      D => \keys[7]_i_1_n_0\,
      Q => sel0(5),
      R => '0'
    );
\keys_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[12]_i_1_n_0\,
      D => \keys[11]_i_1_n_0\,
      Q => sel0(6),
      R => '0'
    );
\keys_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \keys[13]_i_1_n_0\,
      D => \keys[11]_i_1_n_0\,
      Q => sel0(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top is
  port (
    i_clock : in STD_LOGIC;
    i_keypad_col1 : in STD_LOGIC;
    i_keypad_col2 : in STD_LOGIC;
    i_keypad_col3 : in STD_LOGIC;
    i_keypad_col4 : in STD_LOGIC;
    o_keypad_row1 : out STD_LOGIC;
    o_keypad_row2 : out STD_LOGIC;
    o_keypad_row3 : out STD_LOGIC;
    o_keypad_row4 : out STD_LOGIC;
    o_led1 : out STD_LOGIC;
    o_led2 : out STD_LOGIC;
    o_led3 : out STD_LOGIC;
    o_led4 : out STD_LOGIC;
    LED4 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of top : entity is "3839c70b";
end top;

architecture STRUCTURE of top is
  signal LED4_OBUF : STD_LOGIC;
  signal i_clock_IBUF : STD_LOGIC;
  signal i_clock_IBUF_BUFG : STD_LOGIC;
  signal i_keypad_col1_IBUF : STD_LOGIC;
  signal i_keypad_col2_IBUF : STD_LOGIC;
  signal i_keypad_col3_IBUF : STD_LOGIC;
  signal i_keypad_col4_IBUF : STD_LOGIC;
  signal k_n_5 : STD_LOGIC;
  signal k_n_6 : STD_LOGIC;
  signal k_n_7 : STD_LOGIC;
  signal k_n_8 : STD_LOGIC;
  signal o_keypad_row1_OBUF : STD_LOGIC;
  signal o_keypad_row2_OBUF : STD_LOGIC;
  signal o_keypad_row3_OBUF : STD_LOGIC;
  signal o_keypad_row4_OBUF : STD_LOGIC;
  signal o_led1_OBUF : STD_LOGIC;
  signal o_led2_OBUF : STD_LOGIC;
  signal o_led3_OBUF : STD_LOGIC;
  signal o_led4_OBUF : STD_LOGIC;
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
LED4_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => LED4_OBUF,
      O => LED4
    );
i_clock_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_clock_IBUF,
      O => i_clock_IBUF_BUFG
    );
i_clock_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_clock,
      O => i_clock_IBUF
    );
i_keypad_col1_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_keypad_col1,
      O => i_keypad_col1_IBUF
    );
i_keypad_col2_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_keypad_col2,
      O => i_keypad_col2_IBUF
    );
i_keypad_col3_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_keypad_col3,
      O => i_keypad_col3_IBUF
    );
i_keypad_col4_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_keypad_col4,
      O => i_keypad_col4_IBUF
    );
k: entity work.keypad
     port map (
      CLK => i_clock_IBUF_BUFG,
      D(3) => k_n_5,
      D(2) => k_n_6,
      D(1) => k_n_7,
      D(0) => k_n_8,
      LED4_OBUF => LED4_OBUF,
      Q(3) => o_keypad_row4_OBUF,
      Q(2) => o_keypad_row3_OBUF,
      Q(1) => o_keypad_row2_OBUF,
      Q(0) => o_keypad_row1_OBUF,
      i_keypad_col1_IBUF => i_keypad_col1_IBUF,
      i_keypad_col2_IBUF => i_keypad_col2_IBUF,
      i_keypad_col3_IBUF => i_keypad_col3_IBUF,
      i_keypad_col4_IBUF => i_keypad_col4_IBUF
    );
\key_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clock_IBUF_BUFG,
      CE => '1',
      D => k_n_8,
      Q => o_led4_OBUF,
      R => '0'
    );
\key_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clock_IBUF_BUFG,
      CE => '1',
      D => k_n_7,
      Q => o_led3_OBUF,
      R => '0'
    );
\key_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clock_IBUF_BUFG,
      CE => '1',
      D => k_n_6,
      Q => o_led2_OBUF,
      R => '0'
    );
\key_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clock_IBUF_BUFG,
      CE => '1',
      D => k_n_5,
      Q => o_led1_OBUF,
      R => '0'
    );
o_keypad_row1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_keypad_row1_OBUF,
      O => o_keypad_row1
    );
o_keypad_row2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_keypad_row2_OBUF,
      O => o_keypad_row2
    );
o_keypad_row3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_keypad_row3_OBUF,
      O => o_keypad_row3
    );
o_keypad_row4_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_keypad_row4_OBUF,
      O => o_keypad_row4
    );
o_led1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_led1_OBUF,
      O => o_led1
    );
o_led2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_led2_OBUF,
      O => o_led2
    );
o_led3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_led3_OBUF,
      O => o_led3
    );
o_led4_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_led4_OBUF,
      O => o_led4
    );
end STRUCTURE;
