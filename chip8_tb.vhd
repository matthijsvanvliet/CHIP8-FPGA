library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity chip8_tb is
end chip8_tb;

architecture behave of chip8_tb is

    component chip8
        port (
            -- clock
            i_clck      : in    std_logic;

            -- keypad
            i_rows  : inout    std_logic_vector(3 downto 0);
            i_cols  : inout    std_logic_vector(3 downto 0);

            -- oled
            o_oled_scl  : inout   std_logic;
            o_oled_sda  : inout   std_logic
        );
    end component chip8;

    -- Clock signals
    signal r_CLOCK_TB  : std_logic := '0';

    -- Input keys
    signal r_ROWS       : std_logic_vector(1 to 4) := (others => '0');
    signal w_COLUMS     : std_logic_vector(1 to 4);

    signal w_SCL    : std_logic;
    signal w_SDA    : std_logic;

begin

    DUT : chip8
        port map (
            -- clock
            i_clck      => r_CLOCK_TB,

            -- keypad
            i_rows      => r_ROWS,
            i_cols      => w_COLUMS,

            -- oled
            o_oled_scl  => w_SCL,
            o_oled_sda  => w_SDA
        );

    p_CLOCK_TB : process is
    begin
        r_CLOCK_TB <= not r_CLOCK_TB;
        wait for 10 ns; -- 100 MHz
    end process p_CLOCK_TB;

end behave;