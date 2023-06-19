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

        -- incoming display buffer
        i_buffer        : in std_logic_vector((g_DISPLAY_BUFFER_WIDTH - 1) downto 0);
        i_buffer_sel    : in std_logic_vector(7 downto 0);   

        -- oled
        o_oled_scl  : inout std_logic;
        o_oled_sda  : inout std_logic
    );
    end component display;

    signal r_CLOCK  : std_logic := '0';

    signal w_OLED_SCL  : std_logic;
    signal w_OLED_SDA  : std_logic;

begin

    DUT : display
    port map (
        -- clock
        i_clck      => r_CLOCK,

        -- buffer
        

        -- oled
        o_oled_scl  => w_OLED_SCL,
        o_oled_sda  => w_OLED_SDA,
    );

    p_CLOCK : process is
    begin
        r_CLOCK <= not r_CLOCK;
        wait for 10 ns / 2; -- 100 MHz
    end process p_CLOCK;

end behave;