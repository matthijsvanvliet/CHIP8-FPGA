-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Thu Jun  1 22:40:30 2023
-- Host        : DESKTOP-MATTHIJS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/git/Overig/CHIP8-FPGA/Vivado/Display-Test/Display-Test.sim/sim_1/impl/func/xsim/display_tb_func_impl.vhd
-- Design      : display
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_master is
  port (
    w_BUSY : out STD_LOGIC;
    \FSM_sequential_r_SM_DISPLAY_reg[0]\ : out STD_LOGIC;
    \FSM_sequential_r_SM_DISPLAY_reg[0]_0\ : out STD_LOGIC;
    sel : out STD_LOGIC;
    busy_reg_0 : out STD_LOGIC;
    o_oled_sda_TRI : out STD_LOGIC;
    o_oled_scl_TRI : out STD_LOGIC;
    o_oled_sda_OBUF : out STD_LOGIC;
    i_clck_IBUF_BUFG : in STD_LOGIC;
    \FSM_sequential_r_SM_DISPLAY_reg[1]\ : in STD_LOGIC;
    \FSM_sequential_r_SM_DISPLAY_reg[1]_0\ : in STD_LOGIC;
    \r_SM_DISPLAY__0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \r_COM_COUNTER_reg[31]\ : in STD_LOGIC;
    \r_COM_COUNTER_reg[31]_0\ : in STD_LOGIC;
    \r_COM_COUNTER_reg[31]_1\ : in STD_LOGIC;
    \r_COM_COUNTER_reg[31]_2\ : in STD_LOGIC;
    r_PREV_BUSY : in STD_LOGIC;
    busy_reg_1 : in STD_LOGIC;
    data0 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end i2c_master;

architecture STRUCTURE of i2c_master is
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[4]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[8]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[8]\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_4_n_0\ : STD_LOGIC;
  signal addr_rw0 : STD_LOGIC;
  signal bit_cnt : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \bit_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal busy1 : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal busy_i_2_n_0 : STD_LOGIC;
  signal busy_i_3_n_0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count[0]_i_2_n_0\ : STD_LOGIC;
  signal \count[1]_i_2_n_0\ : STD_LOGIC;
  signal \count[1]_i_3_n_0\ : STD_LOGIC;
  signal \count[2]_i_2_n_0\ : STD_LOGIC;
  signal \count[2]_i_3_n_0\ : STD_LOGIC;
  signal \count[3]_i_2_n_0\ : STD_LOGIC;
  signal \count[3]_i_3_n_0\ : STD_LOGIC;
  signal \count[4]_i_2_n_0\ : STD_LOGIC;
  signal \count[4]_i_3_n_0\ : STD_LOGIC;
  signal \count[6]_i_2_n_0\ : STD_LOGIC;
  signal \count[7]_i_2_n_0\ : STD_LOGIC;
  signal \count[7]_i_3_n_0\ : STD_LOGIC;
  signal count_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data_clk : STD_LOGIC;
  signal data_clk_i_2_n_0 : STD_LOGIC;
  signal data_clk_prev : STD_LOGIC;
  signal data_clk_reg_n_0 : STD_LOGIC;
  signal data_tx : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_COM_COUNTER[0]_i_7_n_0\ : STD_LOGIC;
  signal scl_clk : STD_LOGIC;
  signal scl_clk_reg_n_0 : STD_LOGIC;
  signal scl_ena_i_1_n_0 : STD_LOGIC;
  signal scl_ena_reg_n_0 : STD_LOGIC;
  signal sda_int4_out : STD_LOGIC;
  signal sda_int_i_10_n_0 : STD_LOGIC;
  signal sda_int_i_11_n_0 : STD_LOGIC;
  signal sda_int_i_12_n_0 : STD_LOGIC;
  signal sda_int_i_13_n_0 : STD_LOGIC;
  signal sda_int_i_14_n_0 : STD_LOGIC;
  signal sda_int_i_1_n_0 : STD_LOGIC;
  signal sda_int_i_3_n_0 : STD_LOGIC;
  signal sda_int_i_4_n_0 : STD_LOGIC;
  signal sda_int_i_6_n_0 : STD_LOGIC;
  signal sda_int_i_7_n_0 : STD_LOGIC;
  signal sda_int_i_8_n_0 : STD_LOGIC;
  signal sda_int_i_9_n_0 : STD_LOGIC;
  signal sda_int_reg_i_2_n_0 : STD_LOGIC;
  signal sda_int_reg_n_0 : STD_LOGIC;
  signal stretch : STD_LOGIC;
  signal stretch_i_1_n_0 : STD_LOGIC;
  signal stretch_i_2_n_0 : STD_LOGIC;
  signal stretch_i_3_n_0 : STD_LOGIC;
  signal stretch_i_4_n_0 : STD_LOGIC;
  signal \^w_busy\ : STD_LOGIC;
  attribute \PinAttr:I2:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I2:HOLD_DETOUR\ of \FSM_onehot_state[0]_i_1\ : label is 191;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_1\ : label is "soft_lutpair7";
  attribute \PinAttr:I1:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I1:HOLD_DETOUR\ of \FSM_onehot_state[1]_i_1\ : label is 191;
  attribute SOFT_HLUTNM of \FSM_onehot_state[1]_i_1\ : label is "soft_lutpair7";
  attribute \PinAttr:I4:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I4:HOLD_DETOUR\ of \FSM_onehot_state[2]_i_1\ : label is 191;
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_1\ : label is "soft_lutpair2";
  attribute \PinAttr:I0:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I0:HOLD_DETOUR\ of \FSM_onehot_state[3]_i_1\ : label is 191;
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_1\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[4]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[5]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[8]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute \PinAttr:D:HOLD_DETOUR\ : integer;
  attribute \PinAttr:D:HOLD_DETOUR\ of \data_tx_reg[3]\ : label is 205;
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of stretch_i_1 : label is "RETARGET";
begin
  w_BUSY <= \^w_busy\;
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[8]\,
      I1 => busy_reg_1,
      I2 => \FSM_onehot_state_reg_n_0_[0]\,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => busy_reg_1,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEAAAA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => bit_cnt(2),
      I2 => bit_cnt(1),
      I3 => bit_cnt(0),
      I4 => \FSM_onehot_state_reg_n_0_[2]\,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => bit_cnt(0),
      I2 => bit_cnt(1),
      I3 => bit_cnt(2),
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_state[4]_i_2_n_0\,
      I2 => busy_reg_1,
      I3 => \FSM_onehot_state_reg_n_0_[5]\,
      I4 => \FSM_onehot_state_reg_n_0_[3]\,
      O => \FSM_onehot_state[4]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => bit_cnt(2),
      I1 => bit_cnt(1),
      I2 => bit_cnt(0),
      O => \FSM_onehot_state[4]_i_2_n_0\
    );
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => bit_cnt(0),
      I2 => bit_cnt(1),
      I3 => bit_cnt(2),
      O => \FSM_onehot_state[5]_i_1_n_0\
    );
\FSM_onehot_state[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_clk_reg_n_0,
      I1 => data_clk_prev,
      O => busy1
    );
\FSM_onehot_state[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => busy_reg_1,
      I1 => \FSM_onehot_state_reg_n_0_[5]\,
      O => \FSM_onehot_state[8]_i_2_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => busy1,
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[0]\,
      R => '0'
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => busy1,
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[1]\,
      R => '0'
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => busy1,
      D => \FSM_onehot_state[2]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[2]\,
      R => '0'
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => busy1,
      D => \FSM_onehot_state[3]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[3]\,
      R => '0'
    );
\FSM_onehot_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => busy1,
      D => \FSM_onehot_state[4]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[4]\,
      R => '0'
    );
\FSM_onehot_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => busy1,
      D => \FSM_onehot_state[5]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[5]\,
      R => '0'
    );
\FSM_onehot_state_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => busy1,
      D => \FSM_onehot_state[8]_i_2_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[8]\,
      R => '0'
    );
