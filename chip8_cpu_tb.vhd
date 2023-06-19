library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity chip8_cpu_tb is
end chip8_cpu_tb;

architecture behave of chip8_cpu_tb is

    component chip8_cpu
        port (
            -- clock
            i_clck      : in    std_logic;

            -- input keys
            i_keys      : in    std_logic_vector(0 to 15);

            -- output buffer
            o_buffer        : out   std_logic_vector(63 downto 0);
            o_buffer_sel    : out   std_logic_vector(4 downto 0)
        );
    end component chip8_cpu;

    -- Clock signals
    signal r_CLOCK_TB  : std_logic := '0';

    -- Input keys
    signal r_KEYS : std_logic_vector(0 to 15) := (others => '0');

    signal w_BUFFER : std_logic_vector(63 downto 0);
    signal w_BUFFER_SEL : std_logic_vector(4 downto 0);

begin

    DUT : chip8_cpu
        port map (
            -- clock
            i_clck  => r_CLOCK_TB,

            -- input keys
            i_keys => r_KEYS,

            -- buffer
            o_buffer => w_BUFFER,
            o_buffer_sel => w_BUFFER_SEL
        );

    p_CLOCK_TB : process is
    begin
        r_CLOCK_TB <= not r_CLOCK_TB;
        wait for 250 ns; -- 4 MHz
    end process p_CLOCK_TB;

    process is
    begin
        r_KEYS(1) <= '1';
        wait;
    end process;

end behave;