library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_keypad is
    port (
        -- clock
        i_clock  : in    std_logic;

        -- keypad
        i_keypad_col1   : in    std_logic;
        i_keypad_col2   : in    std_logic;
        i_keypad_col3   : in    std_logic;
        i_keypad_col4   : in    std_logic;

        o_keypad_row1   : inout std_logic;
        o_keypad_row2   : inout std_logic;
        o_keypad_row3   : inout std_logic;
        o_keypad_row4   : inout std_logic;

        -- led
        o_led1  : out   std_logic;
        o_led2  : out   std_logic;
        o_led3  : out   std_logic;
        o_led4  : out   std_logic
    );
end top_keypad;

architecture rtl of top_keypad is

    signal r_COL_PINS : std_logic_vector(3 downto 0) := (
        i_keypad_col1,
        i_keypad_col2,
        i_keypad_col3,
        i_keypad_col4
    );

    signal r_ROW_PINS : std_logic_vector(3 downto 0) := (
        o_keypad_row1,
        o_keypad_row2,
        o_keypad_row3,
        o_keypad_row4
    );

    constant c_KEY_AMOUNT : integer := 16;
    signal r_KEYS : std_logic_vector(c_KEY_AMOUNT - 1 downto 0) := (others => '0');

    signal r_LED_KEY : std_logic_vector(3 downto 0) := (others => '0');

begin
    KEYPAD : entity work.keypad
        port map (
            i_clck => i_clock,

            o_column_pins   => r_COL_PINS,
            i_row_pins  	=> r_ROW_PINS,

            o_keys => r_KEYS
        );

    process (i_clock) is
    begin
        r_LED_KEY <= "0000";
        for i in 0 to c_KEY_AMOUNT-1 loop
            if r_KEYS(i) = '1' then
                r_LED_KEY <= std_logic_vector(to_unsigned(i, r_LED_KEY'length));
            end if;
        end loop;
    end process;

    o_led1 <= r_LED_KEY(0);
    o_led2 <= r_LED_KEY(1);
    o_led3 <= r_LED_KEY(2);
    o_led4 <= r_LED_KEY(3);
end rtl;