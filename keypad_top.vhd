library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keypad_top is
    port (
        i_clck  : in    std_logic;
        o_led   : out   std_logic_vector(3 downto 0);

        i_rows  : inout    std_logic_vector(3 downto 0);
        i_cols  : inout    std_logic_vector(3 downto 0)
    );
end keypad_top;

architecture rtl of keypad_top is

    signal r_RESET_N    : std_logic := '0';
    signal r_ROWS       : std_logic_vector(1 to 4) := (others => '0');
    signal w_COLUMS     : std_logic_vector(1 to 4);
    signal w_KEYS       : std_logic_vector(0 to 15);

begin
    KEYPAD : entity work.pmod_keypad
    generic map (
        clk_freq    => 100_000_000,  --system clock frequency in Hz
        stable_time => 10         --time pressed key must remain stable in ms
    )
    port map (
        clk     => i_clck,
        reset_n => r_RESET_N,
        rows    => r_ROWS,
        columns => w_COLUMS,
        keys    => w_KEYS
    );

    r_ROWS(1) <= i_rows(3);
    r_ROWS(2) <= i_rows(2);
    r_ROWS(3) <= i_rows(1);
    r_ROWS(4) <= i_rows(0);

    w_COLUMS(1) <= i_cols(3);
    w_COLUMS(2) <= i_cols(2);
    w_COLUMS(3) <= i_cols(1);
    w_COLUMS(4) <= i_cols(0);

    p_DRIVE_LED : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            r_RESET_N <= '1';
            if w_KEYS(15) = '1' then
                o_led(0) <= '1';
            else
                o_led(0) <= '0';
            end if;
        end if;
    end process p_DRIVE_LED;

end rtl;