-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Jun 13 14:56:25 2023
-- Host        : LAPTOP-IT23Q15D running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/git/git
--               repositories/CHIP8-FPGA/Vivado/Display-Test/Display-Test.sim/sim_1/impl/func/xsim/display_tb_func_impl.vhd}
-- Design      : display
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_50hz_clk_wiz is
  port (
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    i_clck : in STD_LOGIC
  );
end clk_50hz_clk_wiz;

architecture STRUCTURE of clk_50hz_clk_wiz is
  signal clk_out1_clk_50hz : STD_LOGIC;
  signal clkfbout_buf_clk_50hz : STD_LOGIC;
  signal clkfbout_clk_50hz : STD_LOGIC;
  signal i_clck_clk_50hz : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufg : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clk_50hz,
      O => clkfbout_buf_clk_50hz
    );
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE",
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => i_clck,
      O => i_clck_clk_50hz
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out1_clk_50hz,
      O => clk_out1
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 10.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 10.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 20.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 1,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_clk_50hz,
      CLKFBOUT => clkfbout_clk_50hz,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => i_clck_clk_50hz,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_out1_clk_50hz,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_master is
  port (
    \r_SM_DISPLAY_reg[2]\ : out STD_LOGIC;
    \r_SM_DISPLAY_reg[1]\ : out STD_LOGIC;
    \r_SM_DISPLAY_reg[0]\ : out STD_LOGIC;
    \r_REFRESH_COUNTER_reg[21]\ : out STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_0\ : out STD_LOGIC;
    busy_reg_0 : out STD_LOGIC;
    w_BUSY : out STD_LOGIC;
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    r_PREV_BUSY_reg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    r_PREV_BUSY_reg_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    r_PREV_BUSY_reg_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    r_PREV_BUSY_reg_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    r_PREV_BUSY_reg_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    r_PREV_BUSY_reg_4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    r_PREV_BUSY_reg_5 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    busy_reg_1 : out STD_LOGIC;
    sel : out STD_LOGIC;
    r_START_PIXEL_DATA_reg : out STD_LOGIC;
    r_ENA_reg : out STD_LOGIC;
    o_oled_sda_TRI : out STD_LOGIC;
    o_oled_scl_TRI : out STD_LOGIC;
    o_oled_sda_OBUF : out STD_LOGIC;
    \r_SM_DISPLAY_reg[2]_0\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[2]_1\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[2]_2\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[1]_0\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_1\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_2\ : in STD_LOGIC;
    \r_REFRESH_COUNTER_reg[1]\ : in STD_LOGIC;
    \r_REFRESH_COUNTER_reg[1]_0\ : in STD_LOGIC;
    \r_REFRESH_COUNTER_reg[1]_1\ : in STD_LOGIC;
    r_PREV_BUSY : in STD_LOGIC;
    \r_REFRESH_COUNTER_reg[0]\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_3\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_4\ : in STD_LOGIC;
    locked : in STD_LOGIC;
    r_START_PIXEL_DATA_reg_0 : in STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_5\ : in STD_LOGIC;
    \r_COM_COUNTER_reg[31]\ : in STD_LOGIC;
    r_PIXEL_COUNTER0 : in STD_LOGIC_VECTOR ( 30 downto 0 );
    r_PIXEL_COUNTER_reg_3_sp_1 : in STD_LOGIC;
    r_PIXEL_COUNTER_reg : in STD_LOGIC_VECTOR ( 31 downto 0 );
    r_START_PIXEL_DATA_reg_1 : in STD_LOGIC;
    r_START_PIXEL_DATA : in STD_LOGIC;
    r_ENA_reg_0 : in STD_LOGIC;
    sda_int_reg_0 : in STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_6\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_7\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_8\ : in STD_LOGIC;
    \r_SM_DISPLAY_reg[0]_9\ : in STD_LOGIC;
    clk_out1 : in STD_LOGIC;
    o_oled_scl_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 )
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
  signal addr_rw0 : STD_LOGIC;
  signal \bit_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal busy1 : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal busy_i_2_n_0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \count[4]_i_2_n_0\ : STD_LOGIC;
  signal \count[4]_i_3_n_0\ : STD_LOGIC;
  signal \count[5]_i_2_n_0\ : STD_LOGIC;
  signal \count[5]_i_3_n_0\ : STD_LOGIC;
  signal \count[6]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_reg_n_0_[6]\ : STD_LOGIC;
  signal data_clk : STD_LOGIC;
  signal data_clk_i_2_n_0 : STD_LOGIC;
  signal data_clk_prev : STD_LOGIC;
  signal data_clk_reg_n_0 : STD_LOGIC;
  signal data_tx : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal r_ENA_i_3_n_0 : STD_LOGIC;
  signal r_ENA_i_4_n_0 : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_4_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_5_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_6_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_7_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_8_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[12]_i_2_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[12]_i_3_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[12]_i_4_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[12]_i_5_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[16]_i_2_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[16]_i_3_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[16]_i_4_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[16]_i_5_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[20]_i_2_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[20]_i_3_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[20]_i_4_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[20]_i_5_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[24]_i_2_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[24]_i_3_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[24]_i_4_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[24]_i_5_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[28]_i_2_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[28]_i_3_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[28]_i_4_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[28]_i_5_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[4]_i_3_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[4]_i_4_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[4]_i_5_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[8]_i_2_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[8]_i_3_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[8]_i_4_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[8]_i_5_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal r_PIXEL_COUNTER_reg_3_sn_1 : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_13_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_15_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_16_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_3_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_5_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_6_n_0\ : STD_LOGIC;
  signal \^r_sm_display_reg[0]_0\ : STD_LOGIC;
  signal r_START_PIXEL_DATA_i_2_n_0 : STD_LOGIC;
  signal r_START_PIXEL_DATA_i_3_n_0 : STD_LOGIC;
  signal r_START_PIXEL_DATA_i_5_n_0 : STD_LOGIC;
  signal r_START_PIXEL_DATA_i_6_n_0 : STD_LOGIC;
  signal scl_clk : STD_LOGIC;
  signal scl_clk_reg_n_0 : STD_LOGIC;
  signal scl_ena_i_1_n_0 : STD_LOGIC;
  signal scl_ena_reg_n_0 : STD_LOGIC;
  signal sda_int : STD_LOGIC;
  signal sda_int_i_10_n_0 : STD_LOGIC;
  signal sda_int_i_11_n_0 : STD_LOGIC;
  signal sda_int_i_12_n_0 : STD_LOGIC;
  signal sda_int_i_13_n_0 : STD_LOGIC;
  signal sda_int_i_1_n_0 : STD_LOGIC;
  signal sda_int_i_3_n_0 : STD_LOGIC;
  signal sda_int_i_5_n_0 : STD_LOGIC;
  signal sda_int_i_6_n_0 : STD_LOGIC;
  signal sda_int_i_8_n_0 : STD_LOGIC;
  signal sda_int_i_9_n_0 : STD_LOGIC;
  signal sda_int_reg_i_4_n_0 : STD_LOGIC;
  signal sda_int_reg_i_7_n_0 : STD_LOGIC;
  signal sda_int_reg_n_0 : STD_LOGIC;
  signal stretch_i_1_n_0 : STD_LOGIC;
  signal stretch_i_2_n_0 : STD_LOGIC;
  signal stretch_i_3_n_0 : STD_LOGIC;
  signal stretch_reg_n_0 : STD_LOGIC;
  signal \^w_busy\ : STD_LOGIC;
  signal \NLW_r_PIXEL_COUNTER_reg[0]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_onehot_state[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_onehot_state[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_onehot_state[8]_i_2\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[4]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[5]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[8]\ : label is "slv_ack1:000001000,wr:000010000,command:000000100,start:000000010,ready:000000001,mstr_ack:010000000,slv_ack2:000100000,stop:100000000,rd:001000000";
  attribute \PinAttr:I0:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I0:HOLD_DETOUR\ of \count[3]_i_1\ : label is 196;
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair3";
  attribute \PinAttr:I1:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I1:HOLD_DETOUR\ of \count[4]_i_1\ : label is 196;
  attribute SOFT_HLUTNM of \count[4]_i_1\ : label is "soft_lutpair3";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[8]_i_1\ : label is 11;
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of stretch_i_1 : label is "RETARGET";
begin
  r_PIXEL_COUNTER_reg_3_sn_1 <= r_PIXEL_COUNTER_reg_3_sp_1;
  \r_SM_DISPLAY_reg[0]_0\ <= \^r_sm_display_reg[0]_0\;
  w_BUSY <= \^w_busy\;
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[8]\,
      I1 => sda_int_reg_0,
      I2 => \FSM_onehot_state_reg_n_0_[0]\,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sda_int_reg_0,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEAAAA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \bit_cnt__0\(2),
      I2 => \bit_cnt__0\(1),
      I3 => \bit_cnt__0\(0),
      I4 => \FSM_onehot_state_reg_n_0_[2]\,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \bit_cnt__0\(0),
      I2 => \bit_cnt__0\(1),
      I3 => \bit_cnt__0\(2),
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_state[4]_i_2_n_0\,
      I2 => sda_int_reg_0,
      I3 => \FSM_onehot_state_reg_n_0_[5]\,
      I4 => \FSM_onehot_state_reg_n_0_[3]\,
      O => \FSM_onehot_state[4]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \bit_cnt__0\(2),
      I1 => \bit_cnt__0\(1),
      I2 => \bit_cnt__0\(0),
      O => \FSM_onehot_state[4]_i_2_n_0\
    );
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => \bit_cnt__0\(0),
      I2 => \bit_cnt__0\(1),
      I3 => \bit_cnt__0\(2),
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
      I0 => sda_int_reg_0,
      I1 => \FSM_onehot_state_reg_n_0_[5]\,
      O => \FSM_onehot_state[8]_i_2_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_out1,
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
      C => clk_out1,
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
      C => clk_out1,
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
      C => clk_out1,
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
      C => clk_out1,
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
      C => clk_out1,
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
      C => clk_out1,
      CE => busy1,
      D => \FSM_onehot_state[8]_i_2_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[8]\,
      R => '0'
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
      I4 => \bit_cnt__0\(0),
      O => \bit_cnt[0]_i_1_n_0\
    );
\bit_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFEFFF10101000"
    )
        port map (
      I0 => \bit_cnt__0\(0),
      I1 => data_clk_prev,
      I2 => data_clk_reg_n_0,
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_state_reg_n_0_[4]\,
      I5 => \bit_cnt__0\(1),
      O => \bit_cnt[1]_i_1_n_0\
    );
\bit_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFEFFF10101000"
    )
        port map (
      I0 => \bit_cnt__0\(1),
      I1 => \bit_cnt__0\(0),
      I2 => busy1,
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_state_reg_n_0_[4]\,
      I5 => \bit_cnt__0\(2),
      O => \bit_cnt[2]_i_1_n_0\
    );
\bit_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \bit_cnt[0]_i_1_n_0\,
      Q => \bit_cnt__0\(0),
      R => '0'
    );
\bit_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \bit_cnt[1]_i_1_n_0\,
      Q => \bit_cnt__0\(1),
      R => '0'
    );
\bit_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \bit_cnt[2]_i_1_n_0\,
      Q => \bit_cnt__0\(2),
      R => '0'
    );
busy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEAFF0000EA00"
    )
        port map (
      I0 => sda_int_i_3_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => sda_int_reg_0,
      I3 => busy1,
      I4 => busy_i_2_n_0,
      I5 => \^w_busy\,
      O => busy_i_1_n_0
    );
busy_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100010001"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => \FSM_onehot_state_reg_n_0_[8]\,
      I4 => \FSM_onehot_state_reg_n_0_[5]\,
      I5 => sda_int_reg_0,
      O => busy_i_2_n_0
    );
busy_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => busy_i_1_n_0,
      Q => \^w_busy\,
      R => '0'
    );
\count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFF00000000FFFF"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count[6]_i_2_n_0\,
      I2 => \count_reg_n_0_[6]\,
      I3 => \count_reg_n_0_[1]\,
      I4 => stretch_reg_n_0,
      I5 => \count_reg_n_0_[0]\,
      O => count(0)
    );