\FSM_sequential_r_SM_DISPLAY[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F00FE0FFF00FE0"
    )
        port map (
      I0 => \FSM_sequential_r_SM_DISPLAY_reg[1]\,
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_0\,
      I2 => \FSM_sequential_r_SM_DISPLAY[1]_i_4_n_0\,
      I3 => \r_SM_DISPLAY__0\(0),
      I4 => \r_SM_DISPLAY__0\(1),
      I5 => CO(0),
      O => \FSM_sequential_r_SM_DISPLAY_reg[0]_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF1010FFFF1010"
    )
        port map (
      I0 => \FSM_sequential_r_SM_DISPLAY_reg[1]\,
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_0\,
      I2 => \FSM_sequential_r_SM_DISPLAY[1]_i_4_n_0\,
      I3 => \r_SM_DISPLAY__0\(0),
      I4 => \r_SM_DISPLAY__0\(1),
      I5 => CO(0),
      O => \FSM_sequential_r_SM_DISPLAY_reg[0]\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_PREV_BUSY,
      I1 => \^w_busy\,
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_4_n_0\
    );
\bit_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF1F00E0"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_state_reg_n_0_[2]\,
      I2 => data_clk_reg_n_0,
      I3 => data_clk_prev,
      I4 => bit_cnt(0),
      O => \bit_cnt[0]_i_1_n_0\
    );
\bit_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFEFFF10101000"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => data_clk_prev,
      I2 => data_clk_reg_n_0,
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_state_reg_n_0_[4]\,
      I5 => bit_cnt(1),
      O => \bit_cnt[1]_i_1_n_0\
    );
\bit_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFEFFF10101000"
    )
        port map (
      I0 => bit_cnt(1),
      I1 => bit_cnt(0),
      I2 => busy1,
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_state_reg_n_0_[4]\,
      I5 => bit_cnt(2),
      O => \bit_cnt[2]_i_1_n_0\
    );
\bit_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => \bit_cnt[0]_i_1_n_0\,
      Q => bit_cnt(0),
      R => '0'
    );
\bit_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => \bit_cnt[1]_i_1_n_0\,
      Q => bit_cnt(1),
      R => '0'
    );
\bit_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => \bit_cnt[2]_i_1_n_0\,
      Q => bit_cnt(2),
      R => '0'
    );
busy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEAFF0000EA00"
    )
        port map (
      I0 => busy_i_2_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => busy_reg_1,
      I3 => busy1,
      I4 => busy_i_3_n_0,
      I5 => \^w_busy\,
      O => busy_i_1_n_0
    );
busy_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_state_reg_n_0_[2]\,
      I2 => \FSM_onehot_state_reg_n_0_[4]\,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      O => busy_i_2_n_0
    );
busy_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100010001"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => \FSM_onehot_state_reg_n_0_[8]\,
      I4 => \FSM_onehot_state_reg_n_0_[5]\,
      I5 => busy_reg_1,
      O => busy_i_3_n_0
    );
busy_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => busy_i_1_n_0,
      Q => \^w_busy\,
      R => '0'
    );
\count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFF80008000BFFF"
    )
        port map (
      I0 => \count[0]_i_2_n_0\,
      I1 => count(5),
      I2 => count(7),
      I3 => count(6),
      I4 => count(0),
      I5 => stretch,
      O => count_0(0)
    );
\count[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFF00000000FFFF"
    )
        port map (
      I0 => count(3),
      I1 => count(1),
      I2 => count(2),
      I3 => count(4),
      I4 => count(0),
      I5 => stretch,
      O => \count[0]_i_2_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \count[1]_i_2_n_0\,
      I1 => count(5),
      I2 => count(7),
      I3 => count(6),
      I4 => \count[1]_i_3_n_0\,
      O => count_0(1)
    );
\count[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF0000FFFF00FF00"
    )
        port map (
      I0 => count(3),
      I1 => count(2),
      I2 => count(4),
      I3 => count(1),
      I4 => stretch,
      I5 => count(0),
      O => \count[1]_i_2_n_0\
    );
\count[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => count(1),
      I1 => stretch,
      I2 => count(0),
      O => \count[1]_i_3_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \count[2]_i_2_n_0\,
      I1 => count(5),
      I2 => count(7),
      I3 => count(6),
      I4 => \count[2]_i_3_n_0\,
      O => count_0(2)
    );
\count[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B00FF0F0F0F0F0F0"
    )
        port map (
      I0 => count(3),
      I1 => count(4),
      I2 => count(2),
      I3 => stretch,
      I4 => count(0),
      I5 => count(1),
      O => \count[2]_i_2_n_0\
    );
\count[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => count(2),
      I1 => stretch,
      I2 => count(0),
      I3 => count(1),
      O => \count[2]_i_3_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \count[3]_i_2_n_0\,
      I1 => count(5),
      I2 => count(7),
      I3 => count(6),
      I4 => \count[3]_i_3_n_0\,
      O => count_0(3)
    );
\count[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC1CCCCCCCCCCC"
    )
        port map (
      I0 => count(4),
      I1 => count(3),
      I2 => count(1),
      I3 => count(0),
      I4 => stretch,
      I5 => count(2),
      O => \count[3]_i_2_n_0\
    );
\count[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA6AAAAA"
    )
        port map (
      I0 => count(3),
      I1 => count(1),
      I2 => count(0),
      I3 => stretch,
      I4 => count(2),
      O => \count[3]_i_3_n_0\
    );
\count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => \count[4]_i_2_n_0\,
      I1 => count(5),
      I2 => count(7),
      I3 => count(6),
      I4 => \count[4]_i_3_n_0\,
      O => count_0(4)
    );
\count[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAA22AAAAAA"
    )
        port map (
      I0 => count(4),
      I1 => count(2),
      I2 => stretch,
      I3 => count(0),
      I4 => count(1),
      I5 => count(3),
      O => \count[4]_i_2_n_0\
    );
\count[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => count(4),
      I1 => count(2),
      I2 => stretch,
      I3 => count(0),
      I4 => count(1),
      I5 => count(3),
      O => \count[4]_i_3_n_0\
    );
\count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF80FFFFBF800000"
    )
        port map (
      I0 => \count[7]_i_2_n_0\,
      I1 => count(7),
      I2 => count(6),
      I3 => \count[6]_i_2_n_0\,
      I4 => count(5),
      I5 => \count[7]_i_3_n_0\,
      O => count_0(5)
    );
\count[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFB800FF00FF00"
    )
        port map (
      I0 => \count[7]_i_2_n_0\,
      I1 => count(7),
      I2 => \count[6]_i_2_n_0\,
      I3 => count(6),
      I4 => \count[7]_i_3_n_0\,
      I5 => count(5),
      O => count_0(6)
    );
\count[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFFFFFFFFFF"
    )
        port map (
      I0 => count(3),
      I1 => count(1),
      I2 => stretch,
      I3 => count(0),
      I4 => count(2),
      I5 => count(4),
      O => \count[6]_i_2_n_0\
    );
\count[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFFFC000"
    )
        port map (
      I0 => \count[7]_i_2_n_0\,
      I1 => \count[7]_i_3_n_0\,
      I2 => count(5),
      I3 => count(6),
      I4 => count(7),
      O => count_0(7)
    );
\count[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7F7F7FFFFFFFFF"
    )
        port map (
      I0 => count(2),
      I1 => count(0),
      I2 => count(1),
      I3 => count(3),
      I4 => stretch,
      I5 => count(4),
      O => \count[7]_i_2_n_0\
    );
\count[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => count(3),
      I1 => count(1),
      I2 => count(0),
      I3 => stretch,
      I4 => count(2),
      I5 => count(4),
      O => \count[7]_i_3_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => count_0(0),
      Q => count(0),
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => count_0(1),
      Q => count(1),
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => count_0(2),
      Q => count(2),
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => count_0(3),
      Q => count(3),
      R => '0'
    );
\count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => count_0(4),
      Q => count(4),
      R => '0'
    );
\count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => count_0(5),
      Q => count(5),
      R => '0'
    );
\count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => count_0(6),
      Q => count(6),
      R => '0'
    );
\count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => count_0(7),
      Q => count(7),
      R => '0'
    );
data_clk_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4F4A4A4A"
    )
        port map (
      I0 => count(6),
      I1 => stretch_i_3_n_0,
      I2 => count(7),
      I3 => data_clk_i_2_n_0,
      I4 => count(5),
      O => data_clk
    );
data_clk_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88A8000000000000"
    )
        port map (
      I0 => count(3),
      I1 => count(1),
      I2 => count(0),
      I3 => stretch,
      I4 => count(2),
      I5 => count(4),
      O => data_clk_i_2_n_0
    );
