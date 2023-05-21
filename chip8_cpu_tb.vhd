library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity chip8_cpu_tb is
end chip8_cpu_tb;

architecture behave of chip8_cpu_tb is

    component chip8_cpu
        port (
            -- clock
            i_clck      : in    std_logic
        );
    end component chip8_cpu;

    -- Clock signals
    signal r_CLOCK_TB  : std_logic := '0';

begin

    DUT : chip8_cpu
        port map (
            -- clock
            i_clck  => r_CLOCK_TB
        );

    p_CLOCK_TB : process is
    begin
        r_CLOCK_TB <= not r_CLOCK_TB;
        wait for 250 ns; -- 4 MHz
    end process p_CLOCK_TB;

end behave;