\count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF700005555AAAA"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[6]\,
      I2 => \count[6]_i_2_n_0\,
      I3 => \count_reg_n_0_[2]\,
      I4 => \count_reg_n_0_[1]\,
      I5 => stretch_reg_n_0,
      O => count(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF000000007FFF"
    )
        port map (
      I0 => \count_reg_n_0_[5]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[4]\,
      I3 => \count_reg_n_0_[6]\,
      I4 => \count[4]_i_2_n_0\,
      I5 => \count_reg_n_0_[2]\,
      O => count(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF220522"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count[4]_i_2_n_0\,
      I2 => \count_reg_n_0_[4]\,
      I3 => \count_reg_n_0_[3]\,
      I4 => \count[4]_i_3_n_0\,
      O => count(3)
    );
\count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF085508"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count[4]_i_2_n_0\,
      I3 => \count_reg_n_0_[4]\,
      I4 => \count[4]_i_3_n_0\,
      O => count(4)
    );
\count[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => stretch_reg_n_0,
      O => \count[4]_i_2_n_0\
    );
\count[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C5FFFFFFCFFFFFFF"
    )
        port map (
      I0 => \count_reg_n_0_[5]\,
      I1 => stretch_reg_n_0,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[1]\,
      I4 => \count_reg_n_0_[0]\,
      I5 => \count_reg_n_0_[6]\,
      O => \count[4]_i_3_n_0\
    );
\count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000EAEF1010"
    )
        port map (
      I0 => \count[5]_i_2_n_0\,
      I1 => stretch_reg_n_0,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[6]\,
      I4 => \count_reg_n_0_[5]\,
      I5 => \count[5]_i_3_n_0\,
      O => count(5)
    );
\count[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      O => \count[5]_i_2_n_0\
    );
\count[5]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[4]\,
      O => \count[5]_i_3_n_0\
    );
\count[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00008FFF2000"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => stretch_reg_n_0,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[1]\,
      I4 => \count_reg_n_0_[6]\,
      I5 => \count[6]_i_2_n_0\,
      O => count(6)
    );
\count[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[5]\,
      O => \count[6]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => count(0),
      Q => \count_reg_n_0_[0]\,
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => count(1),
      Q => \count_reg_n_0_[1]\,
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => count(2),
      Q => \count_reg_n_0_[2]\,
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => count(3),
      Q => \count_reg_n_0_[3]\,
      R => '0'
    );
\count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => count(4),
      Q => \count_reg_n_0_[4]\,
      R => '0'
    );
\count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => count(5),
      Q => \count_reg_n_0_[5]\,
      R => '0'
    );
\count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => count(6),
      Q => \count_reg_n_0_[6]\,
      R => '0'
    );
data_clk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55550004AAAAFABA"
    )
        port map (
      I0 => \count_reg_n_0_[5]\,
      I1 => stretch_reg_n_0,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => data_clk_i_2_n_0,
      I5 => \count_reg_n_0_[6]\,
      O => data_clk
    );
data_clk_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      O => data_clk_i_2_n_0
    );
data_clk_prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
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
      C => clk_out1,
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
      I2 => sda_int_reg_0,
      I3 => \FSM_onehot_state_reg_n_0_[0]\,
      I4 => \FSM_onehot_state_reg_n_0_[5]\,
      O => addr_rw0
    );
\data_tx_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => addr_rw0,
      D => Q(0),
      Q => data_tx(0),
      R => '0'
    );
\data_tx_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => addr_rw0,
      D => Q(1),
      Q => data_tx(1),
      R => '0'
    );
\data_tx_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => addr_rw0,
      D => Q(2),
      Q => data_tx(2),
      R => '0'
    );
\data_tx_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => addr_rw0,
      D => Q(3),
      Q => data_tx(3),
      R => '0'
    );
\data_tx_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => addr_rw0,
      D => Q(4),
      Q => data_tx(4),
      R => '0'
    );
\data_tx_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => addr_rw0,
      D => Q(5),
      Q => data_tx(5),
      R => '0'
    );
\data_tx_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => addr_rw0,
      D => Q(6),
      Q => data_tx(6),
      R => '0'
    );
\data_tx_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => addr_rw0,
      D => Q(7),
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
      INIT => X"0000200000000000"
    )
        port map (
      I0 => \^w_busy\,
      I1 => r_PREV_BUSY,
      I2 => \r_SM_DISPLAY_reg[1]_0\,
      I3 => \r_SM_DISPLAY_reg[0]_2\,
      I4 => \r_SM_DISPLAY_reg[2]_2\,
      I5 => \r_COM_COUNTER_reg[31]\,
      O => sel
    );
r_ENA_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
        port map (
      I0 => r_ENA_reg_0,
      I1 => r_ENA_i_3_n_0,
      I2 => r_START_PIXEL_DATA_reg_0,
      I3 => r_ENA_i_4_n_0,
      I4 => r_START_PIXEL_DATA_i_5_n_0,
      I5 => sda_int_reg_0,
      O => r_ENA_reg
    );
r_ENA_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000055555555"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[2]_2\,
      I1 => \r_SM_DISPLAY_reg[0]_4\,
      I2 => \r_SM_DISPLAY_reg[0]_3\,
      I3 => \r_SM_DISPLAY[2]_i_13_n_0\,
      I4 => \r_SM_DISPLAY_reg[1]_0\,
      I5 => \r_SM_DISPLAY_reg[0]_2\,
      O => r_ENA_i_3_n_0
    );
r_ENA_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFFFFFF"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[1]_0\,
      I1 => \r_SM_DISPLAY_reg[2]_2\,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => \r_SM_DISPLAY_reg[0]_2\,
      O => r_ENA_i_4_n_0
    );
\r_PIXEL_COUNTER[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000018000000"
    )
        port map (
      I0 => r_START_PIXEL_DATA_reg_0,
      I1 => \^w_busy\,
      I2 => r_PREV_BUSY,
      I3 => \r_SM_DISPLAY_reg[0]_2\,
      I4 => \r_SM_DISPLAY_reg[2]_2\,
      I5 => \r_SM_DISPLAY_reg[1]_0\,
      O => busy_reg_1
    );
\r_PIXEL_COUNTER[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^w_busy\,
      I1 => r_PREV_BUSY,
      O => \r_PIXEL_COUNTER[0]_i_4_n_0\
    );
\r_PIXEL_COUNTER[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(2),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(3),
      O => \r_PIXEL_COUNTER[0]_i_5_n_0\
    );
\r_PIXEL_COUNTER[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(1),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(2),
      O => \r_PIXEL_COUNTER[0]_i_6_n_0\
    );
\r_PIXEL_COUNTER[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(0),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(1),
      O => \r_PIXEL_COUNTER[0]_i_7_n_0\
    );
\r_PIXEL_COUNTER[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5155"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(0),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => \^w_busy\,
      I3 => r_PREV_BUSY,
      O => \r_PIXEL_COUNTER[0]_i_8_n_0\
    );
\r_PIXEL_COUNTER[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(14),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(15),
      O => \r_PIXEL_COUNTER[12]_i_2_n_0\
    );
\r_PIXEL_COUNTER[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(13),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(14),
      O => \r_PIXEL_COUNTER[12]_i_3_n_0\
    );
\r_PIXEL_COUNTER[12]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(12),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(13),
      O => \r_PIXEL_COUNTER[12]_i_4_n_0\
    );
\r_PIXEL_COUNTER[12]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(11),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(12),
      O => \r_PIXEL_COUNTER[12]_i_5_n_0\
    );
\r_PIXEL_COUNTER[16]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(18),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(19),
      O => \r_PIXEL_COUNTER[16]_i_2_n_0\
    );
\r_PIXEL_COUNTER[16]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(17),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(18),
      O => \r_PIXEL_COUNTER[16]_i_3_n_0\
    );
\r_PIXEL_COUNTER[16]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(16),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(17),
      O => \r_PIXEL_COUNTER[16]_i_4_n_0\
    );
\r_PIXEL_COUNTER[16]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(15),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(16),
      O => \r_PIXEL_COUNTER[16]_i_5_n_0\
    );
\r_PIXEL_COUNTER[20]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(22),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(23),
      O => \r_PIXEL_COUNTER[20]_i_2_n_0\
    );
\r_PIXEL_COUNTER[20]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(21),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(22),
      O => \r_PIXEL_COUNTER[20]_i_3_n_0\
    );
\r_PIXEL_COUNTER[20]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(20),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(21),
      O => \r_PIXEL_COUNTER[20]_i_4_n_0\
    );
\r_PIXEL_COUNTER[20]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(19),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(20),
      O => \r_PIXEL_COUNTER[20]_i_5_n_0\
    );
\r_PIXEL_COUNTER[24]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(26),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(27),
      O => \r_PIXEL_COUNTER[24]_i_2_n_0\
    );
\r_PIXEL_COUNTER[24]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(25),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(26),
      O => \r_PIXEL_COUNTER[24]_i_3_n_0\
    );
\r_PIXEL_COUNTER[24]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(24),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(25),
      O => \r_PIXEL_COUNTER[24]_i_4_n_0\
    );
\r_PIXEL_COUNTER[24]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(23),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(24),
      O => \r_PIXEL_COUNTER[24]_i_5_n_0\
    );
\r_PIXEL_COUNTER[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(30),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(31),
      O => \r_PIXEL_COUNTER[28]_i_2_n_0\
    );
\r_PIXEL_COUNTER[28]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(29),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(30),
      O => \r_PIXEL_COUNTER[28]_i_3_n_0\
    );
\r_PIXEL_COUNTER[28]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(28),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(29),
      O => \r_PIXEL_COUNTER[28]_i_4_n_0\
    );
\r_PIXEL_COUNTER[28]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(27),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(28),
      O => \r_PIXEL_COUNTER[28]_i_5_n_0\
    );
\r_PIXEL_COUNTER[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(6),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(7),
      O => \r_PIXEL_COUNTER[4]_i_2_n_0\
    );
\r_PIXEL_COUNTER[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(5),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(6),
      O => \r_PIXEL_COUNTER[4]_i_3_n_0\
    );
\r_PIXEL_COUNTER[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(4),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(5),
      O => \r_PIXEL_COUNTER[4]_i_4_n_0\
    );
\r_PIXEL_COUNTER[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(3),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(4),
      O => \r_PIXEL_COUNTER[4]_i_5_n_0\
    );
\r_PIXEL_COUNTER[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(10),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(11),
      O => \r_PIXEL_COUNTER[8]_i_2_n_0\
    );
\r_PIXEL_COUNTER[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(9),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(10),
      O => \r_PIXEL_COUNTER[8]_i_3_n_0\
    );
\r_PIXEL_COUNTER[8]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(8),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(9),
      O => \r_PIXEL_COUNTER[8]_i_4_n_0\
    );
\r_PIXEL_COUNTER[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F0020"
    )
        port map (
      I0 => r_PIXEL_COUNTER0(7),
      I1 => r_PIXEL_COUNTER_reg_3_sn_1,
      I2 => r_PREV_BUSY,
      I3 => \^w_busy\,
      I4 => r_PIXEL_COUNTER_reg(8),
      O => \r_PIXEL_COUNTER[8]_i_5_n_0\
    );
\r_PIXEL_COUNTER_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \r_PIXEL_COUNTER_reg[0]_i_2_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[0]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \r_PIXEL_COUNTER[0]_i_4_n_0\,
      O(3 downto 0) => O(3 downto 0),
      S(3) => \r_PIXEL_COUNTER[0]_i_5_n_0\,
      S(2) => \r_PIXEL_COUNTER[0]_i_6_n_0\,
      S(1) => \r_PIXEL_COUNTER[0]_i_7_n_0\,
      S(0) => \r_PIXEL_COUNTER[0]_i_8_n_0\
    );
\r_PIXEL_COUNTER_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[8]_i_1_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[12]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[12]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PREV_BUSY_reg_1(3 downto 0),
      S(3) => \r_PIXEL_COUNTER[12]_i_2_n_0\,
      S(2) => \r_PIXEL_COUNTER[12]_i_3_n_0\,
      S(1) => \r_PIXEL_COUNTER[12]_i_4_n_0\,
      S(0) => \r_PIXEL_COUNTER[12]_i_5_n_0\
    );