data_clk_prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => data_clk_reg_n_0,
      Q => data_clk_prev,
      R => '0'
    );
data_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => data_clk,
      Q => data_clk_reg_n_0,
      R => '0'
    );
\data_tx[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40404000"
    )
        port map (
      I0 => data_clk_prev,
      I1 => data_clk_reg_n_0,
      I2 => busy_reg_1,
      I3 => \FSM_onehot_state_reg_n_0_[0]\,
      I4 => \FSM_onehot_state_reg_n_0_[5]\,
      O => addr_rw0
    );
\data_tx_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => addr_rw0,
      D => D(0),
      Q => data_tx(0),
      R => '0'
    );
\data_tx_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => addr_rw0,
      D => D(1),
      Q => data_tx(1),
      R => '0'
    );
\data_tx_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => addr_rw0,
      D => D(2),
      Q => data_tx(2),
      R => '0'
    );
\data_tx_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => addr_rw0,
      D => D(3),
      Q => data_tx(3),
      R => '0'
    );
\data_tx_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => addr_rw0,
      D => D(4),
      Q => data_tx(4),
      R => '0'
    );
\data_tx_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => addr_rw0,
      D => D(5),
      Q => data_tx(5),
      R => '0'
    );
\data_tx_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => addr_rw0,
      D => D(6),
      Q => data_tx(6),
      R => '0'
    );
\data_tx_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => addr_rw0,
      D => D(7),
      Q => data_tx(7),
      R => '0'
    );
o_oled_scl_IOBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"D"
    )
        port map (
      I0 => scl_ena_reg_n_0,
      I1 => scl_clk_reg_n_0,
      O => o_oled_scl_TRI
    );
o_oled_sda_OBUFT_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BDB8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => data_clk_prev,
      I2 => \FSM_onehot_state_reg_n_0_[8]\,
      I3 => sda_int_reg_n_0,
      O => o_oled_sda_OBUF
    );
o_oled_sda_OBUFT_inst_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FC2E"
    )
        port map (
      I0 => sda_int_reg_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[8]\,
      I2 => data_clk_prev,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      O => o_oled_sda_TRI
    );
\r_COM_COUNTER[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE000000000000"
    )
        port map (
      I0 => \r_COM_COUNTER_reg[31]\,
      I1 => \r_COM_COUNTER_reg[31]_0\,
      I2 => \r_COM_COUNTER_reg[31]_1\,
      I3 => \r_COM_COUNTER_reg[31]_2\,
      I4 => \r_SM_DISPLAY__0\(0),
      I5 => \r_COM_COUNTER[0]_i_7_n_0\,
      O => sel
    );
\r_COM_COUNTER[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^w_busy\,
      I1 => r_PREV_BUSY,
      I2 => \r_SM_DISPLAY__0\(1),
      O => \r_COM_COUNTER[0]_i_7_n_0\
    );
r_ENA_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F703"
    )
        port map (
      I0 => \^w_busy\,
      I1 => \r_SM_DISPLAY__0\(1),
      I2 => \r_SM_DISPLAY__0\(0),
      I3 => busy_reg_1,
      O => busy_reg_0
    );
scl_clk_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBFFF000"
    )
        port map (
      I0 => \count[7]_i_2_n_0\,
      I1 => count(5),
      I2 => stretch_i_2_n_0,
      I3 => count(6),
      I4 => count(7),
      O => scl_clk
    );
scl_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => scl_clk,
      Q => scl_clk_reg_n_0,
      R => '0'
    );
scl_ena_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF44BF00"
    )
        port map (
      I0 => data_clk_reg_n_0,
      I1 => data_clk_prev,
      I2 => \FSM_onehot_state_reg_n_0_[8]\,
      I3 => scl_ena_reg_n_0,
      I4 => \FSM_onehot_state_reg_n_0_[1]\,
      O => scl_ena_i_1_n_0
    );
scl_ena_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => scl_ena_i_1_n_0,
      Q => scl_ena_reg_n_0,
      R => '0'
    );
sda_int_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF8FFFFFFF80000"
    )
        port map (
      I0 => sda_int_reg_i_2_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[5]\,
      I2 => sda_int_i_3_n_0,
      I3 => sda_int_i_4_n_0,
      I4 => sda_int4_out,
      I5 => sda_int_reg_n_0,
      O => sda_int_i_1_n_0
    );
sda_int_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bit_cnt(0),
      I1 => bit_cnt(1),
      O => sda_int_i_10_n_0
    );
sda_int_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => data_tx(0),
      I1 => data_tx(1),
      I2 => bit_cnt(0),
      I3 => bit_cnt(1),
      I4 => data_tx(2),
      I5 => data_tx(3),
      O => sda_int_i_11_n_0
    );
sda_int_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data_tx(3),
      I1 => data_tx(2),
      I2 => bit_cnt(1),
      I3 => data_tx(1),
      I4 => bit_cnt(0),
      I5 => data_tx(0),
      O => sda_int_i_12_n_0
    );
sda_int_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data_tx(7),
      I1 => data_tx(6),
      I2 => bit_cnt(1),
      I3 => data_tx(5),
      I4 => bit_cnt(0),
      I5 => data_tx(4),
      O => sda_int_i_13_n_0
    );
sda_int_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => busy_reg_1,
      I1 => \FSM_onehot_state_reg_n_0_[5]\,
      O => sda_int_i_14_n_0
    );
sda_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFAAAAAFEAAAAA"
    )
        port map (
      I0 => sda_int_i_8_n_0,
      I1 => sda_int_i_9_n_0,
      I2 => bit_cnt(2),
      I3 => sda_int_i_10_n_0,
      I4 => \FSM_onehot_state_reg_n_0_[4]\,
      I5 => sda_int_i_11_n_0,
      O => sda_int_i_3_n_0
    );
sda_int_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[3]\,
      I1 => sda_int_i_12_n_0,
      I2 => bit_cnt(2),
      I3 => sda_int_i_13_n_0,
      O => sda_int_i_4_n_0
    );
sda_int_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA8"
    )
        port map (
      I0 => busy1,
      I1 => sda_int_i_14_n_0,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => \FSM_onehot_state_reg_n_0_[4]\,
      I4 => \FSM_onehot_state_reg_n_0_[2]\,
      I5 => \FSM_onehot_state_reg_n_0_[3]\,
      O => sda_int4_out
    );
sda_int_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => D(3),
      I1 => D(2),
      I2 => bit_cnt(1),
      I3 => D(1),
      I4 => bit_cnt(0),
      I5 => D(0),
      O => sda_int_i_6_n_0
    );
sda_int_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => D(7),
      I1 => D(6),
      I2 => bit_cnt(1),
      I3 => D(5),
      I4 => bit_cnt(0),
      I5 => D(4),
      O => sda_int_i_7_n_0
    );
sda_int_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCEEEA00C"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_state_reg_n_0_[2]\,
      I2 => bit_cnt(0),
      I3 => bit_cnt(1),
      I4 => bit_cnt(2),
      I5 => \FSM_onehot_state_reg_n_0_[0]\,
      O => sda_int_i_8_n_0
    );
sda_int_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => data_tx(4),
      I1 => data_tx(5),
      I2 => bit_cnt(0),
      I3 => bit_cnt(1),
      I4 => data_tx(6),
      I5 => data_tx(7),
      O => sda_int_i_9_n_0
    );
sda_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => sda_int_i_1_n_0,
      Q => sda_int_reg_n_0,
      R => '0'
    );
sda_int_reg_i_2: unisim.vcomponents.MUXF7
     port map (
      I0 => sda_int_i_6_n_0,
      I1 => sda_int_i_7_n_0,
      O => sda_int_reg_i_2_n_0,
      S => bit_cnt(2)
    );
stretch_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F5FF7F7F05004040"
    )
        port map (
      I0 => data0,
      I1 => stretch_i_2_n_0,
      I2 => count(6),
      I3 => stretch_i_3_n_0,
      I4 => count(7),
      I5 => stretch,
      O => stretch_i_1_n_0
    );
stretch_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A888000000000000"
    )
        port map (
      I0 => count(4),
      I1 => count(2),
      I2 => stretch_i_4_n_0,
      I3 => count(1),
      I4 => count(3),
      I5 => count(5),
      O => stretch_i_2_n_0
    );
