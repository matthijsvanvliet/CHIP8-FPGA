library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keypad_tb is
end entity keypad_tb;

architecture behave of keypad_tb is

    component top_keypad
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
    end component top_keypad;

    signal r_CLOCK : std_logic := '0';

    signal r_KEYPAD_COL1 : std_logic := '0';
    signal r_KEYPAD_COL2 : std_logic := '0';
    signal r_KEYPAD_COL3 : std_logic := '0';
    signal r_KEYPAD_COL4 : std_logic := '0';

    signal w_KEYPAD_ROW1 : std_logic;
    signal w_KEYPAD_ROW2 : std_logic;
    signal w_KEYPAD_ROW3 : std_logic;
    signal w_KEYPAD_ROW4 : std_logic;

    signal w_LED1 : std_logic;
    signal w_LED2 : std_logic;
    signal w_LED3 : std_logic;
    signal w_LED4 : std_logic;

begin

    DUT : top_keypad 
    port map (
        -- clock
        i_clock => r_CLOCK,

        -- keypad
        i_keypad_col1 => r_KEYPAD_COL1,
        i_keypad_col2 => r_KEYPAD_COL2,
        i_keypad_col3 => r_KEYPAD_COL3,
        i_keypad_col4 => r_KEYPAD_COL4,

        o_keypad_row1 => w_KEYPAD_ROW1, 
        o_keypad_row2 => w_KEYPAD_ROW2,
        o_keypad_row3 => w_KEYPAD_ROW3,
        o_keypad_row4 => w_KEYPAD_ROW4,

        -- led
        o_led1 => w_LED1,
        o_led2 => w_LED2,
        o_led3 => w_LED3,
        o_led4 => w_LED4
    );

    p_CLOCK : process is
    begin
        r_CLOCK <= not r_CLOCK;
        wait for 10 ns / 2; -- 100 MHz
    end process p_CLOCK;

    process is
    begin
        r_KEYPAD_COL1 <= '1';

        wait;
    end process;

end behave;