\r_PIXEL_COUNTER_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[12]_i_1_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[16]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[16]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PREV_BUSY_reg_2(3 downto 0),
      S(3) => \r_PIXEL_COUNTER[16]_i_2_n_0\,
      S(2) => \r_PIXEL_COUNTER[16]_i_3_n_0\,
      S(1) => \r_PIXEL_COUNTER[16]_i_4_n_0\,
      S(0) => \r_PIXEL_COUNTER[16]_i_5_n_0\
    );
\r_PIXEL_COUNTER_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[16]_i_1_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[20]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[20]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PREV_BUSY_reg_3(3 downto 0),
      S(3) => \r_PIXEL_COUNTER[20]_i_2_n_0\,
      S(2) => \r_PIXEL_COUNTER[20]_i_3_n_0\,
      S(1) => \r_PIXEL_COUNTER[20]_i_4_n_0\,
      S(0) => \r_PIXEL_COUNTER[20]_i_5_n_0\
    );
\r_PIXEL_COUNTER_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[20]_i_1_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[24]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[24]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PREV_BUSY_reg_4(3 downto 0),
      S(3) => \r_PIXEL_COUNTER[24]_i_2_n_0\,
      S(2) => \r_PIXEL_COUNTER[24]_i_3_n_0\,
      S(1) => \r_PIXEL_COUNTER[24]_i_4_n_0\,
      S(0) => \r_PIXEL_COUNTER[24]_i_5_n_0\
    );
\r_PIXEL_COUNTER_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[24]_i_1_n_0\,
      CO(3 downto 0) => \NLW_r_PIXEL_COUNTER_reg[28]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PREV_BUSY_reg_5(3 downto 0),
      S(3) => \r_PIXEL_COUNTER[28]_i_2_n_0\,
      S(2) => \r_PIXEL_COUNTER[28]_i_3_n_0\,
      S(1) => \r_PIXEL_COUNTER[28]_i_4_n_0\,
      S(0) => \r_PIXEL_COUNTER[28]_i_5_n_0\
    );
\r_PIXEL_COUNTER_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[0]_i_2_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[4]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[4]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PREV_BUSY_reg(3 downto 0),
      S(3) => \r_PIXEL_COUNTER[4]_i_2_n_0\,
      S(2) => \r_PIXEL_COUNTER[4]_i_3_n_0\,
      S(1) => \r_PIXEL_COUNTER[4]_i_4_n_0\,
      S(0) => \r_PIXEL_COUNTER[4]_i_5_n_0\
    );
\r_PIXEL_COUNTER_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[4]_i_1_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[8]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[8]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PREV_BUSY_reg_0(3 downto 0),
      S(3) => \r_PIXEL_COUNTER[8]_i_2_n_0\,
      S(2) => \r_PIXEL_COUNTER[8]_i_3_n_0\,
      S(1) => \r_PIXEL_COUNTER[8]_i_4_n_0\,
      S(0) => \r_PIXEL_COUNTER[8]_i_5_n_0\
    );
\r_REFRESH_COUNTER[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFDF00000020"
    )
        port map (
      I0 => \^w_busy\,
      I1 => r_PREV_BUSY,
      I2 => \r_SM_DISPLAY_reg[2]_2\,
      I3 => \r_SM_DISPLAY_reg[1]_0\,
      I4 => \r_SM_DISPLAY_reg[0]_2\,
      I5 => \r_REFRESH_COUNTER_reg[0]\,
      O => busy_reg_0
    );
\r_REFRESH_COUNTER[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg[1]\,
      I1 => \r_REFRESH_COUNTER_reg[1]_0\,
      I2 => \r_REFRESH_COUNTER_reg[1]_1\,
      I3 => \^r_sm_display_reg[0]_0\,
      O => \r_REFRESH_COUNTER_reg[21]\
    );
\r_REFRESH_COUNTER[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[0]_2\,
      I1 => \r_SM_DISPLAY_reg[1]_0\,
      I2 => \r_SM_DISPLAY_reg[2]_2\,
      I3 => r_PREV_BUSY,
      I4 => \^w_busy\,
      O => \^r_sm_display_reg[0]_0\
    );
\r_SM_DISPLAY[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAEFFAAAAA200"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[0]_1\,
      I1 => \r_SM_DISPLAY[2]_i_3_n_0\,
      I2 => \r_SM_DISPLAY_reg[2]_1\,
      I3 => \r_SM_DISPLAY[2]_i_5_n_0\,
      I4 => \r_SM_DISPLAY[2]_i_6_n_0\,
      I5 => \r_SM_DISPLAY_reg[0]_2\,
      O => \r_SM_DISPLAY_reg[0]\
    );
\r_SM_DISPLAY[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555DFF55555100"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[2]_0\,
      I1 => \r_SM_DISPLAY[2]_i_3_n_0\,
      I2 => \r_SM_DISPLAY_reg[2]_1\,
      I3 => \r_SM_DISPLAY[2]_i_5_n_0\,
      I4 => \r_SM_DISPLAY[2]_i_6_n_0\,
      I5 => \r_SM_DISPLAY_reg[1]_0\,
      O => \r_SM_DISPLAY_reg[1]\
    );
\r_SM_DISPLAY[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAEFFAAAAA200"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[2]_0\,
      I1 => \r_SM_DISPLAY[2]_i_3_n_0\,
      I2 => \r_SM_DISPLAY_reg[2]_1\,
      I3 => \r_SM_DISPLAY[2]_i_5_n_0\,
      I4 => \r_SM_DISPLAY[2]_i_6_n_0\,
      I5 => \r_SM_DISPLAY_reg[2]_2\,
      O => \r_SM_DISPLAY_reg[2]\
    );
\r_SM_DISPLAY[2]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => r_PREV_BUSY,
      I1 => \^w_busy\,
      O => \r_SM_DISPLAY[2]_i_13_n_0\
    );
\r_SM_DISPLAY[2]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^w_busy\,
      I1 => r_PREV_BUSY,
      I2 => \r_SM_DISPLAY_reg[1]_0\,
      O => \r_SM_DISPLAY[2]_i_15_n_0\
    );
\r_SM_DISPLAY[2]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BCBF"
    )
        port map (
      I0 => r_PREV_BUSY,
      I1 => \r_SM_DISPLAY_reg[1]_0\,
      I2 => \^w_busy\,
      I3 => locked,
      O => \r_SM_DISPLAY[2]_i_16_n_0\
    );
\r_SM_DISPLAY[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFDFFFFFFFF"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[0]_6\,
      I1 => \r_SM_DISPLAY_reg[0]_7\,
      I2 => \r_SM_DISPLAY_reg[0]_8\,
      I3 => \r_SM_DISPLAY_reg[0]_9\,
      I4 => \^w_busy\,
      I5 => r_PREV_BUSY,
      O => \r_SM_DISPLAY[2]_i_3_n_0\
    );
\r_SM_DISPLAY[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAAB0000AAAA"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[0]_2\,
      I1 => \r_REFRESH_COUNTER_reg[1]\,
      I2 => \r_REFRESH_COUNTER_reg[1]_0\,
      I3 => \r_SM_DISPLAY[2]_i_13_n_0\,
      I4 => \r_SM_DISPLAY_reg[0]_5\,
      I5 => \r_REFRESH_COUNTER_reg[1]_1\,
      O => \r_SM_DISPLAY[2]_i_5_n_0\
    );
\r_SM_DISPLAY[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005557"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[0]_2\,
      I1 => \r_SM_DISPLAY[2]_i_15_n_0\,
      I2 => \r_SM_DISPLAY_reg[0]_3\,
      I3 => \r_SM_DISPLAY_reg[0]_4\,
      I4 => \r_SM_DISPLAY_reg[2]_2\,
      I5 => \r_SM_DISPLAY[2]_i_16_n_0\,
      O => \r_SM_DISPLAY[2]_i_6_n_0\
    );
r_START_PIXEL_DATA_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEFFFAAAA2000"
    )
        port map (
      I0 => r_START_PIXEL_DATA_i_2_n_0,
      I1 => r_START_PIXEL_DATA_reg_0,
      I2 => r_START_PIXEL_DATA_i_3_n_0,
      I3 => r_START_PIXEL_DATA_reg_1,
      I4 => r_START_PIXEL_DATA_i_5_n_0,
      I5 => r_START_PIXEL_DATA,
      O => r_START_PIXEL_DATA_reg
    );
r_START_PIXEL_DATA_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg[0]_2\,
      I1 => \^w_busy\,
      I2 => r_PREV_BUSY,
      O => r_START_PIXEL_DATA_i_2_n_0
    );
r_START_PIXEL_DATA_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => r_PREV_BUSY,
      I1 => \^w_busy\,
      O => r_START_PIXEL_DATA_i_3_n_0
    );
r_START_PIXEL_DATA_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg[1]\,
      I1 => \r_REFRESH_COUNTER_reg[1]_0\,
      I2 => r_START_PIXEL_DATA_i_6_n_0,
      I3 => \r_REFRESH_COUNTER_reg[1]_1\,
      I4 => \r_SM_DISPLAY_reg[0]_2\,
      O => r_START_PIXEL_DATA_i_5_n_0
    );
r_START_PIXEL_DATA_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \^w_busy\,
      I1 => r_PREV_BUSY,
      I2 => \r_SM_DISPLAY_reg[2]_2\,
      I3 => \r_SM_DISPLAY_reg[1]_0\,
      O => r_START_PIXEL_DATA_i_6_n_0
    );
scl_clk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACAEA4AEAAAAAEAA"
    )
        port map (
      I0 => \count_reg_n_0_[6]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count[6]_i_2_n_0\,
      I3 => \count_reg_n_0_[0]\,
      I4 => stretch_reg_n_0,
      I5 => \count_reg_n_0_[1]\,
      O => scl_clk
    );
scl_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
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
      C => clk_out1,
      CE => '1',
      D => scl_ena_i_1_n_0,
      Q => scl_ena_reg_n_0,
      R => '0'
    );
sda_int_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBFFF88888000"
    )
        port map (
      I0 => sda_int,
      I1 => busy1,
      I2 => \FSM_onehot_state_reg_n_0_[5]\,
      I3 => sda_int_reg_0,
      I4 => sda_int_i_3_n_0,
      I5 => sda_int_reg_n_0,
      O => sda_int_i_1_n_0
    );
sda_int_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => data_tx(0),
      I1 => data_tx(1),
      I2 => \bit_cnt__0\(0),
      I3 => \bit_cnt__0\(1),
      I4 => data_tx(2),
      I5 => data_tx(3),
      O => sda_int_i_10_n_0
    );
sda_int_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => data_tx(4),
      I1 => data_tx(5),
      I2 => \bit_cnt__0\(0),
      I3 => \bit_cnt__0\(1),
      I4 => data_tx(6),
      I5 => data_tx(7),
      O => sda_int_i_11_n_0
    );
sda_int_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data_tx(3),
      I1 => data_tx(2),
      I2 => \bit_cnt__0\(1),
      I3 => data_tx(1),
      I4 => \bit_cnt__0\(0),
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
      I2 => \bit_cnt__0\(1),
      I3 => data_tx(5),
      I4 => \bit_cnt__0\(0),
      I5 => data_tx(4),
      O => sda_int_i_13_n_0
    );
sda_int_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => sda_int_reg_i_4_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[5]\,
      I2 => sda_int_i_5_n_0,
      I3 => sda_int_i_6_n_0,
      I4 => \FSM_onehot_state_reg_n_0_[3]\,
      I5 => sda_int_reg_i_7_n_0,
      O => sda_int
    );
sda_int_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_state_reg_n_0_[2]\,
      I2 => \FSM_onehot_state_reg_n_0_[4]\,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      O => sda_int_i_3_n_0
    );
sda_int_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCEEEA00C"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_state_reg_n_0_[2]\,
      I2 => \bit_cnt__0\(0),
      I3 => \bit_cnt__0\(1),
      I4 => \bit_cnt__0\(2),
      I5 => \FSM_onehot_state_reg_n_0_[0]\,
      O => sda_int_i_5_n_0
    );
sda_int_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCC8888C0008888C"
    )
        port map (
      I0 => sda_int_i_10_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[4]\,
      I2 => \bit_cnt__0\(0),
      I3 => \bit_cnt__0\(1),
      I4 => \bit_cnt__0\(2),
      I5 => sda_int_i_11_n_0,
      O => sda_int_i_6_n_0
    );