stretch_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5557FFFFFFFFFFFF"
    )
        port map (
      I0 => count(4),
      I1 => count(2),
      I2 => stretch_i_4_n_0,
      I3 => count(1),
      I4 => count(3),
      I5 => count(5),
      O => stretch_i_3_n_0
    );
stretch_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count(0),
      I1 => stretch,
      O => stretch_i_4_n_0
    );
stretch_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => stretch_i_1_n_0,
      Q => stretch,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display is
  port (
    i_clck : in STD_LOGIC;
    o_oled_scl : inout STD_LOGIC;
    o_oled_sda : inout STD_LOGIC;
    o_oled_vcc : out STD_LOGIC;
    o_oled_gnd : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of display : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of display : entity is "a1cb61e5";
end display;

architecture STRUCTURE of display is
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_11_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_12_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_13_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_15_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_16_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_17_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_18_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_19_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_20_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_21_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_22_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_24_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_25_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_26_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_27_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_28_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_29_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_30_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_31_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_36_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_38_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_39_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_40_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_41_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_42_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_43_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_46_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_47_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_48_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_49_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_50_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_51_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY[1]_i_9_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_14_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_23_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_33_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_34_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_35_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_37_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_44_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_45_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_52_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_53_n_0\ : STD_LOGIC;
  signal \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\ : STD_LOGIC;
  signal I2C_CONTROLLER_n_1 : STD_LOGIC;
  signal I2C_CONTROLLER_n_2 : STD_LOGIC;
  signal I2C_CONTROLLER_n_3 : STD_LOGIC;
  signal I2C_CONTROLLER_n_4 : STD_LOGIC;
  signal g0_b0_n_0 : STD_LOGIC;
  signal g0_b1_n_0 : STD_LOGIC;
  signal g0_b2_n_0 : STD_LOGIC;
  signal g0_b3_n_0 : STD_LOGIC;
  signal g0_b4_n_0 : STD_LOGIC;
  signal g0_b5_n_0 : STD_LOGIC;
  signal g0_b6_n_0 : STD_LOGIC;
  signal g0_b7_n_0 : STD_LOGIC;
  signal i_clck_IBUF : STD_LOGIC;
  signal i_clck_IBUF_BUFG : STD_LOGIC;
  signal o_oled_scl_IBUF : STD_LOGIC;
  signal o_oled_scl_TRI : STD_LOGIC;
  signal o_oled_sda_OBUF : STD_LOGIC;
  signal o_oled_sda_TRI : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[0]_i_3_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[0]_i_4_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[0]_i_5_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[0]_i_6_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[0]_i_7_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[12]_i_2_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[12]_i_3_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[12]_i_4_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[12]_i_5_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[16]_i_2_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[16]_i_3_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[16]_i_4_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[16]_i_5_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[20]_i_2_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[20]_i_3_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[20]_i_4_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[20]_i_5_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[24]_i_2_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[24]_i_3_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[24]_i_4_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[24]_i_5_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[28]_i_2_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[28]_i_3_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[28]_i_4_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[28]_i_5_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[4]_i_2_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[4]_i_3_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[4]_i_4_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[4]_i_5_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[8]_i_2_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[8]_i_3_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[8]_i_4_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER[8]_i_5_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \r_COM_COUNTER[0]_i_3_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER[0]_i_4_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER[0]_i_5_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER[0]_i_6_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER[0]_i_8_n_0\ : STD_LOGIC;
  signal r_COM_COUNTER_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \r_COM_COUNTER_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \r_COM_COUNTER_reg__0\ : STD_LOGIC_VECTOR ( 31 downto 5 );
  signal r_DATA_WR : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_DATA_WR[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[4]_i_1_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[6]_i_1_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[7]_i_1_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[7]_i_2_n_0\ : STD_LOGIC;
  signal r_ENA_reg_n_0 : STD_LOGIC;
  signal r_PREV_BUSY : STD_LOGIC;
  signal r_SM_DISPLAY2 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \r_SM_DISPLAY__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal w_BUSY : STD_LOGIC;
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_14_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_14_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_23_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_23_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_32_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_32_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_33_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_34_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_35_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_35_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_37_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_44_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_45_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_52_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_53_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[0]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_r_SM_DISPLAY_reg[0]\ : label is "iSTATE:011,iSTATE0:11,iSTATE1:01,iSTATE2:00,iSTATE3:10";
  attribute FSM_ENCODED_STATES of \FSM_sequential_r_SM_DISPLAY_reg[1]\ : label is "iSTATE:011,iSTATE0:11,iSTATE1:01,iSTATE2:00,iSTATE3:10";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_14\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_23\ : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_32\ : label is 35;
  attribute ADDER_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_33\ : label is 35;
  attribute ADDER_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_34\ : label is 35;
  attribute COMPARATOR_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_35\ : label is 11;
  attribute ADDER_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_37\ : label is 35;
  attribute ADDER_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_44\ : label is 35;
  attribute ADDER_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_45\ : label is 35;
  attribute COMPARATOR_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5\ : label is 11;
  attribute ADDER_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_52\ : label is 35;
  attribute ADDER_THRESHOLD of \FSM_sequential_r_SM_DISPLAY_reg[1]_i_53\ : label is 35;
  attribute ADDER_THRESHOLD of \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[8]_i_1\ : label is 11;
begin
pullup_o_oled_sclinst: unisim.vcomponents.PULLUP
    port map (
      O => o_oled_scl
    );
pullup_o_oled_sdainst: unisim.vcomponents.PULLUP
    port map (
      O => o_oled_sda
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(21),
      I1 => \r_COM_COUNTER_reg__0\(20),
      I2 => \r_COM_COUNTER_reg__0\(23),
      I3 => \r_COM_COUNTER_reg__0\(22),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_10_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(17),
      I1 => \r_COM_COUNTER_reg__0\(16),
      I2 => \r_COM_COUNTER_reg__0\(19),
      I3 => \r_COM_COUNTER_reg__0\(18),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_11_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(29),
      I1 => \r_COM_COUNTER_reg__0\(28),
      I2 => \r_COM_COUNTER_reg__0\(31),
      I3 => \r_COM_COUNTER_reg__0\(30),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_12_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(25),
      I1 => \r_COM_COUNTER_reg__0\(24),
      I2 => \r_COM_COUNTER_reg__0\(27),
      I3 => \r_COM_COUNTER_reg__0\(26),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_13_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_SM_DISPLAY2(30),
      I1 => r_SM_DISPLAY2(31),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_15_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => r_SM_DISPLAY2(28),
      I1 => r_SM_DISPLAY2(29),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_16_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => r_SM_DISPLAY2(26),
      I1 => r_SM_DISPLAY2(27),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_17_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => r_SM_DISPLAY2(24),
      I1 => r_SM_DISPLAY2(25),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_18_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_SM_DISPLAY2(30),
      I1 => r_SM_DISPLAY2(31),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_19_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_sequential_r_SM_DISPLAY[1]_i_6_n_0\,
      I1 => \FSM_sequential_r_SM_DISPLAY[1]_i_7_n_0\,
      I2 => \FSM_sequential_r_SM_DISPLAY[1]_i_8_n_0\,
      I3 => \FSM_sequential_r_SM_DISPLAY[1]_i_9_n_0\,
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_2_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_SM_DISPLAY2(28),
      I1 => r_SM_DISPLAY2(29),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_20_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_21\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_SM_DISPLAY2(26),
      I1 => r_SM_DISPLAY2(27),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_21_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_22\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_SM_DISPLAY2(24),
      I1 => r_SM_DISPLAY2(25),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_22_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_24\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => r_SM_DISPLAY2(22),
      I1 => r_SM_DISPLAY2(23),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_24_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_25\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => r_SM_DISPLAY2(20),
      I1 => r_SM_DISPLAY2(21),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_25_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_26\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => r_SM_DISPLAY2(18),
      I1 => r_SM_DISPLAY2(19),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_26_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_27\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => r_SM_DISPLAY2(16),
      I1 => r_SM_DISPLAY2(17),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_27_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_28\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_SM_DISPLAY2(22),
      I1 => r_SM_DISPLAY2(23),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_28_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_29\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_SM_DISPLAY2(21),
      I1 => r_SM_DISPLAY2(20),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_29_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_sequential_r_SM_DISPLAY[1]_i_10_n_0\,
      I1 => \FSM_sequential_r_SM_DISPLAY[1]_i_11_n_0\,
      I2 => \FSM_sequential_r_SM_DISPLAY[1]_i_12_n_0\,
      I3 => \FSM_sequential_r_SM_DISPLAY[1]_i_13_n_0\,
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_3_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_30\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_SM_DISPLAY2(18),
      I1 => r_SM_DISPLAY2(19),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_30_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_31\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_SM_DISPLAY2(16),
      I1 => r_SM_DISPLAY2(17),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_31_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_36\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => r_SM_DISPLAY2(14),
      I1 => r_SM_DISPLAY2(15),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_36_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_38\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => r_SM_DISPLAY2(10),
      I1 => r_SM_DISPLAY2(11),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_38_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_39\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => r_SM_DISPLAY2(8),
      I1 => r_SM_DISPLAY2(9),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_39_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_40\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_SM_DISPLAY2(15),
      I1 => r_SM_DISPLAY2(14),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_40_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_41\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_SM_DISPLAY2(12),
      I1 => r_SM_DISPLAY2(13),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_41_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_42\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_SM_DISPLAY2(10),
      I1 => r_SM_DISPLAY2(11),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_42_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_43\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_SM_DISPLAY2(8),
      I1 => r_SM_DISPLAY2(9),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_43_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_46\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => r_SM_DISPLAY2(2),
      I1 => r_SM_DISPLAY2(3),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_46_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_47\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_SM_DISPLAY2(1),
      I1 => \p_STATE_MACHINE.v_COUNTER_reg\(0),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_47_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_48\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => r_SM_DISPLAY2(6),
      I1 => r_SM_DISPLAY2(7),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_48_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_49\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_SM_DISPLAY2(4),
      I1 => r_SM_DISPLAY2(5),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_49_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_50\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_SM_DISPLAY2(3),
      I1 => r_SM_DISPLAY2(2),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_50_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_51\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(0),
      I1 => r_SM_DISPLAY2(1),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_51_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => r_COM_COUNTER_reg(4),
      I1 => \r_COM_COUNTER_reg__0\(5),
      I2 => \r_COM_COUNTER_reg__0\(7),
      I3 => \r_COM_COUNTER_reg__0\(6),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_6_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(3),
      I3 => r_COM_COUNTER_reg(2),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_7_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(13),
      I1 => \r_COM_COUNTER_reg__0\(12),
      I2 => \r_COM_COUNTER_reg__0\(15),
      I3 => \r_COM_COUNTER_reg__0\(14),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_8_n_0\
    );
\FSM_sequential_r_SM_DISPLAY[1]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(9),
      I1 => \r_COM_COUNTER_reg__0\(8),
      I2 => \r_COM_COUNTER_reg__0\(11),
      I3 => \r_COM_COUNTER_reg__0\(10),
      O => \FSM_sequential_r_SM_DISPLAY[1]_i_9_n_0\
    );
\FSM_sequential_r_SM_DISPLAY_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => I2C_CONTROLLER_n_2,
      Q => \r_SM_DISPLAY__0\(0),
      R => '0'
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => I2C_CONTROLLER_n_1,
      Q => \r_SM_DISPLAY__0\(1),
      R => '0'
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_14\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_23_n_0\,
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_14_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_14_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \FSM_sequential_r_SM_DISPLAY[1]_i_24_n_0\,
      DI(2) => \FSM_sequential_r_SM_DISPLAY[1]_i_25_n_0\,
      DI(1) => \FSM_sequential_r_SM_DISPLAY[1]_i_26_n_0\,
      DI(0) => \FSM_sequential_r_SM_DISPLAY[1]_i_27_n_0\,
      O(3 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_14_O_UNCONNECTED\(3 downto 0),
      S(3) => \FSM_sequential_r_SM_DISPLAY[1]_i_28_n_0\,
      S(2) => \FSM_sequential_r_SM_DISPLAY[1]_i_29_n_0\,
      S(1) => \FSM_sequential_r_SM_DISPLAY[1]_i_30_n_0\,
      S(0) => \FSM_sequential_r_SM_DISPLAY[1]_i_31_n_0\
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_23\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_35_n_0\,
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_23_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_23_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \FSM_sequential_r_SM_DISPLAY[1]_i_36_n_0\,
      DI(2) => r_SM_DISPLAY2(13),
      DI(1) => \FSM_sequential_r_SM_DISPLAY[1]_i_38_n_0\,
      DI(0) => \FSM_sequential_r_SM_DISPLAY[1]_i_39_n_0\,
      O(3 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_23_O_UNCONNECTED\(3 downto 0),
      S(3) => \FSM_sequential_r_SM_DISPLAY[1]_i_40_n_0\,
      S(2) => \FSM_sequential_r_SM_DISPLAY[1]_i_41_n_0\,
      S(1) => \FSM_sequential_r_SM_DISPLAY[1]_i_42_n_0\,
      S(0) => \FSM_sequential_r_SM_DISPLAY[1]_i_43_n_0\
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_32\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_33_n_0\,
      CO(3 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_32_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_32_O_UNCONNECTED\(3),
      O(2 downto 0) => r_SM_DISPLAY2(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => \p_STATE_MACHINE.v_COUNTER_reg\(31 downto 29)
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_33\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_34_n_0\,
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_33_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_33_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_SM_DISPLAY2(28 downto 25),
      S(3 downto 0) => \p_STATE_MACHINE.v_COUNTER_reg\(28 downto 25)
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_34\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_44_n_0\,
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_34_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_34_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_SM_DISPLAY2(24 downto 21),
      S(3 downto 0) => \p_STATE_MACHINE.v_COUNTER_reg\(24 downto 21)
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_35\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_35_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_35_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => r_SM_DISPLAY2(5),
      DI(1) => \FSM_sequential_r_SM_DISPLAY[1]_i_46_n_0\,
      DI(0) => \FSM_sequential_r_SM_DISPLAY[1]_i_47_n_0\,
      O(3 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_35_O_UNCONNECTED\(3 downto 0),
      S(3) => \FSM_sequential_r_SM_DISPLAY[1]_i_48_n_0\,
      S(2) => \FSM_sequential_r_SM_DISPLAY[1]_i_49_n_0\,
      S(1) => \FSM_sequential_r_SM_DISPLAY[1]_i_50_n_0\,
      S(0) => \FSM_sequential_r_SM_DISPLAY[1]_i_51_n_0\
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_37\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_52_n_0\,
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_37_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_37_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_SM_DISPLAY2(16 downto 13),
      S(3 downto 0) => \p_STATE_MACHINE.v_COUNTER_reg\(16 downto 13)
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_44\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_37_n_0\,
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_44_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_44_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_SM_DISPLAY2(20 downto 17),
      S(3 downto 0) => \p_STATE_MACHINE.v_COUNTER_reg\(20 downto 17)
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_45\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_53_n_0\,
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_45_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_45_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_SM_DISPLAY2(8 downto 5),
      S(3 downto 0) => \p_STATE_MACHINE.v_COUNTER_reg\(8 downto 5)
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_14_n_0\,
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \FSM_sequential_r_SM_DISPLAY[1]_i_15_n_0\,
      DI(2) => \FSM_sequential_r_SM_DISPLAY[1]_i_16_n_0\,
      DI(1) => \FSM_sequential_r_SM_DISPLAY[1]_i_17_n_0\,
      DI(0) => \FSM_sequential_r_SM_DISPLAY[1]_i_18_n_0\,
      O(3 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_O_UNCONNECTED\(3 downto 0),
      S(3) => \FSM_sequential_r_SM_DISPLAY[1]_i_19_n_0\,
      S(2) => \FSM_sequential_r_SM_DISPLAY[1]_i_20_n_0\,
      S(1) => \FSM_sequential_r_SM_DISPLAY[1]_i_21_n_0\,
      S(0) => \FSM_sequential_r_SM_DISPLAY[1]_i_22_n_0\
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_52\: unisim.vcomponents.CARRY4
     port map (
      CI => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_45_n_0\,
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_52_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_52_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_SM_DISPLAY2(12 downto 9),
      S(3 downto 0) => \p_STATE_MACHINE.v_COUNTER_reg\(12 downto 9)
    );
\FSM_sequential_r_SM_DISPLAY_reg[1]_i_53\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_53_n_0\,
      CO(2 downto 0) => \NLW_FSM_sequential_r_SM_DISPLAY_reg[1]_i_53_CO_UNCONNECTED\(2 downto 0),
      CYINIT => \p_STATE_MACHINE.v_COUNTER_reg\(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_SM_DISPLAY2(4 downto 1),
      S(3 downto 0) => \p_STATE_MACHINE.v_COUNTER_reg\(4 downto 1)
    );
I2C_CONTROLLER: entity work.i2c_master
     port map (
      CO(0) => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      D(7 downto 0) => r_DATA_WR(7 downto 0),
      \FSM_sequential_r_SM_DISPLAY_reg[0]\ => I2C_CONTROLLER_n_1,
      \FSM_sequential_r_SM_DISPLAY_reg[0]_0\ => I2C_CONTROLLER_n_2,
      \FSM_sequential_r_SM_DISPLAY_reg[1]\ => \FSM_sequential_r_SM_DISPLAY[1]_i_2_n_0\,
      \FSM_sequential_r_SM_DISPLAY_reg[1]_0\ => \FSM_sequential_r_SM_DISPLAY[1]_i_3_n_0\,
      busy_reg_0 => I2C_CONTROLLER_n_4,
      busy_reg_1 => r_ENA_reg_n_0,
      data0 => o_oled_scl_IBUF,
      i_clck_IBUF_BUFG => i_clck_IBUF_BUFG,
      o_oled_scl_TRI => o_oled_scl_TRI,
      o_oled_sda_OBUF => o_oled_sda_OBUF,
      o_oled_sda_TRI => o_oled_sda_TRI,
      \r_COM_COUNTER_reg[31]\ => \r_COM_COUNTER[0]_i_3_n_0\,
      \r_COM_COUNTER_reg[31]_0\ => \r_COM_COUNTER[0]_i_4_n_0\,
      \r_COM_COUNTER_reg[31]_1\ => \r_COM_COUNTER[0]_i_5_n_0\,
      \r_COM_COUNTER_reg[31]_2\ => \r_COM_COUNTER[0]_i_6_n_0\,
      r_PREV_BUSY => r_PREV_BUSY,
      \r_SM_DISPLAY__0\(1 downto 0) => \r_SM_DISPLAY__0\(1 downto 0),
      sel => I2C_CONTROLLER_n_3,
      w_BUSY => w_BUSY
    );
g0_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"021F113200000000"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      I5 => \r_SM_DISPLAY__0\(0),
      O => g0_b0_n_0
    );
g0_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0392C03100000000"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      I5 => \r_SM_DISPLAY__0\(0),
      O => g0_b1_n_0
    );
g0_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03C2031300000000"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      I5 => \r_SM_DISPLAY__0\(0),
      O => g0_b2_n_0
    );
g0_b3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03166119"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      O => g0_b3_n_0
    );
g0_b4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"001C4232"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      O => g0_b4_n_0
    );
g0_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03C8140900000000"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      I5 => \r_SM_DISPLAY__0\(0),
      O => g0_b5_n_0
    );
g0_b6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"003C60A2"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      O => g0_b6_n_0
    );
