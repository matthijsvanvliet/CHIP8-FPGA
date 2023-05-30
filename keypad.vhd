library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keypad is
    port (
        -- clock
        i_clck          : in    std_logic;

        -- input pins
        o_column_pins   : inout std_logic_vector(3 downto 0);
        i_row_pins      : in    std_logic_vector(3 downto 0);

        -- output keys
        o_keys          : out   std_logic_vector(15 downto 0)
    );
end keypad;

architecture arch_keypad of keypad is
    signal r_COLUMN : std_logic_vector(1 downto 0) := "00"; -- bits

    function IsRowPinLow(
        row_pin : std_logic
    )
        return std_logic is
            variable result : std_logic := '0';
    begin
        if row_pin = '0' then
            result := '1';
        else
            result := '0';
        end if;
        return result;
    end IsRowPinLow;

begin

    process is
    begin
        o_column_pins <= "1110";
        o_keys <= (others => '0');
        wait;
    end process;

    p_GET_KEYS : process (i_clck) is
    begin
        if rising_edge(i_clck) then
            for i in 0 to 3 loop
                o_keys(i * 4 + to_integer(unsigned(r_COLUMN))) <= isRowPinLow(i_row_pins(i));
            end loop;
            r_COLUMN <= std_logic_vector(unsigned(r_COLUMN) + 1 mod 4);
            o_column_pins <= std_logic_vector(shift_left(unsigned(o_column_pins), 1) + shift_right(unsigned(o_column_pins), 3));
        end if;
    end process p_GET_KEYS;
end arch_keypad;