sda_int_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => \bit_cnt__0\(1),
      I3 => Q(1),
      I4 => \bit_cnt__0\(0),
      I5 => Q(0),
      O => sda_int_i_8_n_0
    );
sda_int_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(7),
      I1 => Q(6),
      I2 => \bit_cnt__0\(1),
      I3 => Q(5),
      I4 => \bit_cnt__0\(0),
      I5 => Q(4),
      O => sda_int_i_9_n_0
    );
sda_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => sda_int_i_1_n_0,
      Q => sda_int_reg_n_0,
      R => '0'
    );
sda_int_reg_i_4: unisim.vcomponents.MUXF7
     port map (
      I0 => sda_int_i_8_n_0,
      I1 => sda_int_i_9_n_0,
      O => sda_int_reg_i_4_n_0,
      S => \bit_cnt__0\(2)
    );
sda_int_reg_i_7: unisim.vcomponents.MUXF7
     port map (
      I0 => sda_int_i_12_n_0,
      I1 => sda_int_i_13_n_0,
      O => sda_int_reg_i_7_n_0,
      S => \bit_cnt__0\(2)
    );
stretch_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555555F455F055F0"
    )
        port map (
      I0 => o_oled_scl_IBUF,
      I1 => \count_reg_n_0_[0]\,
      I2 => stretch_reg_n_0,
      I3 => stretch_i_2_n_0,
      I4 => \count_reg_n_0_[1]\,
      I5 => stretch_i_3_n_0,
      O => stretch_i_1_n_0
    );
stretch_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040404040444040"
    )
        port map (
      I0 => \count_reg_n_0_[5]\,
      I1 => \count_reg_n_0_[6]\,
      I2 => data_clk_i_2_n_0,
      I3 => \count_reg_n_0_[1]\,
      I4 => stretch_reg_n_0,
      I5 => \count_reg_n_0_[0]\,
      O => stretch_i_2_n_0
    );
stretch_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[5]\,
      I3 => \count_reg_n_0_[2]\,
      I4 => \count_reg_n_0_[6]\,
      O => stretch_i_3_n_0
    );
stretch_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => stretch_i_1_n_0,
      Q => stretch_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_50hz is
  port (
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    i_clck : in STD_LOGIC
  );
end clk_50hz;

architecture STRUCTURE of clk_50hz is
begin
inst: entity work.clk_50hz_clk_wiz
     port map (
      clk_out1 => clk_out1,
      i_clck => i_clck,
      locked => locked,
      reset => reset
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
  attribute ECO_CHECKSUM of display : entity is "6464cd85";
  attribute g_INPUT_CLOCK_FREQ : integer;
  attribute g_INPUT_CLOCK_FREQ of display : entity is 50000000;
end display;

architecture STRUCTURE of display is
  signal I2C_CONTROLLER_n_0 : STD_LOGIC;
  signal I2C_CONTROLLER_n_1 : STD_LOGIC;
  signal I2C_CONTROLLER_n_10 : STD_LOGIC;
  signal I2C_CONTROLLER_n_11 : STD_LOGIC;
  signal I2C_CONTROLLER_n_12 : STD_LOGIC;
  signal I2C_CONTROLLER_n_13 : STD_LOGIC;
  signal I2C_CONTROLLER_n_14 : STD_LOGIC;
  signal I2C_CONTROLLER_n_15 : STD_LOGIC;
  signal I2C_CONTROLLER_n_16 : STD_LOGIC;
  signal I2C_CONTROLLER_n_17 : STD_LOGIC;
  signal I2C_CONTROLLER_n_18 : STD_LOGIC;
  signal I2C_CONTROLLER_n_19 : STD_LOGIC;
  signal I2C_CONTROLLER_n_2 : STD_LOGIC;
  signal I2C_CONTROLLER_n_20 : STD_LOGIC;
  signal I2C_CONTROLLER_n_21 : STD_LOGIC;
  signal I2C_CONTROLLER_n_22 : STD_LOGIC;
  signal I2C_CONTROLLER_n_23 : STD_LOGIC;
  signal I2C_CONTROLLER_n_24 : STD_LOGIC;
  signal I2C_CONTROLLER_n_25 : STD_LOGIC;
  signal I2C_CONTROLLER_n_26 : STD_LOGIC;
  signal I2C_CONTROLLER_n_27 : STD_LOGIC;
  signal I2C_CONTROLLER_n_28 : STD_LOGIC;
  signal I2C_CONTROLLER_n_29 : STD_LOGIC;
  signal I2C_CONTROLLER_n_3 : STD_LOGIC;
  signal I2C_CONTROLLER_n_30 : STD_LOGIC;
  signal I2C_CONTROLLER_n_31 : STD_LOGIC;
  signal I2C_CONTROLLER_n_32 : STD_LOGIC;
  signal I2C_CONTROLLER_n_33 : STD_LOGIC;
  signal I2C_CONTROLLER_n_34 : STD_LOGIC;
  signal I2C_CONTROLLER_n_35 : STD_LOGIC;
  signal I2C_CONTROLLER_n_36 : STD_LOGIC;
  signal I2C_CONTROLLER_n_37 : STD_LOGIC;
  signal I2C_CONTROLLER_n_38 : STD_LOGIC;
  signal I2C_CONTROLLER_n_39 : STD_LOGIC;
  signal I2C_CONTROLLER_n_4 : STD_LOGIC;
  signal I2C_CONTROLLER_n_40 : STD_LOGIC;
  signal I2C_CONTROLLER_n_41 : STD_LOGIC;
  signal I2C_CONTROLLER_n_42 : STD_LOGIC;
  signal I2C_CONTROLLER_n_5 : STD_LOGIC;
  signal I2C_CONTROLLER_n_7 : STD_LOGIC;
  signal I2C_CONTROLLER_n_8 : STD_LOGIC;
  signal I2C_CONTROLLER_n_9 : STD_LOGIC;
  signal g0_b0_n_0 : STD_LOGIC;
  signal g0_b1_n_0 : STD_LOGIC;
  signal g0_b2_n_0 : STD_LOGIC;
  signal g0_b3_n_0 : STD_LOGIC;
  signal g0_b4_n_0 : STD_LOGIC;
  signal g0_b5_n_0 : STD_LOGIC;
  signal g0_b6_n_0 : STD_LOGIC;
  signal g0_b7_n_0 : STD_LOGIC;
  signal locked : STD_LOGIC;
  signal o_oled_scl_IBUF : STD_LOGIC;
  signal o_oled_scl_TRI : STD_LOGIC;
  signal o_oled_sda_OBUF : STD_LOGIC;
  signal o_oled_sda_TRI : STD_LOGIC;
  signal \r_COM_COUNTER[0]_i_3_n_0\ : STD_LOGIC;
  signal \r_COM_COUNTER[0]_i_4_n_0\ : STD_LOGIC;
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
  signal \r_DATA_WR[0]_i_2_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[1]_i_2_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[1]_i_3_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[1]_i_4_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[4]_i_2_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[5]_i_2_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[5]_i_3_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[5]_i_4_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[7]_i_1_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[7]_i_3_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[7]_i_4_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[7]_i_5_n_0\ : STD_LOGIC;
  signal \r_DATA_WR[7]_i_6_n_0\ : STD_LOGIC;
  signal \r_DATA_WR_reg_n_0_[0]\ : STD_LOGIC;
  signal \r_DATA_WR_reg_n_0_[1]\ : STD_LOGIC;
  signal \r_DATA_WR_reg_n_0_[2]\ : STD_LOGIC;
  signal \r_DATA_WR_reg_n_0_[3]\ : STD_LOGIC;
  signal \r_DATA_WR_reg_n_0_[4]\ : STD_LOGIC;
  signal \r_DATA_WR_reg_n_0_[5]\ : STD_LOGIC;
  signal \r_DATA_WR_reg_n_0_[6]\ : STD_LOGIC;
  signal \r_DATA_WR_reg_n_0_[7]\ : STD_LOGIC;
  signal r_ENA_i_2_n_0 : STD_LOGIC;
  signal r_ENA_reg_n_0 : STD_LOGIC;
  signal r_PIXEL_COUNTER0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \r_PIXEL_COUNTER[0]_i_10_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_11_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_12_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_13_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_14_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_15_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_16_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_17_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_18_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER[0]_i_3_n_0\ : STD_LOGIC;
  signal r_PIXEL_COUNTER_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \r_PIXEL_COUNTER_reg[0]_i_9_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[12]_i_6_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[16]_i_6_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[20]_i_6_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[24]_i_6_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[4]_i_6_n_0\ : STD_LOGIC;
  signal \r_PIXEL_COUNTER_reg[8]_i_6_n_0\ : STD_LOGIC;
  signal r_PREV_BUSY : STD_LOGIC;
  signal \r_REFRESH_COUNTER[31]_i_10_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER[31]_i_11_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER[31]_i_4_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER[31]_i_5_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER[31]_i_6_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER[31]_i_7_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER[31]_i_8_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER[31]_i_9_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[31]_i_3_n_5\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[31]_i_3_n_6\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[31]_i_3_n_7\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[0]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[10]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[11]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[12]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[13]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[14]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[15]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[16]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[17]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[18]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[19]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[1]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[20]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[21]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[22]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[23]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[24]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[25]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[26]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[27]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[28]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[29]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[2]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[30]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[31]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[3]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[4]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[5]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[6]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[7]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[8]\ : STD_LOGIC;
  signal \r_REFRESH_COUNTER_reg_n_0_[9]\ : STD_LOGIC;
  signal \r_SM_DISPLAY[0]_i_2_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_10_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_11_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_12_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_14_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_17_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_18_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_19_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_20_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_21_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_22_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_23_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_24_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_25_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_26_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_27_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_2_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_4_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_7_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_8_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY[2]_i_9_n_0\ : STD_LOGIC;
  signal \r_SM_DISPLAY_reg_n_0_[0]\ : STD_LOGIC;
  signal \r_SM_DISPLAY_reg_n_0_[1]\ : STD_LOGIC;
  signal \r_SM_DISPLAY_reg_n_0_[2]\ : STD_LOGIC;
  signal r_START_PIXEL_DATA : STD_LOGIC;
  signal r_START_PIXEL_DATA_i_4_n_0 : STD_LOGIC;
  signal w_BUSY : STD_LOGIC;
  signal w_CLOCK_OUT1 : STD_LOGIC;
  signal \NLW_r_COM_COUNTER_reg[0]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_COM_COUNTER_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[0]_i_9_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[12]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[16]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[20]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[24]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[28]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[28]_i_6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_r_PIXEL_COUNTER_reg[4]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_PIXEL_COUNTER_reg[8]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_REFRESH_COUNTER_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_REFRESH_COUNTER_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_REFRESH_COUNTER_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_REFRESH_COUNTER_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_REFRESH_COUNTER_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_REFRESH_COUNTER_reg[31]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_r_REFRESH_COUNTER_reg[31]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_r_REFRESH_COUNTER_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_r_REFRESH_COUNTER_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute IMPORTED_FROM : string;
  attribute IMPORTED_FROM of CLOCK_50HZ : label is "c:/git/git repositories/CHIP8-FPGA/Vivado/Display-Test/Display-Test.gen/sources_1/ip/clk_50hz/clk_50hz.dcp";
  attribute IMPORTED_TYPE : string;
  attribute IMPORTED_TYPE of CLOCK_50HZ : label is "CHECKPOINT";
  attribute IS_IMPORTED : boolean;
  attribute IS_IMPORTED of CLOCK_50HZ : label is std.standard.true;
  attribute syn_black_box : string;
  attribute syn_black_box of CLOCK_50HZ : label is "TRUE";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_COM_COUNTER_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[0]_i_9\ : label is 35;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[12]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[16]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[20]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[24]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[28]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[4]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \r_PIXEL_COUNTER_reg[8]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \r_REFRESH_COUNTER_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \r_REFRESH_COUNTER_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \r_REFRESH_COUNTER_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \r_REFRESH_COUNTER_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \r_REFRESH_COUNTER_reg[28]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \r_REFRESH_COUNTER_reg[31]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \r_REFRESH_COUNTER_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \r_REFRESH_COUNTER_reg[8]_i_1\ : label is 35;
begin
pullup_o_oled_sclinst: unisim.vcomponents.PULLUP
    port map (
      O => o_oled_scl
    );
pullup_o_oled_sdainst: unisim.vcomponents.PULLUP
    port map (
      O => o_oled_sda
    );
CLOCK_50HZ: entity work.clk_50hz
     port map (
      clk_out1 => w_CLOCK_OUT1,
      i_clck => i_clck,
      locked => locked,
      reset => '0'
    );
I2C_CONTROLLER: entity work.i2c_master
     port map (
      O(3) => I2C_CONTROLLER_n_7,
      O(2) => I2C_CONTROLLER_n_8,
      O(1) => I2C_CONTROLLER_n_9,
      O(0) => I2C_CONTROLLER_n_10,
      Q(7) => \r_DATA_WR_reg_n_0_[7]\,
      Q(6) => \r_DATA_WR_reg_n_0_[6]\,
      Q(5) => \r_DATA_WR_reg_n_0_[5]\,
      Q(4) => \r_DATA_WR_reg_n_0_[4]\,
      Q(3) => \r_DATA_WR_reg_n_0_[3]\,
      Q(2) => \r_DATA_WR_reg_n_0_[2]\,
      Q(1) => \r_DATA_WR_reg_n_0_[1]\,
      Q(0) => \r_DATA_WR_reg_n_0_[0]\,
      busy_reg_0 => I2C_CONTROLLER_n_5,
      busy_reg_1 => I2C_CONTROLLER_n_39,
      clk_out1 => w_CLOCK_OUT1,
      locked => locked,
      o_oled_scl_IBUF => o_oled_scl_IBUF,
      o_oled_scl_TRI => o_oled_scl_TRI,
      o_oled_sda_OBUF => o_oled_sda_OBUF,
      o_oled_sda_TRI => o_oled_sda_TRI,
      \r_COM_COUNTER_reg[31]\ => \r_COM_COUNTER[0]_i_3_n_0\,
      r_ENA_reg => I2C_CONTROLLER_n_42,
      r_ENA_reg_0 => r_ENA_i_2_n_0,
      r_PIXEL_COUNTER0(30 downto 0) => r_PIXEL_COUNTER0(31 downto 1),
      r_PIXEL_COUNTER_reg(31 downto 0) => r_PIXEL_COUNTER_reg(31 downto 0),
      r_PIXEL_COUNTER_reg_3_sp_1 => \r_PIXEL_COUNTER[0]_i_10_n_0\,
      r_PREV_BUSY => r_PREV_BUSY,
      r_PREV_BUSY_reg(3) => I2C_CONTROLLER_n_11,
      r_PREV_BUSY_reg(2) => I2C_CONTROLLER_n_12,
      r_PREV_BUSY_reg(1) => I2C_CONTROLLER_n_13,
      r_PREV_BUSY_reg(0) => I2C_CONTROLLER_n_14,
      r_PREV_BUSY_reg_0(3) => I2C_CONTROLLER_n_15,
      r_PREV_BUSY_reg_0(2) => I2C_CONTROLLER_n_16,
      r_PREV_BUSY_reg_0(1) => I2C_CONTROLLER_n_17,
      r_PREV_BUSY_reg_0(0) => I2C_CONTROLLER_n_18,
      r_PREV_BUSY_reg_1(3) => I2C_CONTROLLER_n_19,
      r_PREV_BUSY_reg_1(2) => I2C_CONTROLLER_n_20,
      r_PREV_BUSY_reg_1(1) => I2C_CONTROLLER_n_21,
      r_PREV_BUSY_reg_1(0) => I2C_CONTROLLER_n_22,
      r_PREV_BUSY_reg_2(3) => I2C_CONTROLLER_n_23,
      r_PREV_BUSY_reg_2(2) => I2C_CONTROLLER_n_24,
      r_PREV_BUSY_reg_2(1) => I2C_CONTROLLER_n_25,
      r_PREV_BUSY_reg_2(0) => I2C_CONTROLLER_n_26,
      r_PREV_BUSY_reg_3(3) => I2C_CONTROLLER_n_27,
      r_PREV_BUSY_reg_3(2) => I2C_CONTROLLER_n_28,
      r_PREV_BUSY_reg_3(1) => I2C_CONTROLLER_n_29,
      r_PREV_BUSY_reg_3(0) => I2C_CONTROLLER_n_30,
      r_PREV_BUSY_reg_4(3) => I2C_CONTROLLER_n_31,
      r_PREV_BUSY_reg_4(2) => I2C_CONTROLLER_n_32,
      r_PREV_BUSY_reg_4(1) => I2C_CONTROLLER_n_33,
      r_PREV_BUSY_reg_4(0) => I2C_CONTROLLER_n_34,
      r_PREV_BUSY_reg_5(3) => I2C_CONTROLLER_n_35,
      r_PREV_BUSY_reg_5(2) => I2C_CONTROLLER_n_36,
      r_PREV_BUSY_reg_5(1) => I2C_CONTROLLER_n_37,
      r_PREV_BUSY_reg_5(0) => I2C_CONTROLLER_n_38,
      \r_REFRESH_COUNTER_reg[0]\ => \r_REFRESH_COUNTER_reg_n_0_[0]\,
      \r_REFRESH_COUNTER_reg[1]\ => \r_REFRESH_COUNTER[31]_i_4_n_0\,
      \r_REFRESH_COUNTER_reg[1]_0\ => \r_REFRESH_COUNTER[31]_i_5_n_0\,
      \r_REFRESH_COUNTER_reg[1]_1\ => \r_REFRESH_COUNTER[31]_i_6_n_0\,
      \r_REFRESH_COUNTER_reg[21]\ => I2C_CONTROLLER_n_3,
      \r_SM_DISPLAY_reg[0]\ => I2C_CONTROLLER_n_2,
      \r_SM_DISPLAY_reg[0]_0\ => I2C_CONTROLLER_n_4,
      \r_SM_DISPLAY_reg[0]_1\ => \r_SM_DISPLAY[0]_i_2_n_0\,
      \r_SM_DISPLAY_reg[0]_2\ => \r_SM_DISPLAY_reg_n_0_[0]\,
      \r_SM_DISPLAY_reg[0]_3\ => \r_SM_DISPLAY[2]_i_8_n_0\,
      \r_SM_DISPLAY_reg[0]_4\ => \r_SM_DISPLAY[2]_i_7_n_0\,
      \r_SM_DISPLAY_reg[0]_5\ => \r_SM_DISPLAY[2]_i_14_n_0\,
      \r_SM_DISPLAY_reg[0]_6\ => \r_SM_DISPLAY[2]_i_9_n_0\,
      \r_SM_DISPLAY_reg[0]_7\ => \r_SM_DISPLAY[2]_i_10_n_0\,
      \r_SM_DISPLAY_reg[0]_8\ => \r_SM_DISPLAY[2]_i_11_n_0\,
      \r_SM_DISPLAY_reg[0]_9\ => \r_SM_DISPLAY[2]_i_12_n_0\,
      \r_SM_DISPLAY_reg[1]\ => I2C_CONTROLLER_n_1,
      \r_SM_DISPLAY_reg[1]_0\ => \r_SM_DISPLAY_reg_n_0_[1]\,
      \r_SM_DISPLAY_reg[2]\ => I2C_CONTROLLER_n_0,
      \r_SM_DISPLAY_reg[2]_0\ => \r_SM_DISPLAY[2]_i_2_n_0\,
      \r_SM_DISPLAY_reg[2]_1\ => \r_SM_DISPLAY[2]_i_4_n_0\,
      \r_SM_DISPLAY_reg[2]_2\ => \r_SM_DISPLAY_reg_n_0_[2]\,
      r_START_PIXEL_DATA => r_START_PIXEL_DATA,
      r_START_PIXEL_DATA_reg => I2C_CONTROLLER_n_41,
      r_START_PIXEL_DATA_reg_0 => \r_PIXEL_COUNTER[0]_i_3_n_0\,
      r_START_PIXEL_DATA_reg_1 => r_START_PIXEL_DATA_i_4_n_0,
      sda_int_reg_0 => r_ENA_reg_n_0,
      sel => I2C_CONTROLLER_n_40,
      w_BUSY => w_BUSY
    );
g0_b0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"021F1132"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      O => g0_b0_n_0
    );