g0_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02DF712F00000000"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      I5 => \r_SM_DISPLAY__0\(0),
      O => g0_b7_n_0
    );
i_clck_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_clck_IBUF,
      O => i_clck_IBUF_BUFG
    );
i_clck_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_clck,
      O => i_clck_IBUF
    );
o_oled_gnd_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_oled_gnd
    );
o_oled_scl_IOBUF_inst: unisim.vcomponents.IOBUF
     port map (
      I => '0',
      IO => o_oled_scl,
      O => o_oled_scl_IBUF,
      T => o_oled_scl_TRI
    );
o_oled_sda_OBUFT_inst: unisim.vcomponents.OBUFT
     port map (
      I => o_oled_sda_OBUF,
      O => o_oled_sda,
      T => o_oled_sda_TRI
    );
o_oled_vcc_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => o_oled_vcc
    );
\p_STATE_MACHINE.v_COUNTER[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \r_SM_DISPLAY__0\(1),
      I1 => \r_SM_DISPLAY__0\(0),
      O => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[0]_i_3_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(3),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[0]_i_4_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(2),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[0]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(1),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[0]_i_6_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(0),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[0]_i_7_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(15),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[12]_i_2_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(14),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[12]_i_3_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(13),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[12]_i_4_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(12),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[12]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(19),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[16]_i_2_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(18),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[16]_i_3_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(17),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[16]_i_4_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(16),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[16]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(23),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[20]_i_2_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(22),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[20]_i_3_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(21),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[20]_i_4_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(20),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[20]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(27),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[24]_i_2_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(26),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[24]_i_3_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(25),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[24]_i_4_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(24),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[24]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(31),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[28]_i_2_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(30),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[28]_i_3_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(29),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[28]_i_4_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(28),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[28]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(7),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[4]_i_2_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(6),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[4]_i_3_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(5),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[4]_i_4_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(4),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[4]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(11),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[8]_i_2_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(10),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[8]_i_3_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(9),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[8]_i_4_n_0\
    );
