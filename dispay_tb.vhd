library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_tb is
end display_tb;

architecture behave of display_tb is

    component display is
    port (
        -- clock
        i_clck      : in    std_logic;

        -- oled
        o_oled_gnd  : out   std_logic;
        o_oled_vcc  : out   std_logic;
        o_oled_scl  : inout std_logic;
        o_oled_sda  : inout std_logic
    );
    end component display;

    signal r_CLOCK  : std_logic := '0';

    signal w_OLED_GND  : std_logic;
    signal w_OLED_VCC  : std_logic;
    signal w_OLED_SCL  : std_logic;
    signal w_OLED_SDA  : std_logic;

    constant c_CLOCK_FREQ   : integer   := 40_000_000;

begin

    DUT : display
    port map (
        -- clock
        i_clck      => r_CLOCK,
        -- oled
        o_oled_gnd  => w_OLED_GND,
        o_oled_vcc  => w_OLED_VCC,
        o_oled_scl  => w_OLED_SCL,
        o_oled_sda  => w_OLED_SDA
    );

    p_CLOCK : process is
    begin
        r_CLOCK <= not r_CLOCK;
        wait for 12.5 ns;
    end process p_CLOCK;

end behave;