g0_b1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0392C031"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      O => g0_b1_n_0
    );
g0_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03C20313"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
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
g0_b5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03C81409"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
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
g0_b7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02DF712F"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      I1 => r_COM_COUNTER_reg(1),
      I2 => r_COM_COUNTER_reg(2),
      I3 => r_COM_COUNTER_reg(3),
      I4 => r_COM_COUNTER_reg(4),
      O => g0_b7_n_0
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
\r_COM_COUNTER[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \r_SM_DISPLAY[2]_i_8_n_0\,
      I1 => \r_SM_DISPLAY[2]_i_7_n_0\,
      O => \r_COM_COUNTER[0]_i_3_n_0\
    );
\r_COM_COUNTER[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_COM_COUNTER_reg(0),
      O => \r_COM_COUNTER[0]_i_4_n_0\
    );
\r_COM_COUNTER_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
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
      S(0) => \r_COM_COUNTER[0]_i_4_n_0\
    );
\r_COM_COUNTER_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[8]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(10),
      R => '0'
    );
\r_COM_COUNTER_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[8]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(11),
      R => '0'
    );
\r_COM_COUNTER_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
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
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[12]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(13),
      R => '0'
    );
\r_COM_COUNTER_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[12]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(14),
      R => '0'
    );
\r_COM_COUNTER_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[12]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(15),
      R => '0'
    );
\r_COM_COUNTER_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
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
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[16]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(17),
      R => '0'
    );
\r_COM_COUNTER_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[16]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(18),
      R => '0'
    );
\r_COM_COUNTER_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[16]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(19),
      R => '0'
    );
\r_COM_COUNTER_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[0]_i_2_n_6\,
      Q => r_COM_COUNTER_reg(1),
      R => '0'
    );
\r_COM_COUNTER_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
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
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[20]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(21),
      R => '0'
    );
\r_COM_COUNTER_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[20]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(22),
      R => '0'
    );
\r_COM_COUNTER_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[20]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(23),
      R => '0'
    );
\r_COM_COUNTER_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
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
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[24]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(25),
      R => '0'
    );
\r_COM_COUNTER_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[24]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(26),
      R => '0'
    );
\r_COM_COUNTER_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[24]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(27),
      R => '0'
    );
\r_COM_COUNTER_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
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
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[28]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(29),
      R => '0'
    );
\r_COM_COUNTER_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[0]_i_2_n_5\,
      Q => r_COM_COUNTER_reg(2),
      R => '0'
    );
\r_COM_COUNTER_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[28]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(30),
      R => '0'
    );
\r_COM_COUNTER_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[28]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(31),
      R => '0'
    );
\r_COM_COUNTER_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[0]_i_2_n_4\,
      Q => r_COM_COUNTER_reg(3),
      R => '0'
    );
\r_COM_COUNTER_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
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
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[4]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(5),
      R => '0'
    );
\r_COM_COUNTER_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[4]_i_1_n_5\,
      Q => \r_COM_COUNTER_reg__0\(6),
      R => '0'
    );
\r_COM_COUNTER_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[4]_i_1_n_4\,
      Q => \r_COM_COUNTER_reg__0\(7),
      R => '0'
    );
\r_COM_COUNTER_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
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
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_40,
      D => \r_COM_COUNTER_reg[8]_i_1_n_6\,
      Q => \r_COM_COUNTER_reg__0\(9),
      R => '0'
    );
\r_DATA_WR[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDF0DD00DDF0FF00"
    )
        port map (
      I0 => \r_DATA_WR[0]_i_2_n_0\,
      I1 => \r_DATA_WR[1]_i_3_n_0\,
      I2 => g0_b0_n_0,
      I3 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I4 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I5 => \r_DATA_WR[4]_i_2_n_0\,
      O => r_DATA_WR(0)
    );
\r_DATA_WR[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[2]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[1]\,
      I2 => \r_SM_DISPLAY_reg_n_0_[0]\,
      O => \r_DATA_WR[0]_i_2_n_0\
    );
\r_DATA_WR[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFE0E0E0"
    )
        port map (
      I0 => \r_DATA_WR[1]_i_2_n_0\,
      I1 => \r_DATA_WR[1]_i_3_n_0\,
      I2 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I3 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I4 => g0_b1_n_0,
      O => r_DATA_WR(1)
    );