\p_STATE_MACHINE.v_COUNTER[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \p_STATE_MACHINE.v_COUNTER_reg\(8),
      I1 => \FSM_sequential_r_SM_DISPLAY_reg[1]_i_5_n_0\,
      O => \p_STATE_MACHINE.v_COUNTER[8]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_7\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(0),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_0\,
      CO(2 downto 0) => \NLW_p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \p_STATE_MACHINE.v_COUNTER[0]_i_3_n_0\,
      O(3) => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_4\,
      O(2) => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_5\,
      O(1) => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_6\,
      O(0) => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_7\,
      S(3) => \p_STATE_MACHINE.v_COUNTER[0]_i_4_n_0\,
      S(2) => \p_STATE_MACHINE.v_COUNTER[0]_i_5_n_0\,
      S(1) => \p_STATE_MACHINE.v_COUNTER[0]_i_6_n_0\,
      S(0) => \p_STATE_MACHINE.v_COUNTER[0]_i_7_n_0\
    );
\p_STATE_MACHINE.v_COUNTER_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_5\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(10),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_4\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(11),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_7\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(12),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_0\,
      CO(3) => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_0\,
      CO(2 downto 0) => \NLW_p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_4\,
      O(2) => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_5\,
      O(1) => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_6\,
      O(0) => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_7\,
      S(3) => \p_STATE_MACHINE.v_COUNTER[12]_i_2_n_0\,
      S(2) => \p_STATE_MACHINE.v_COUNTER[12]_i_3_n_0\,
      S(1) => \p_STATE_MACHINE.v_COUNTER[12]_i_4_n_0\,
      S(0) => \p_STATE_MACHINE.v_COUNTER[12]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_6\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(13),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_5\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(14),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_4\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(15),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_7\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(16),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_STATE_MACHINE.v_COUNTER_reg[12]_i_1_n_0\,
      CO(3) => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_0\,
      CO(2 downto 0) => \NLW_p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_4\,
      O(2) => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_5\,
      O(1) => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_6\,
      O(0) => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_7\,
      S(3) => \p_STATE_MACHINE.v_COUNTER[16]_i_2_n_0\,
      S(2) => \p_STATE_MACHINE.v_COUNTER[16]_i_3_n_0\,
      S(1) => \p_STATE_MACHINE.v_COUNTER[16]_i_4_n_0\,
      S(0) => \p_STATE_MACHINE.v_COUNTER[16]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_6\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(17),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_5\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(18),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_4\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(19),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_6\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(1),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_7\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(20),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_STATE_MACHINE.v_COUNTER_reg[16]_i_1_n_0\,
      CO(3) => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_0\,
      CO(2 downto 0) => \NLW_p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_4\,
      O(2) => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_5\,
      O(1) => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_6\,
      O(0) => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_7\,
      S(3) => \p_STATE_MACHINE.v_COUNTER[20]_i_2_n_0\,
      S(2) => \p_STATE_MACHINE.v_COUNTER[20]_i_3_n_0\,
      S(1) => \p_STATE_MACHINE.v_COUNTER[20]_i_4_n_0\,
      S(0) => \p_STATE_MACHINE.v_COUNTER[20]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_6\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(21),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_5\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(22),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_4\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(23),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_7\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(24),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_STATE_MACHINE.v_COUNTER_reg[20]_i_1_n_0\,
      CO(3) => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_0\,
      CO(2 downto 0) => \NLW_p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_4\,
      O(2) => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_5\,
      O(1) => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_6\,
      O(0) => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_7\,
      S(3) => \p_STATE_MACHINE.v_COUNTER[24]_i_2_n_0\,
      S(2) => \p_STATE_MACHINE.v_COUNTER[24]_i_3_n_0\,
      S(1) => \p_STATE_MACHINE.v_COUNTER[24]_i_4_n_0\,
      S(0) => \p_STATE_MACHINE.v_COUNTER[24]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_6\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(25),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_5\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(26),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_4\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(27),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_7\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(28),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_STATE_MACHINE.v_COUNTER_reg[24]_i_1_n_0\,
      CO(3 downto 0) => \NLW_p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_4\,
      O(2) => \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_5\,
      O(1) => \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_6\,
      O(0) => \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_7\,
      S(3) => \p_STATE_MACHINE.v_COUNTER[28]_i_2_n_0\,
      S(2) => \p_STATE_MACHINE.v_COUNTER[28]_i_3_n_0\,
      S(1) => \p_STATE_MACHINE.v_COUNTER[28]_i_4_n_0\,
      S(0) => \p_STATE_MACHINE.v_COUNTER[28]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_6\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(29),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_5\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(2),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_5\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(30),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[28]_i_1_n_4\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(31),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_4\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(3),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_7\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(4),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_STATE_MACHINE.v_COUNTER_reg[0]_i_2_n_0\,
      CO(3) => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_0\,
      CO(2 downto 0) => \NLW_p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_4\,
      O(2) => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_5\,
      O(1) => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_6\,
      O(0) => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_7\,
      S(3) => \p_STATE_MACHINE.v_COUNTER[4]_i_2_n_0\,
      S(2) => \p_STATE_MACHINE.v_COUNTER[4]_i_3_n_0\,
      S(1) => \p_STATE_MACHINE.v_COUNTER[4]_i_4_n_0\,
      S(0) => \p_STATE_MACHINE.v_COUNTER[4]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_6\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(5),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_5\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(6),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_4\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(7),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_7\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(8),
      R => '0'
    );