\r_DATA_WR[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0141"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[0]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[2]\,
      I3 => \r_REFRESH_COUNTER_reg_n_0_[1]\,
      O => \r_DATA_WR[1]_i_2_n_0\
    );
\r_DATA_WR[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AAA"
    )
        port map (
      I0 => \r_DATA_WR[5]_i_2_n_0\,
      I1 => r_PIXEL_COUNTER_reg(2),
      I2 => r_PIXEL_COUNTER_reg(0),
      I3 => \r_DATA_WR[1]_i_4_n_0\,
      O => \r_DATA_WR[1]_i_3_n_0\
    );
\r_DATA_WR[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A5B5B5B5B5B5B5B5"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(6),
      I1 => r_PIXEL_COUNTER_reg(4),
      I2 => r_PIXEL_COUNTER_reg(5),
      I3 => r_PIXEL_COUNTER_reg(3),
      I4 => r_PIXEL_COUNTER_reg(2),
      I5 => r_PIXEL_COUNTER_reg(1),
      O => \r_DATA_WR[1]_i_4_n_0\
    );
\r_DATA_WR[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CDFCCDCC"
    )
        port map (
      I0 => \r_DATA_WR[4]_i_2_n_0\,
      I1 => \r_DATA_WR[7]_i_4_n_0\,
      I2 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I3 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I4 => g0_b2_n_0,
      O => r_DATA_WR(2)
    );
\r_DATA_WR[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CDFCCDCC"
    )
        port map (
      I0 => \r_DATA_WR[4]_i_2_n_0\,
      I1 => \r_DATA_WR[7]_i_4_n_0\,
      I2 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I3 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I4 => g0_b3_n_0,
      O => r_DATA_WR(3)
    );
\r_DATA_WR[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0838"
    )
        port map (
      I0 => g0_b4_n_0,
      I1 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I2 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I3 => \r_DATA_WR[4]_i_2_n_0\,
      I4 => \r_DATA_WR[7]_i_4_n_0\,
      O => r_DATA_WR(4)
    );
\r_DATA_WR[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[1]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[2]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[0]\,
      O => \r_DATA_WR[4]_i_2_n_0\
    );
\r_DATA_WR[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFE0E0E0"
    )
        port map (
      I0 => \r_DATA_WR[5]_i_2_n_0\,
      I1 => \r_DATA_WR[5]_i_3_n_0\,
      I2 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I3 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I4 => g0_b5_n_0,
      O => r_DATA_WR(5)
    );
\r_DATA_WR[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08080880"
    )
        port map (
      I0 => \r_DATA_WR[5]_i_4_n_0\,
      I1 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I2 => r_PIXEL_COUNTER_reg(7),
      I3 => r_PIXEL_COUNTER_reg(5),
      I4 => r_PIXEL_COUNTER_reg(6),
      O => \r_DATA_WR[5]_i_2_n_0\
    );
\r_DATA_WR[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0063"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[1]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[2]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[0]\,
      I3 => \r_SM_DISPLAY_reg_n_0_[0]\,
      O => \r_DATA_WR[5]_i_3_n_0\
    );
\r_DATA_WR[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF07FFFF008000"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(1),
      I1 => r_PIXEL_COUNTER_reg(2),
      I2 => r_PIXEL_COUNTER_reg(3),
      I3 => r_PIXEL_COUNTER_reg(5),
      I4 => r_PIXEL_COUNTER_reg(4),
      I5 => r_PIXEL_COUNTER_reg(6),
      O => \r_DATA_WR[5]_i_4_n_0\
    );
\r_DATA_WR[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABBBAAA"
    )
        port map (
      I0 => \r_DATA_WR[7]_i_4_n_0\,
      I1 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I2 => g0_b6_n_0,
      I3 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I4 => r_START_PIXEL_DATA,
      O => r_DATA_WR(6)
    );
\r_DATA_WR[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[1]\,
      I1 => \r_SM_DISPLAY_reg_n_0_[2]\,
      O => \r_DATA_WR[7]_i_1_n_0\
    );
\r_DATA_WR[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20FF2020"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I1 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I2 => g0_b7_n_0,
      I3 => \r_DATA_WR[7]_i_3_n_0\,
      I4 => \r_DATA_WR[7]_i_4_n_0\,
      O => r_DATA_WR(7)
    );
\r_DATA_WR[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => \r_DATA_WR[7]_i_5_n_0\,
      I1 => r_PIXEL_COUNTER_reg(0),
      I2 => r_PIXEL_COUNTER_reg(5),
      I3 => r_PIXEL_COUNTER_reg(4),
      I4 => \r_DATA_WR[7]_i_6_n_0\,
      O => \r_DATA_WR[7]_i_3_n_0\
    );
\r_DATA_WR[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888888888A8"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I1 => \r_DATA_WR[5]_i_2_n_0\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[1]\,
      I3 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I4 => \r_REFRESH_COUNTER_reg_n_0_[2]\,
      I5 => \r_REFRESH_COUNTER_reg_n_0_[0]\,
      O => \r_DATA_WR[7]_i_4_n_0\
    );
\r_DATA_WR[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[1]\,
      I1 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[2]\,
      I3 => \r_REFRESH_COUNTER_reg_n_0_[0]\,
      O => \r_DATA_WR[7]_i_5_n_0\
    );
\r_DATA_WR[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800080008"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(5),
      I1 => r_PIXEL_COUNTER_reg(6),
      I2 => r_PIXEL_COUNTER_reg(3),
      I3 => r_PIXEL_COUNTER_reg(4),
      I4 => r_PIXEL_COUNTER_reg(1),
      I5 => r_PIXEL_COUNTER_reg(2),
      O => \r_DATA_WR[7]_i_6_n_0\
    );
\r_DATA_WR_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => \r_DATA_WR[7]_i_1_n_0\,
      D => r_DATA_WR(0),
      Q => \r_DATA_WR_reg_n_0_[0]\,
      R => '0'
    );
\r_DATA_WR_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => \r_DATA_WR[7]_i_1_n_0\,
      D => r_DATA_WR(1),
      Q => \r_DATA_WR_reg_n_0_[1]\,
      R => '0'
    );
\r_DATA_WR_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => \r_DATA_WR[7]_i_1_n_0\,
      D => r_DATA_WR(2),
      Q => \r_DATA_WR_reg_n_0_[2]\,
      R => '0'
    );
\r_DATA_WR_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => \r_DATA_WR[7]_i_1_n_0\,
      D => r_DATA_WR(3),
      Q => \r_DATA_WR_reg_n_0_[3]\,
      R => '0'
    );
\r_DATA_WR_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => \r_DATA_WR[7]_i_1_n_0\,
      D => r_DATA_WR(4),
      Q => \r_DATA_WR_reg_n_0_[4]\,
      R => '0'
    );
\r_DATA_WR_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => \r_DATA_WR[7]_i_1_n_0\,
      D => r_DATA_WR(5),
      Q => \r_DATA_WR_reg_n_0_[5]\,
      R => '0'
    );
\r_DATA_WR_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => \r_DATA_WR[7]_i_1_n_0\,
      D => r_DATA_WR(6),
      Q => \r_DATA_WR_reg_n_0_[6]\,
      R => '0'
    );
\r_DATA_WR_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => \r_DATA_WR[7]_i_1_n_0\,
      D => r_DATA_WR(7),
      Q => \r_DATA_WR_reg_n_0_[7]\,
      R => '0'
    );
r_ENA_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[1]\,
      I1 => \r_SM_DISPLAY_reg_n_0_[0]\,
      O => r_ENA_i_2_n_0
    );
r_ENA_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => '1',
      D => I2C_CONTROLLER_n_42,
      Q => r_ENA_reg_n_0,
      R => '0'
    );
\r_PIXEL_COUNTER[0]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \r_PIXEL_COUNTER[0]_i_11_n_0\,
      I1 => \r_PIXEL_COUNTER[0]_i_12_n_0\,
      I2 => \r_PIXEL_COUNTER[0]_i_13_n_0\,
      I3 => \r_PIXEL_COUNTER[0]_i_14_n_0\,
      O => \r_PIXEL_COUNTER[0]_i_10_n_0\
    );
\r_PIXEL_COUNTER[0]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(23),
      I1 => r_PIXEL_COUNTER_reg(22),
      I2 => r_PIXEL_COUNTER_reg(21),
      I3 => r_PIXEL_COUNTER_reg(20),
      I4 => \r_PIXEL_COUNTER[0]_i_15_n_0\,
      O => \r_PIXEL_COUNTER[0]_i_11_n_0\
    );
\r_PIXEL_COUNTER[0]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(3),
      I1 => r_PIXEL_COUNTER_reg(2),
      I2 => r_PIXEL_COUNTER_reg(7),
      I3 => r_PIXEL_COUNTER_reg(1),
      I4 => \r_PIXEL_COUNTER[0]_i_16_n_0\,
      O => \r_PIXEL_COUNTER[0]_i_12_n_0\
    );
\r_PIXEL_COUNTER[0]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(13),
      I1 => r_PIXEL_COUNTER_reg(12),
      I2 => r_PIXEL_COUNTER_reg(15),
      I3 => r_PIXEL_COUNTER_reg(14),
      I4 => \r_PIXEL_COUNTER[0]_i_17_n_0\,
      O => \r_PIXEL_COUNTER[0]_i_13_n_0\
    );
\r_PIXEL_COUNTER[0]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(27),
      I1 => r_PIXEL_COUNTER_reg(26),
      I2 => r_PIXEL_COUNTER_reg(25),
      I3 => r_PIXEL_COUNTER_reg(24),
      I4 => \r_PIXEL_COUNTER[0]_i_18_n_0\,
      O => \r_PIXEL_COUNTER[0]_i_14_n_0\
    );
\r_PIXEL_COUNTER[0]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(16),
      I1 => r_PIXEL_COUNTER_reg(17),
      I2 => r_PIXEL_COUNTER_reg(18),
      I3 => r_PIXEL_COUNTER_reg(19),
      O => \r_PIXEL_COUNTER[0]_i_15_n_0\
    );
\r_PIXEL_COUNTER[0]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(6),
      I1 => r_PIXEL_COUNTER_reg(30),
      I2 => r_PIXEL_COUNTER_reg(4),
      I3 => r_PIXEL_COUNTER_reg(5),
      O => \r_PIXEL_COUNTER[0]_i_16_n_0\
    );
\r_PIXEL_COUNTER[0]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(10),
      I1 => r_PIXEL_COUNTER_reg(11),
      I2 => r_PIXEL_COUNTER_reg(8),
      I3 => r_PIXEL_COUNTER_reg(9),
      O => \r_PIXEL_COUNTER[0]_i_17_n_0\
    );
\r_PIXEL_COUNTER[0]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(0),
      I1 => r_PIXEL_COUNTER_reg(31),
      I2 => r_PIXEL_COUNTER_reg(28),
      I3 => r_PIXEL_COUNTER_reg(29),
      O => \r_PIXEL_COUNTER[0]_i_18_n_0\
    );
\r_PIXEL_COUNTER[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => \r_SM_DISPLAY[2]_i_12_n_0\,
      I1 => \r_SM_DISPLAY[2]_i_11_n_0\,
      I2 => \r_SM_DISPLAY[2]_i_10_n_0\,
      I3 => \r_SM_DISPLAY[2]_i_9_n_0\,
      O => \r_PIXEL_COUNTER[0]_i_3_n_0\
    );
\r_PIXEL_COUNTER_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_10,
      Q => r_PIXEL_COUNTER_reg(0),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[0]_i_9\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \r_PIXEL_COUNTER_reg[0]_i_9_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[0]_i_9_CO_UNCONNECTED\(2 downto 0),
      CYINIT => r_PIXEL_COUNTER_reg(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PIXEL_COUNTER0(4 downto 1),
      S(3 downto 0) => r_PIXEL_COUNTER_reg(4 downto 1)
    );
\r_PIXEL_COUNTER_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_16,
      Q => r_PIXEL_COUNTER_reg(10),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_15,
      Q => r_PIXEL_COUNTER_reg(11),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_22,
      Q => r_PIXEL_COUNTER_reg(12),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[12]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[8]_i_6_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[12]_i_6_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[12]_i_6_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PIXEL_COUNTER0(16 downto 13),
      S(3 downto 0) => r_PIXEL_COUNTER_reg(16 downto 13)
    );
\r_PIXEL_COUNTER_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_21,
      Q => r_PIXEL_COUNTER_reg(13),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_20,
      Q => r_PIXEL_COUNTER_reg(14),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_19,
      Q => r_PIXEL_COUNTER_reg(15),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_26,
      Q => r_PIXEL_COUNTER_reg(16),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[16]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[12]_i_6_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[16]_i_6_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[16]_i_6_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PIXEL_COUNTER0(20 downto 17),
      S(3 downto 0) => r_PIXEL_COUNTER_reg(20 downto 17)
    );
\r_PIXEL_COUNTER_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_25,
      Q => r_PIXEL_COUNTER_reg(17),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_24,
      Q => r_PIXEL_COUNTER_reg(18),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_23,
      Q => r_PIXEL_COUNTER_reg(19),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_9,
      Q => r_PIXEL_COUNTER_reg(1),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_30,
      Q => r_PIXEL_COUNTER_reg(20),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[20]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[16]_i_6_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[20]_i_6_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[20]_i_6_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PIXEL_COUNTER0(24 downto 21),
      S(3 downto 0) => r_PIXEL_COUNTER_reg(24 downto 21)
    );
\r_PIXEL_COUNTER_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_29,
      Q => r_PIXEL_COUNTER_reg(21),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_28,
      Q => r_PIXEL_COUNTER_reg(22),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_27,
      Q => r_PIXEL_COUNTER_reg(23),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_34,
      Q => r_PIXEL_COUNTER_reg(24),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[24]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[20]_i_6_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[24]_i_6_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[24]_i_6_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PIXEL_COUNTER0(28 downto 25),
      S(3 downto 0) => r_PIXEL_COUNTER_reg(28 downto 25)
    );
\r_PIXEL_COUNTER_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_33,
      Q => r_PIXEL_COUNTER_reg(25),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_32,
      Q => r_PIXEL_COUNTER_reg(26),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_31,
      Q => r_PIXEL_COUNTER_reg(27),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_38,
      Q => r_PIXEL_COUNTER_reg(28),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[28]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[24]_i_6_n_0\,
      CO(3 downto 0) => \NLW_r_PIXEL_COUNTER_reg[28]_i_6_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_r_PIXEL_COUNTER_reg[28]_i_6_O_UNCONNECTED\(3),
      O(2 downto 0) => r_PIXEL_COUNTER0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => r_PIXEL_COUNTER_reg(31 downto 29)
    );
\r_PIXEL_COUNTER_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_37,
      Q => r_PIXEL_COUNTER_reg(29),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_8,
      Q => r_PIXEL_COUNTER_reg(2),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_36,
      Q => r_PIXEL_COUNTER_reg(30),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_35,
      Q => r_PIXEL_COUNTER_reg(31),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_7,
      Q => r_PIXEL_COUNTER_reg(3),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_14,
      Q => r_PIXEL_COUNTER_reg(4),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[4]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[0]_i_9_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[4]_i_6_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[4]_i_6_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PIXEL_COUNTER0(8 downto 5),
      S(3 downto 0) => r_PIXEL_COUNTER_reg(8 downto 5)
    );
\r_PIXEL_COUNTER_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_13,
      Q => r_PIXEL_COUNTER_reg(5),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_12,
      Q => r_PIXEL_COUNTER_reg(6),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_11,
      Q => r_PIXEL_COUNTER_reg(7),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_18,
      Q => r_PIXEL_COUNTER_reg(8),
      R => '0'
    );
\r_PIXEL_COUNTER_reg[8]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_PIXEL_COUNTER_reg[4]_i_6_n_0\,
      CO(3) => \r_PIXEL_COUNTER_reg[8]_i_6_n_0\,
      CO(2 downto 0) => \NLW_r_PIXEL_COUNTER_reg[8]_i_6_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => r_PIXEL_COUNTER0(12 downto 9),
      S(3 downto 0) => r_PIXEL_COUNTER_reg(12 downto 9)
    );
\r_PIXEL_COUNTER_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_39,
      D => I2C_CONTROLLER_n_17,
      Q => r_PIXEL_COUNTER_reg(9),
      R => '0'
    );
r_PREV_BUSY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => '1',
      D => w_BUSY,
      Q => r_PREV_BUSY,
      R => '0'
    );
\r_REFRESH_COUNTER[31]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[25]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[20]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[7]\,
      I3 => \r_REFRESH_COUNTER_reg_n_0_[10]\,
      O => \r_REFRESH_COUNTER[31]_i_10_n_0\
    );
\r_REFRESH_COUNTER[31]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[30]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[16]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[12]\,
      I3 => \r_REFRESH_COUNTER_reg_n_0_[14]\,
      O => \r_REFRESH_COUNTER[31]_i_11_n_0\
    );
\r_REFRESH_COUNTER[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[21]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[28]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[22]\,
      I3 => \r_REFRESH_COUNTER[31]_i_7_n_0\,
      I4 => \r_REFRESH_COUNTER[31]_i_8_n_0\,
      O => \r_REFRESH_COUNTER[31]_i_4_n_0\
    );
\r_REFRESH_COUNTER[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[13]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[19]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[4]\,
      I3 => \r_REFRESH_COUNTER_reg_n_0_[26]\,
      O => \r_REFRESH_COUNTER[31]_i_5_n_0\
    );
\r_REFRESH_COUNTER[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \r_REFRESH_COUNTER[31]_i_9_n_0\,
      I1 => \r_REFRESH_COUNTER[31]_i_10_n_0\,
      I2 => \r_REFRESH_COUNTER[31]_i_11_n_0\,
      I3 => \r_REFRESH_COUNTER_reg_n_0_[1]\,
      I4 => \r_REFRESH_COUNTER_reg_n_0_[2]\,
      I5 => \r_REFRESH_COUNTER_reg_n_0_[0]\,
      O => \r_REFRESH_COUNTER[31]_i_6_n_0\
    );
\r_REFRESH_COUNTER[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[9]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[5]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[15]\,
      I3 => \r_REFRESH_COUNTER_reg_n_0_[29]\,
      O => \r_REFRESH_COUNTER[31]_i_7_n_0\
    );
\r_REFRESH_COUNTER[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[31]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[3]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[27]\,
      I3 => \r_REFRESH_COUNTER_reg_n_0_[18]\,
      O => \r_REFRESH_COUNTER[31]_i_8_n_0\
    );
\r_REFRESH_COUNTER[31]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \r_REFRESH_COUNTER_reg_n_0_[6]\,
      I1 => \r_REFRESH_COUNTER_reg_n_0_[24]\,
      I2 => \r_REFRESH_COUNTER_reg_n_0_[17]\,
      I3 => \r_REFRESH_COUNTER_reg_n_0_[23]\,
      I4 => \r_REFRESH_COUNTER_reg_n_0_[8]\,
      I5 => \r_REFRESH_COUNTER_reg_n_0_[11]\,
      O => \r_REFRESH_COUNTER[31]_i_9_n_0\
    );
\r_REFRESH_COUNTER_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => '1',
      D => I2C_CONTROLLER_n_5,
      Q => \r_REFRESH_COUNTER_reg_n_0_[0]\,
      R => '0'
    );
\r_REFRESH_COUNTER_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[12]_i_1_n_6\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[10]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[12]_i_1_n_5\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[11]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[12]_i_1_n_4\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[12]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_REFRESH_COUNTER_reg[8]_i_1_n_0\,
      CO(3) => \r_REFRESH_COUNTER_reg[12]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_REFRESH_COUNTER_reg[12]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_REFRESH_COUNTER_reg[12]_i_1_n_4\,
      O(2) => \r_REFRESH_COUNTER_reg[12]_i_1_n_5\,
      O(1) => \r_REFRESH_COUNTER_reg[12]_i_1_n_6\,
      O(0) => \r_REFRESH_COUNTER_reg[12]_i_1_n_7\,
      S(3) => \r_REFRESH_COUNTER_reg_n_0_[12]\,
      S(2) => \r_REFRESH_COUNTER_reg_n_0_[11]\,
      S(1) => \r_REFRESH_COUNTER_reg_n_0_[10]\,
      S(0) => \r_REFRESH_COUNTER_reg_n_0_[9]\
    );
\r_REFRESH_COUNTER_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[16]_i_1_n_7\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[13]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[16]_i_1_n_6\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[14]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[16]_i_1_n_5\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[15]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[16]_i_1_n_4\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[16]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_REFRESH_COUNTER_reg[12]_i_1_n_0\,
      CO(3) => \r_REFRESH_COUNTER_reg[16]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_REFRESH_COUNTER_reg[16]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_REFRESH_COUNTER_reg[16]_i_1_n_4\,
      O(2) => \r_REFRESH_COUNTER_reg[16]_i_1_n_5\,
      O(1) => \r_REFRESH_COUNTER_reg[16]_i_1_n_6\,
      O(0) => \r_REFRESH_COUNTER_reg[16]_i_1_n_7\,
      S(3) => \r_REFRESH_COUNTER_reg_n_0_[16]\,
      S(2) => \r_REFRESH_COUNTER_reg_n_0_[15]\,
      S(1) => \r_REFRESH_COUNTER_reg_n_0_[14]\,
      S(0) => \r_REFRESH_COUNTER_reg_n_0_[13]\
    );
\r_REFRESH_COUNTER_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[20]_i_1_n_7\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[17]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[20]_i_1_n_6\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[18]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[20]_i_1_n_5\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[19]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[4]_i_1_n_7\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[1]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[20]_i_1_n_4\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[20]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_REFRESH_COUNTER_reg[16]_i_1_n_0\,
      CO(3) => \r_REFRESH_COUNTER_reg[20]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_REFRESH_COUNTER_reg[20]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_REFRESH_COUNTER_reg[20]_i_1_n_4\,
      O(2) => \r_REFRESH_COUNTER_reg[20]_i_1_n_5\,
      O(1) => \r_REFRESH_COUNTER_reg[20]_i_1_n_6\,
      O(0) => \r_REFRESH_COUNTER_reg[20]_i_1_n_7\,
      S(3) => \r_REFRESH_COUNTER_reg_n_0_[20]\,
      S(2) => \r_REFRESH_COUNTER_reg_n_0_[19]\,
      S(1) => \r_REFRESH_COUNTER_reg_n_0_[18]\,
      S(0) => \r_REFRESH_COUNTER_reg_n_0_[17]\
    );
\r_REFRESH_COUNTER_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[24]_i_1_n_7\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[21]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[24]_i_1_n_6\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[22]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[24]_i_1_n_5\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[23]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[24]_i_1_n_4\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[24]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_REFRESH_COUNTER_reg[20]_i_1_n_0\,
      CO(3) => \r_REFRESH_COUNTER_reg[24]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_REFRESH_COUNTER_reg[24]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_REFRESH_COUNTER_reg[24]_i_1_n_4\,
      O(2) => \r_REFRESH_COUNTER_reg[24]_i_1_n_5\,
      O(1) => \r_REFRESH_COUNTER_reg[24]_i_1_n_6\,
      O(0) => \r_REFRESH_COUNTER_reg[24]_i_1_n_7\,
      S(3) => \r_REFRESH_COUNTER_reg_n_0_[24]\,
      S(2) => \r_REFRESH_COUNTER_reg_n_0_[23]\,
      S(1) => \r_REFRESH_COUNTER_reg_n_0_[22]\,
      S(0) => \r_REFRESH_COUNTER_reg_n_0_[21]\
    );
\r_REFRESH_COUNTER_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[28]_i_1_n_7\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[25]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[28]_i_1_n_6\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[26]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[28]_i_1_n_5\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[27]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[28]_i_1_n_4\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[28]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_REFRESH_COUNTER_reg[24]_i_1_n_0\,
      CO(3) => \r_REFRESH_COUNTER_reg[28]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_REFRESH_COUNTER_reg[28]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_REFRESH_COUNTER_reg[28]_i_1_n_4\,
      O(2) => \r_REFRESH_COUNTER_reg[28]_i_1_n_5\,
      O(1) => \r_REFRESH_COUNTER_reg[28]_i_1_n_6\,
      O(0) => \r_REFRESH_COUNTER_reg[28]_i_1_n_7\,
      S(3) => \r_REFRESH_COUNTER_reg_n_0_[28]\,
      S(2) => \r_REFRESH_COUNTER_reg_n_0_[27]\,
      S(1) => \r_REFRESH_COUNTER_reg_n_0_[26]\,
      S(0) => \r_REFRESH_COUNTER_reg_n_0_[25]\
    );