\p_STATE_MACHINE.v_COUNTER_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_STATE_MACHINE.v_COUNTER_reg[4]_i_1_n_0\,
      CO(3) => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_0\,
      CO(2 downto 0) => \NLW_p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_4\,
      O(2) => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_5\,
      O(1) => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_6\,
      O(0) => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_7\,
      S(3) => \p_STATE_MACHINE.v_COUNTER[8]_i_2_n_0\,
      S(2) => \p_STATE_MACHINE.v_COUNTER[8]_i_3_n_0\,
      S(1) => \p_STATE_MACHINE.v_COUNTER[8]_i_4_n_0\,
      S(0) => \p_STATE_MACHINE.v_COUNTER[8]_i_5_n_0\
    );
\p_STATE_MACHINE.v_COUNTER_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \p_STATE_MACHINE.v_COUNTER[0]_i_1_n_0\,
      D => \p_STATE_MACHINE.v_COUNTER_reg[8]_i_1_n_6\,
      Q => \p_STATE_MACHINE.v_COUNTER_reg\(9),
      R => '0'
    );
\r_COM_COUNTER[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(18),
      I1 => \r_COM_COUNTER_reg__0\(19),
      I2 => \r_COM_COUNTER_reg__0\(16),
      I3 => \r_COM_COUNTER_reg__0\(17),
      I4 => \FSM_sequential_r_SM_DISPLAY[1]_i_10_n_0\,
      O => \r_COM_COUNTER[0]_i_3_n_0\
    );
\r_COM_COUNTER[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(26),
      I1 => \r_COM_COUNTER_reg__0\(27),
      I2 => \r_COM_COUNTER_reg__0\(24),
      I3 => \r_COM_COUNTER_reg__0\(25),
      I4 => \FSM_sequential_r_SM_DISPLAY[1]_i_12_n_0\,
      O => \r_COM_COUNTER[0]_i_4_n_0\
    );
\r_COM_COUNTER[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => r_COM_COUNTER_reg(2),
      I1 => r_COM_COUNTER_reg(3),
      I2 => r_COM_COUNTER_reg(1),
      I3 => r_COM_COUNTER_reg(0),
      I4 => \FSM_sequential_r_SM_DISPLAY[1]_i_6_n_0\,
      O => \r_COM_COUNTER[0]_i_5_n_0\
    );
\r_COM_COUNTER[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(10),
      I1 => \r_COM_COUNTER_reg__0\(11),
      I2 => \r_COM_COUNTER_reg__0\(8),
      I3 => \r_COM_COUNTER_reg__0\(9),
      I4 => \FSM_sequential_r_SM_DISPLAY[1]_i_8_n_0\,
      O => \r_COM_COUNTER[0]_i_6_n_0\
    );
\r_COM_COUNTER[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      O => \r_COM_COUNTER[0]_i_8_n_0\
    );
\r_COM_COUNTER_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[0]_i_2_n_7\,
      Q => r_COM_COUNTER_reg(0),
      R => '0'
    );
\r_COM_COUNTER_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \r_COM_COUNTER_reg[0]_i_2_n_0\,
      CO(2 downto 0) => \NLW_r_COM_COUNTER_reg[0]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \r_COM_COUNTER_reg[0]_i_2_n_4\,
      O(2) => \r_COM_COUNTER_reg[0]_i_2_n_5\,
      O(1) => \r_COM_COUNTER_reg[0]_i_2_n_6\,
      O(0) => \r_COM_COUNTER_reg[0]_i_2_n_7\,
      S(3 downto 1) => r_COM_COUNTER_reg(3 downto 1),
      S(0) => \r_COM_COUNTER[0]_i_8_n_0\
    );
\r_COM_COUNTER_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[8]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(10),
      R => '0'
    );
\r_COM_COUNTER_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[8]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(11),
      R => '0'
    );
\r_COM_COUNTER_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[12]_i_1_n_7\,
      Q => \r_COM_COUNTER_reg__0\(12),
      R => '0'
    );
\r_COM_COUNTER_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_COM_COUNTER_reg[8]_i_1_n_0\,
      CO(3) => \r_COM_COUNTER_reg[12]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_COM_COUNTER_reg[12]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_COM_COUNTER_reg[12]_i_1_n_4\,
      O(2) => \r_COM_COUNTER_reg[12]_i_1_n_5\,
      O(1) => \r_COM_COUNTER_reg[12]_i_1_n_6\,
      O(0) => \r_COM_COUNTER_reg[12]_i_1_n_7\,
      S(3 downto 0) => \r_COM_COUNTER_reg__0\(15 downto 12)
    );
\r_COM_COUNTER_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[12]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(13),
      R => '0'
    );
\r_COM_COUNTER_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[12]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(14),
      R => '0'
    );
\r_COM_COUNTER_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[12]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(15),
      R => '0'
    );
\r_COM_COUNTER_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[16]_i_1_n_7\,
      Q => \r_COM_COUNTER_reg__0\(16),
      R => '0'
    );
\r_COM_COUNTER_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_COM_COUNTER_reg[12]_i_1_n_0\,
      CO(3) => \r_COM_COUNTER_reg[16]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_COM_COUNTER_reg[16]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_COM_COUNTER_reg[16]_i_1_n_4\,
      O(2) => \r_COM_COUNTER_reg[16]_i_1_n_5\,
      O(1) => \r_COM_COUNTER_reg[16]_i_1_n_6\,
      O(0) => \r_COM_COUNTER_reg[16]_i_1_n_7\,
      S(3 downto 0) => \r_COM_COUNTER_reg__0\(19 downto 16)
    );
\r_COM_COUNTER_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[16]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(17),
      R => '0'
    );
\r_COM_COUNTER_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[16]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(18),
      R => '0'
    );
\r_COM_COUNTER_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[16]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(19),
      R => '0'
    );
\r_COM_COUNTER_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[0]_i_2_n_6\,
      Q => r_COM_COUNTER_reg(1),
      R => '0'
    );
\r_COM_COUNTER_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[20]_i_1_n_7\,
      Q => \r_COM_COUNTER_reg__0\(20),
      R => '0'
    );