\r_REFRESH_COUNTER_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[31]_i_3_n_7\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[29]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[4]_i_1_n_6\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[2]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[31]_i_3_n_6\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[30]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[31]_i_3_n_5\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[31]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[31]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_REFRESH_COUNTER_reg[28]_i_1_n_0\,
      CO(3 downto 0) => \NLW_r_REFRESH_COUNTER_reg[31]_i_3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_r_REFRESH_COUNTER_reg[31]_i_3_O_UNCONNECTED\(3),
      O(2) => \r_REFRESH_COUNTER_reg[31]_i_3_n_5\,
      O(1) => \r_REFRESH_COUNTER_reg[31]_i_3_n_6\,
      O(0) => \r_REFRESH_COUNTER_reg[31]_i_3_n_7\,
      S(3) => '0',
      S(2) => \r_REFRESH_COUNTER_reg_n_0_[31]\,
      S(1) => \r_REFRESH_COUNTER_reg_n_0_[30]\,
      S(0) => \r_REFRESH_COUNTER_reg_n_0_[29]\
    );
\r_REFRESH_COUNTER_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[4]_i_1_n_5\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[3]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[4]_i_1_n_4\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[4]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \r_REFRESH_COUNTER_reg[4]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_REFRESH_COUNTER_reg[4]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => \r_REFRESH_COUNTER_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3) => \r_REFRESH_COUNTER_reg[4]_i_1_n_4\,
      O(2) => \r_REFRESH_COUNTER_reg[4]_i_1_n_5\,
      O(1) => \r_REFRESH_COUNTER_reg[4]_i_1_n_6\,
      O(0) => \r_REFRESH_COUNTER_reg[4]_i_1_n_7\,
      S(3) => \r_REFRESH_COUNTER_reg_n_0_[4]\,
      S(2) => \r_REFRESH_COUNTER_reg_n_0_[3]\,
      S(1) => \r_REFRESH_COUNTER_reg_n_0_[2]\,
      S(0) => \r_REFRESH_COUNTER_reg_n_0_[1]\
    );
\r_REFRESH_COUNTER_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[8]_i_1_n_7\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[5]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[8]_i_1_n_6\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[6]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[8]_i_1_n_5\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[7]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[8]_i_1_n_4\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[8]\,
      R => I2C_CONTROLLER_n_3
    );
\r_REFRESH_COUNTER_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \r_REFRESH_COUNTER_reg[4]_i_1_n_0\,
      CO(3) => \r_REFRESH_COUNTER_reg[8]_i_1_n_0\,
      CO(2 downto 0) => \NLW_r_REFRESH_COUNTER_reg[8]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \r_REFRESH_COUNTER_reg[8]_i_1_n_4\,
      O(2) => \r_REFRESH_COUNTER_reg[8]_i_1_n_5\,
      O(1) => \r_REFRESH_COUNTER_reg[8]_i_1_n_6\,
      O(0) => \r_REFRESH_COUNTER_reg[8]_i_1_n_7\,
      S(3) => \r_REFRESH_COUNTER_reg_n_0_[8]\,
      S(2) => \r_REFRESH_COUNTER_reg_n_0_[7]\,
      S(1) => \r_REFRESH_COUNTER_reg_n_0_[6]\,
      S(0) => \r_REFRESH_COUNTER_reg_n_0_[5]\
    );
\r_REFRESH_COUNTER_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => I2C_CONTROLLER_n_4,
      D => \r_REFRESH_COUNTER_reg[12]_i_1_n_7\,
      Q => \r_REFRESH_COUNTER_reg_n_0_[9]\,
      R => I2C_CONTROLLER_n_3
    );
\r_SM_DISPLAY[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44444440"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I1 => \r_SM_DISPLAY_reg_n_0_[1]\,
      I2 => \r_SM_DISPLAY[2]_i_8_n_0\,
      I3 => \r_SM_DISPLAY[2]_i_7_n_0\,
      I4 => r_START_PIXEL_DATA,
      O => \r_SM_DISPLAY[0]_i_2_n_0\
    );
\r_SM_DISPLAY[2]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF7"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(5),
      I1 => r_PIXEL_COUNTER_reg(6),
      I2 => r_PIXEL_COUNTER_reg(24),
      I3 => r_PIXEL_COUNTER_reg(27),
      I4 => r_PIXEL_COUNTER_reg(20),
      I5 => r_PIXEL_COUNTER_reg(23),
      O => \r_SM_DISPLAY[2]_i_10_n_0\
    );
\r_SM_DISPLAY[2]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(15),
      I1 => r_PIXEL_COUNTER_reg(11),
      I2 => r_PIXEL_COUNTER_reg(31),
      I3 => r_PIXEL_COUNTER_reg(10),
      I4 => \r_SM_DISPLAY[2]_i_26_n_0\,
      O => \r_SM_DISPLAY[2]_i_11_n_0\
    );
\r_SM_DISPLAY[2]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(26),
      I1 => r_PIXEL_COUNTER_reg(0),
      I2 => r_PIXEL_COUNTER_reg(30),
      I3 => r_PIXEL_COUNTER_reg(12),
      I4 => \r_SM_DISPLAY[2]_i_27_n_0\,
      O => \r_SM_DISPLAY[2]_i_12_n_0\
    );
\r_SM_DISPLAY[2]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[1]\,
      I1 => \r_SM_DISPLAY_reg_n_0_[2]\,
      O => \r_SM_DISPLAY[2]_i_14_n_0\
    );
\r_SM_DISPLAY[2]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(31),
      I1 => \r_COM_COUNTER_reg__0\(5),
      I2 => \r_COM_COUNTER_reg__0\(9),
      I3 => \r_COM_COUNTER_reg__0\(21),
      O => \r_SM_DISPLAY[2]_i_17_n_0\
    );
\r_SM_DISPLAY[2]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(7),
      I1 => \r_COM_COUNTER_reg__0\(24),
      I2 => r_COM_COUNTER_reg(0),
      I3 => \r_COM_COUNTER_reg__0\(12),
      O => \r_SM_DISPLAY[2]_i_18_n_0\
    );
\r_SM_DISPLAY[2]_i_19\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(8),
      I1 => \r_COM_COUNTER_reg__0\(29),
      I2 => \r_COM_COUNTER_reg__0\(28),
      O => \r_SM_DISPLAY[2]_i_19_n_0\
    );
\r_SM_DISPLAY[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I1 => \r_SM_DISPLAY_reg_n_0_[1]\,
      I2 => \r_SM_DISPLAY[2]_i_7_n_0\,
      I3 => \r_SM_DISPLAY[2]_i_8_n_0\,
      O => \r_SM_DISPLAY[2]_i_2_n_0\
    );
\r_SM_DISPLAY[2]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(11),
      I1 => \r_COM_COUNTER_reg__0\(13),
      I2 => \r_COM_COUNTER_reg__0\(10),
      I3 => \r_COM_COUNTER_reg__0\(14),
      O => \r_SM_DISPLAY[2]_i_20_n_0\
    );
\r_SM_DISPLAY[2]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(23),
      I1 => r_COM_COUNTER_reg(2),
      I2 => r_COM_COUNTER_reg(1),
      I3 => \r_COM_COUNTER_reg__0\(26),
      O => \r_SM_DISPLAY[2]_i_21_n_0\
    );
\r_SM_DISPLAY[2]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFDFF"
    )
        port map (
      I0 => r_COM_COUNTER_reg(3),
      I1 => \r_COM_COUNTER_reg__0\(6),
      I2 => \r_COM_COUNTER_reg__0\(22),
      I3 => r_COM_COUNTER_reg(4),
      I4 => \r_COM_COUNTER_reg__0\(30),
      I5 => \r_COM_COUNTER_reg__0\(25),
      O => \r_SM_DISPLAY[2]_i_22_n_0\
    );
\r_SM_DISPLAY[2]_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(19),
      I1 => \r_COM_COUNTER_reg__0\(18),
      I2 => \r_COM_COUNTER_reg__0\(17),
      I3 => \r_COM_COUNTER_reg__0\(16),
      O => \r_SM_DISPLAY[2]_i_23_n_0\
    );
\r_SM_DISPLAY[2]_i_24\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(3),
      I1 => r_PIXEL_COUNTER_reg(2),
      I2 => r_PIXEL_COUNTER_reg(1),
      O => \r_SM_DISPLAY[2]_i_24_n_0\
    );
\r_SM_DISPLAY[2]_i_25\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(7),
      I1 => r_PIXEL_COUNTER_reg(28),
      I2 => r_PIXEL_COUNTER_reg(9),
      I3 => r_PIXEL_COUNTER_reg(18),
      O => \r_SM_DISPLAY[2]_i_25_n_0\
    );
\r_SM_DISPLAY[2]_i_26\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(25),
      I1 => r_PIXEL_COUNTER_reg(22),
      I2 => r_PIXEL_COUNTER_reg(29),
      I3 => r_PIXEL_COUNTER_reg(21),
      O => \r_SM_DISPLAY[2]_i_26_n_0\
    );
\r_SM_DISPLAY[2]_i_27\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => r_PIXEL_COUNTER_reg(4),
      I1 => r_PIXEL_COUNTER_reg(19),
      I2 => r_PIXEL_COUNTER_reg(8),
      I3 => r_PIXEL_COUNTER_reg(16),
      O => \r_SM_DISPLAY[2]_i_27_n_0\
    );
\r_SM_DISPLAY[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I1 => \r_SM_DISPLAY_reg_n_0_[1]\,
      I2 => \r_SM_DISPLAY_reg_n_0_[0]\,
      O => \r_SM_DISPLAY[2]_i_4_n_0\
    );
\r_SM_DISPLAY[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \r_SM_DISPLAY[2]_i_17_n_0\,
      I1 => \r_SM_DISPLAY[2]_i_18_n_0\,
      I2 => \r_SM_DISPLAY[2]_i_19_n_0\,
      I3 => \r_SM_DISPLAY[2]_i_20_n_0\,
      I4 => \r_SM_DISPLAY[2]_i_21_n_0\,
      I5 => \r_SM_DISPLAY[2]_i_22_n_0\,
      O => \r_SM_DISPLAY[2]_i_7_n_0\
    );
\r_SM_DISPLAY[2]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \r_COM_COUNTER_reg__0\(27),
      I1 => \r_COM_COUNTER_reg__0\(20),
      I2 => \r_COM_COUNTER_reg__0\(15),
      I3 => \r_SM_DISPLAY[2]_i_23_n_0\,
      O => \r_SM_DISPLAY[2]_i_8_n_0\
    );
\r_SM_DISPLAY[2]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \r_SM_DISPLAY[2]_i_24_n_0\,
      I1 => \r_SM_DISPLAY[2]_i_25_n_0\,
      I2 => r_PIXEL_COUNTER_reg(13),
      I3 => r_PIXEL_COUNTER_reg(14),
      I4 => r_PIXEL_COUNTER_reg(17),
      O => \r_SM_DISPLAY[2]_i_9_n_0\
    );
\r_SM_DISPLAY_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => '1',
      D => I2C_CONTROLLER_n_2,
      Q => \r_SM_DISPLAY_reg_n_0_[0]\,
      R => '0'
    );
\r_SM_DISPLAY_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => '1',
      D => I2C_CONTROLLER_n_1,
      Q => \r_SM_DISPLAY_reg_n_0_[1]\,
      R => '0'
    );
\r_SM_DISPLAY_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => '1',
      D => I2C_CONTROLLER_n_0,
      Q => \r_SM_DISPLAY_reg_n_0_[2]\,
      R => '0'
    );
r_START_PIXEL_DATA_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \r_SM_DISPLAY_reg_n_0_[0]\,
      I1 => \r_SM_DISPLAY_reg_n_0_[2]\,
      I2 => \r_SM_DISPLAY_reg_n_0_[1]\,
      O => r_START_PIXEL_DATA_i_4_n_0
    );
r_START_PIXEL_DATA_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => w_CLOCK_OUT1,
      CE => '1',
      D => I2C_CONTROLLER_n_41,
      Q => r_START_PIXEL_DATA,
      R => '0'
    );
end STRUCTURE;