\r_COM_COUNTER_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_COM_COUNTER_reg[16]_i_1_n_0\,
      CO(3) => \r_COM_COUNTER_reg[20]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_COM_COUNTER_reg[20]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_COM_COUNTER_reg[20]_i_1_n_4\,
      O(2) => \r_COM_COUNTER_reg[20]_i_1_n_5\,
      O(1) => \r_COM_COUNTER_reg[20]_i_1_n_6\,
      O(0) => \r_COM_COUNTER_reg[20]_i_1_n_7\,
      S(3 downto 0) => \r_COM_COUNTER_reg__0\(23 downto 20)
    );
\r_COM_COUNTER_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[20]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(21),
      R => '0'
    );
\r_COM_COUNTER_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[20]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(22),
      R => '0'
    );
\r_COM_COUNTER_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[20]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(23),
      R => '0'
    );
\r_COM_COUNTER_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[24]_i_1_n_7\,
      Q => \r_COM_COUNTER_reg__0\(24),
      R => '0'
    );
\r_COM_COUNTER_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_COM_COUNTER_reg[20]_i_1_n_0\,
      CO(3) => \r_COM_COUNTER_reg[24]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_COM_COUNTER_reg[24]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_COM_COUNTER_reg[24]_i_1_n_4\,
      O(2) => \r_COM_COUNTER_reg[24]_i_1_n_5\,
      O(1) => \r_COM_COUNTER_reg[24]_i_1_n_6\,
      O(0) => \r_COM_COUNTER_reg[24]_i_1_n_7\,
      S(3 downto 0) => \r_COM_COUNTER_reg__0\(27 downto 24)
    );
\r_COM_COUNTER_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[24]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(25),
      R => '0'
    );
\r_COM_COUNTER_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[24]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(26),
      R => '0'
    );
\r_COM_COUNTER_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[24]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(27),
      R => '0'
    );
\r_COM_COUNTER_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[28]_i_1_n_7\,
      Q => \r_COM_COUNTER_reg__0\(28),
      R => '0'
    );
\r_COM_COUNTER_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_COM_COUNTER_reg[24]_i_1_n_0\,
      CO(3 downto 0) => \NLW_r_COM_COUNTER_reg[28]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_COM_COUNTER_reg[28]_i_1_n_4\,
      O(2) => \r_COM_COUNTER_reg[28]_i_1_n_5\,
      O(1) => \r_COM_COUNTER_reg[28]_i_1_n_6\,
      O(0) => \r_COM_COUNTER_reg[28]_i_1_n_7\,
      S(3 downto 0) => \r_COM_COUNTER_reg__0\(31 downto 28)
    );
\r_COM_COUNTER_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[28]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(29),
      R => '0'
    );
\r_COM_COUNTER_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[0]_i_2_n_5\,
      Q => r_COM_COUNTER_reg(2),
      R => '0'
    );
\r_COM_COUNTER_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[28]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(30),
      R => '0'
    );
\r_COM_COUNTER_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[28]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(31),
      R => '0'
    );
\r_COM_COUNTER_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[0]_i_2_n_4\,
      Q => r_COM_COUNTER_reg(3),
      R => '0'
    );
\r_COM_COUNTER_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[4]_i_1_n_7\,
      Q => r_COM_COUNTER_reg(4),
      R => '0'
    );
\r_COM_COUNTER_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_COM_COUNTER_reg[0]_i_2_n_0\,
      CO(3) => \r_COM_COUNTER_reg[4]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_COM_COUNTER_reg[4]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_COM_COUNTER_reg[4]_i_1_n_4\,
      O(2) => \r_COM_COUNTER_reg[4]_i_1_n_5\,
      O(1) => \r_COM_COUNTER_reg[4]_i_1_n_6\,
      O(0) => \r_COM_COUNTER_reg[4]_i_1_n_7\,
      S(3 downto 1) => \r_COM_COUNTER_reg__0\(7 downto 5),
      S(0) => r_COM_COUNTER_reg(4)
    );
\r_COM_COUNTER_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[4]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(5),
      R => '0'
    );
\r_COM_COUNTER_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[4]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(6),
      R => '0'
    );
\r_COM_COUNTER_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[4]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(7),
      R => '0'
    );
\r_COM_COUNTER_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[8]_i_1_n_7\,
      Q => \r_COM_COUNTER_reg__0\(8),
      R => '0'
    );
\r_COM_COUNTER_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_COM_COUNTER_reg[4]_i_1_n_0\,
      CO(3) => \r_COM_COUNTER_reg[8]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_COM_COUNTER_reg[8]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_COM_COUNTER_reg[8]_i_1_n_4\,
      O(2) => \r_COM_COUNTER_reg[8]_i_1_n_5\,
      O(1) => \r_COM_COUNTER_reg[8]_i_1_n_6\,
      O(0) => \r_COM_COUNTER_reg[8]_i_1_n_7\,
      S(3 downto 0) => \r_COM_COUNTER_reg__0\(11 downto 8)
    );
\r_COM_COUNTER_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => I2C_CONTROLLER_n_3,
      D => \r_COM_COUNTER_reg[8]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(9),
      R => '0'
    );
\r_DATA_WR[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C808"
    )
        port map (
      I0 => g0_b3_n_0,
      I1 => \r_SM_DISPLAY__0\(0),
      I2 => \r_SM_DISPLAY__0\(1),
      I3 => r_DATA_WR(3),
      O => \r_DATA_WR[3]_i_1_n_0\
    );
\r_DATA_WR[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C808"
    )
        port map (
      I0 => g0_b4_n_0,
      I1 => \r_SM_DISPLAY__0\(0),
      I2 => \r_SM_DISPLAY__0\(1),
      I3 => r_DATA_WR(4),
      O => \r_DATA_WR[4]_i_1_n_0\
    );
\r_DATA_WR[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C808"
    )
        port map (
      I0 => g0_b6_n_0,
      I1 => \r_SM_DISPLAY__0\(0),
      I2 => \r_SM_DISPLAY__0\(1),
      I3 => r_DATA_WR(6),
      O => \r_DATA_WR[6]_i_1_n_0\
    );
\r_DATA_WR[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \r_SM_DISPLAY__0\(1),
      I1 => \r_SM_DISPLAY__0\(0),
      O => \r_DATA_WR[7]_i_1_n_0\
    );
\r_DATA_WR[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \r_SM_DISPLAY__0\(0),
      I1 => \r_SM_DISPLAY__0\(1),
      O => \r_DATA_WR[7]_i_2_n_0\
    );
\r_DATA_WR_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \r_DATA_WR[7]_i_2_n_0\,
      D => g0_b0_n_0,
      Q => r_DATA_WR(0),
      S => \r_DATA_WR[7]_i_1_n_0\
    );
\r_DATA_WR_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \r_DATA_WR[7]_i_2_n_0\,
      D => g0_b1_n_0,
      Q => r_DATA_WR(1),
      S => \r_DATA_WR[7]_i_1_n_0\
    );
\r_DATA_WR_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \r_DATA_WR[7]_i_2_n_0\,
      D => g0_b2_n_0,
      Q => r_DATA_WR(2),
      S => \r_DATA_WR[7]_i_1_n_0\
    );
\r_DATA_WR_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => \r_DATA_WR[3]_i_1_n_0\,
      Q => r_DATA_WR(3),
      R => '0'
    );
\r_DATA_WR_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => \r_DATA_WR[4]_i_1_n_0\,
      Q => r_DATA_WR(4),
      R => '0'
    );
\r_DATA_WR_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \r_DATA_WR[7]_i_2_n_0\,
      D => g0_b5_n_0,
      Q => r_DATA_WR(5),
      S => \r_DATA_WR[7]_i_1_n_0\
    );
\r_DATA_WR_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => \r_DATA_WR[6]_i_1_n_0\,
      Q => r_DATA_WR(6),
      R => '0'
    );
\r_DATA_WR_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => \r_DATA_WR[7]_i_2_n_0\,
      D => g0_b7_n_0,
      Q => r_DATA_WR(7),
      S => \r_DATA_WR[7]_i_1_n_0\
    );
r_ENA_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => I2C_CONTROLLER_n_4,
      Q => r_ENA_reg_n_0,
      R => '0'
    );
r_PREV_BUSY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clck_IBUF_BUFG,
      CE => '1',
      D => w_BUSY,
      Q => r_PREV_BUSY,
      R => '0'
    );
end STRUCTURE;
